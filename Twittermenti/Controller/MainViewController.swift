//
//  ViewController.swift
//  Twittermenti
//
//  Created by Taylor Patterson on 5/22/20.
//  Copyright © 2020 Taylor Patterson. All rights reserved.
//

import UIKit
//import CoreML
//import SwifteriOS
//import SwiftyJSON

class MainViewController: UIViewController {
    @IBOutlet weak var background: UIImageView!
    @IBOutlet weak var emojiLabel: UILabel!
    @IBOutlet weak var searchField: UITextField!
    @IBOutlet weak var predictButton: UIButton! {
        didSet {
            predictButton.layer.cornerRadius = 10
            predictButton.layer.borderWidth = 2
            predictButton.layer.borderColor = UIColor.white.cgColor
        }
    }
    
    var tweetModel = TweetManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tweetModel.delegate = self
    }
    


    @IBAction func predictButtonPressed(_ sender: UIButton) {
        if let textFromSearchField = searchField.text {
            tweetModel.fetchTweets(id: textFromSearchField)
        }
    }
}

//MARK: - TweetManager Delegate

extension MainViewController: TweetManagerDelegate {
    func updateUI(with sentimentScore: Int) {
        switch sentimentScore {
        case 15...50:
            return self.emojiLabel.text = "😍"
        case 6...14:
            return self.emojiLabel.text = "😊"
        case 1...5:
            return self.emojiLabel.text = "🙂"
        case -5...(-1):
            return self.emojiLabel.text = "😕"
        case -14...(-6):
            return self.emojiLabel.text = "😡"
        case -50...(-15):
            return self.emojiLabel.text = "🤬"
        default:
            return self.emojiLabel.text = "😐"
        }
    }
}



