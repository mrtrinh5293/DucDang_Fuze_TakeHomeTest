////
////  CoreDataView.swift
////  DucDang_Fuze_TakeHomeTest
////
////  Created by duc on 2021-10-24.
////
//
//import SwiftUI
//
//struct CoreDataView: View {
//    @Environment(\.managedObjectContext) var context
//    @FetchRequest(
//        entity: Tweety.entity(),
//        sortDescriptors: [NSSortDescriptor(keyPath: \Tweety.date, ascending: false)]
//    ) var tweety: FetchedResults<Tweety>
//    
//    @State private var tweetName: String = ""
//    var body: some View {
//        VStack {
//            HStack {
//                TextField("Task Name", text: $tweetName)
//                Button(action: {
//                    self.addTask()
//                }){
//                    Text("Add Task")
//                }
//
//            }
//            ForEach(tweety){ tweet in
//                TweetRow(tweet: tweet)
//            }
//        }
//        
//        
//    }
//    
//    func addTask() {
//        let newTweet = Tweety(context: context)
//        newTweet.id = UUID()
//        newTweet.text = tweetName
//        newTweet.username = tweetName
//        newTweet.numOfComments = 0
//        newTweet.numOfLikes = 0
//        newTweet.numOfRetweets = 0
//        newTweet.date = Date()
//
//        do {
//            try context.save()
//        } catch {
//            print(error)
//        }
//    }
//}
//
//struct CoreDataView_Previews: PreviewProvider {
//    static var previews: some View {
//        CoreDataView()
//    }
//}
