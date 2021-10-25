//
//  ContentView.swift
//  DucDang_Fuze_TakeHomeTest
//
//  Created by duc on 2021-10-24.
//

import SwiftUI
import CoreData

import SwiftUI

struct ContentView: View {
    @StateObject var tweetVM = TweetViewModel()
    @AppStorage("isAuthenticated") var isAuthenticated : Bool = false
    
    
    var body: some View {
        if isAuthenticated {
            BaseView(tweetModel: tweetVM)
                .animation(.linear)
                .transition(.opacity)
        } else {
            LoginView(usernames: $tweetVM.usernames, passwords: $tweetVM.passwords, isAuthenticated: $isAuthenticated)
                .animation(.linear)
                .transition(.move(edge: .top))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
