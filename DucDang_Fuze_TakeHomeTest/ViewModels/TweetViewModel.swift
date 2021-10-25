//
//  TweetViewModel.swift
//  DucDang_Fuze_TakeHomeTest
//
//  Created by duc on 2021-10-24.
//
import Foundation
import SwiftUI

final class TweetViewModel: ObservableObject {
    
    @Published var passwords: [String] = ["password"]
    
    @Published var usernames: [String] = ["username"]
    
    @Published var selectedTab = 0
    
    @Published var isNewTweetActivated: Bool = false
    
    @Published var alertMess = false
    
    @Published var newTweet = ""

    
    func addNewTweet(newTweety: String) {
        let newTweet = Tweety(context: PersistenceController.shared.container.viewContext)
        newTweet.id = UUID()
        newTweet.text = newTweety
        newTweet.username = usernames.first
        newTweet.numOfComments = 0
        newTweet.numOfLikes = 0
        newTweet.numOfRetweets = 0
        newTweet.date = Date()

        do {
            try PersistenceController.shared.container.viewContext.save()
        } catch {
            print(error)
        }
    }
    
}

