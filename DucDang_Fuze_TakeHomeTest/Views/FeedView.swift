//
//  FeedView.swift
//  DucDang_Fuze_TakeHomeTest
//
//  Created by duc on 2021-10-24.
//
import SwiftUI

struct FeedView: View {
    @StateObject var tweetModel : TweetViewModel
    @AppStorage("isAuthenticated") var isAuthenticated : Bool = false
    @FetchRequest(
        entity: Tweety.entity(),
        sortDescriptors: [NSSortDescriptor(keyPath: \Tweety.date, ascending: false)]
    ) var tweety: FetchedResults<Tweety>
    
    var body: some View {
        NavigationView {
            List {
                ForEach(tweety){ tweet in
                    TweetRowView(tweet: tweet)
                }
            }
            .navigationBarHidden(false)
            .navigationTitle("FweeTzer")
            .navigationBarItems(
                leading: Reuseable_Button_Icon(iconName: "arrow.down.left.circle.fill", buttonAction: {
                    isAuthenticated = false
                })
                ,trailing:
                Reuseable_Button_Icon(iconName: "pencil", buttonAction: {
                    tweetModel.isNewTweetActivated = true
                })
            )
        }
    }
}
