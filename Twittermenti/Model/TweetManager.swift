//
//  TweetModel.swift
//  Twittermenti
//
//  Created by Taylor Patterson on 5/23/20.
//  Copyright © 2020 Taylor Patterson. All rights reserved.
//

import Foundation
import CoreML
import SwifteriOS
import SwiftyJSON

protocol TweetManagerDelegate {
    func updateUI(with sentimentScore: Int)
}

struct TweetManager {
    
    var delegate: TweetManagerDelegate?
    let sentimentClassifier = TweetSentimentClassifier()
    let tweetCount = 100

    func getPlist(withName name: String) -> [String]? {
        if let path = Bundle.main.path(forResource: name, ofType: "plist"),
            let xml = FileManager.default.contents(atPath: path) {
            return (try? PropertyListSerialization.propertyList(from: xml, options: .mutableContainersAndLeaves, format: nil)) as? [String]
        }
        return nil
    }

    func fetchTweets(id: String) {
        guard let secrets = getPlist(withName: "Secrets") else {
            fatalError("Error trying to gather information from Plist file.")
        }
        
        let swifter = Swifter(consumerKey: secrets[1], consumerSecret: secrets[0])
        
        swifter.searchTweet(using: id, lang: "en", count: tweetCount, tweetMode: .extended, success: { (results, metadata) in
            
            var tweets = [TweetSentimentClassifierInput]()
            
            for i in 0..<self.tweetCount {
                if let tweet = results[i]["full_text"].string {
                    let tweetForClassification = TweetSentimentClassifierInput(text: tweet)
                    tweets.append(tweetForClassification)
                }
            }
            
            self.tweetPredcition(with: tweets)
            
        }) { (error) in
            print("There was an error with Twitter API request: \(error)")
        }
        
    }
    
    func tweetPredcition (with tweets: [TweetSentimentClassifierInput]) {
        
        do {
            let predicitions = try self.sentimentClassifier.predictions(inputs: tweets)
            var sentimentScore = 0
            for prediction in predicitions {
                let sentiment = prediction.label
                if sentiment == "Pos" {
                    sentimentScore += 1
                } else if sentiment == "Neg" {
                    sentimentScore -= 1
                }
                delegate?.updateUI(with: sentimentScore)
            }
            
        } catch {
            print("Error making prediction \(error).")
        }
    }

}
