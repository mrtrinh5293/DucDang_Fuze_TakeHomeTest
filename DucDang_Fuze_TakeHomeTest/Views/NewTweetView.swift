//
//  NewTweetView.swift
//  DucDang_Fuze_TakeHomeTest
//
//  Created by duc on 2021-10-24.
//

import SwiftUI

struct NewTweetView: View {

    @StateObject var tweetModel : TweetViewModel
    
    @State private var newTweety: String = ""
    
    var body: some View {
        VStack {
            Text("Add New Tweet")
            
            TextField("Add New Tweet", text: $newTweety)
                .padding(5)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .strokeBorder(Color.twitterBlue, lineWidth: 1.8)
                )
            if tweetModel.alertMess {
                Text("*Fiel cannot be empty")
                    .foregroundColor(.red)
                    .font(.system(size: 15))
            }
            HStack {
                Button(action: {
                    if !newTweety.isEmpty {
                        tweetModel.addNewTweet(newTweety: newTweety)
                        tweetModel.isNewTweetActivated = false
                        tweetModel.alertMess = false
                    } else {
                        tweetModel.alertMess = true
                    }

                }) {
                    Text("Tweet")
                        .padding(5)
                            .background(Color.twitterBlue)
                            .cornerRadius(10)
                            .foregroundColor(.white)
                            .font(.title)
                }
                
                Button(action: {
                    tweetModel.isNewTweetActivated = false
                    tweetModel.alertMess = true
                }) {
                    
                    Text("Cancel")
                        .padding(5)
                            .background(Color.twitterBlue)
                            .cornerRadius(10)
                            .foregroundColor(.white)
                            .font(.title)
                }
            }
        }
        .padding()
    }
}
