//
//  TweetRowView.swift
//  DucDang_Fuze_TakeHomeTest
//
//  Created by duc on 2021-10-24.
//

import SwiftUI

struct TweetRowView: View {
    var tweet: Tweety
    
    var body: some View {
        HStack(alignment: .center) {
            Image(systemName: "person.crop.circle.fill")
                .font(.system(size: 55))
                .foregroundColor(Color.twitterBlue)
            
            VStack(alignment: .leading) {
                Text(tweet.username ?? "username")
                    .font(.system(size: 16, weight: .bold, design: .default))
                    .padding(.vertical, 2)
                Text(tweet.text ?? "textext")
                    .padding(.bottom, 2)
                HStack {
                    Image(systemName: "message")
                    Text("\(tweet.numOfComments)")
                    Spacer()
                    Image(systemName: "arrow.2.squarepath")
                    Text("\(tweet.numOfRetweets)")
                    Spacer()
                    Image(systemName: "heart")
                    Text("\(tweet.numOfLikes)")
                    Spacer()
                    Image(systemName: "square.and.arrow.up")
                }
            }
        }
    }
}
