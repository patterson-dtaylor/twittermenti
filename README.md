# Twittermenti

<p align="center">
<img src="Documentation/twittermenti-HS.png" width="230"  title="Twittermenti App">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="Documentation/goodprediction.png" width="230" title="Twittermenti App">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="Documentation/badprediction.png" width="230" title="Twittermenti App">
</p>

## Author

Taylor Patterson

## Description

Twittermenti is a super fun app that searches for negative, positive, or neutral sentiments of Twitter handles and Twitter hashtags.  Twittermenti then takes the search query and turns the findings, using the machine learning model, into emojis that emote the nature of the search.  

## Tools Used

<p align="left">
<img src="https://abs.twimg.com/a/1404172626/images/oauth_application.png" width="100" title="Twitter Developer Icon">
</p>

**Twitter API** - Twitter's API is a powerful API that allows Twitter developers to develop apps.

**How I Used Twitter's API** - Twittermenti uses Twitter's API to query a list of most recent 100 tweets when searching a hashtag or username.  

For more info on **Twitter API** click [here](https://developer.twitter.com/en/docs)

**SwiftyJSON** - A cocoapod that make it easier to deal with JSON data in swift. 

**How I used SwiftyJSON** - I used SwiftyJSON to render JSON data from Twitter's API and render said data to the controller. Although Swift can manage JSON data well with its JSON decoder Object, I wanted to branch out and learn another way to decode JSON data using a cocoapod.  

For more info on **SwiftyJSON** click [here](https://cocoapods.org/pods/SwiftyJSON)

<p align="left">
<img src="https://www.kaggle.com/static/images/site-logo.png" width="100" title="Twitter Developer Icon">
</p>

**Kaggle Sentiment140 Dataset** - A dataset based on Sanders' tweet sentiment dataset.  

**How I used Kaggle** - I used the dataset as a part of the machine learning aspect of Twittermenti's ability to judge the sentiment of the first 100 tweets (+1 for positive, -1 for negative, and 0 for neutral).  After calculating the judgement number, Twittermenti runs a simple switch/case block to render an emoji representing the current mood of the query.