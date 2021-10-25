//
//  Tweet.swift
//  DucDang_Fuze_TakeHomeTest
//
//  Created by duc on 2021-10-24.
//

import Foundation

struct Tweet: Identifiable, Equatable, Hashable {
    let id = UUID()
    let username: String
    let text: String
    let numOfComments: Int
    let numOfLikes: Int
    let numOfRetweets: Int
    let date : Date
    
    static func > (lhs: Tweet, rhs: Tweet) -> Bool {
        return lhs.date > rhs.date
    }
    
    
}
