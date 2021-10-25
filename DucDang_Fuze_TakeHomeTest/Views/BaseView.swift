//
//  BaseView.swift
//  DucDang_Fuze_TakeHomeTest
//
//  Created by duc on 2021-10-24.
//

import Foundation

import SwiftUI

struct BaseView: View {
    
    @StateObject var tweetModel : TweetViewModel
    
    var body: some View {
            ZStack {
                TabView() {
                    FeedView(tweetModel: tweetModel).tabItem {
                        Image(systemName: "house")
                    }.tag(0)
                    Text("Search").tabItem {
                        Image(systemName: "magnifyingglass")
                    }.tag(1)
                    Text("Notification").tabItem {
                        Image(systemName: "bell")
                    }.tag(2)
                    Text("Messsage").tabItem {
                        Image(systemName: "envelope")
                    }.tag(3)
                }.accentColor(Color.twitterBlue)
            }
            .overlay(ExpandingModal(isActive: $tweetModel.isNewTweetActivated, content: NewTweetView( tweetModel: tweetModel)))
        }
}
