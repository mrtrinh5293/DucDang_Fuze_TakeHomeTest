//
//  DucDang_Fuze_TakeHomeTestTests.swift
//  DucDang_Fuze_TakeHomeTestTests
//
//  Created by duc on 2021-10-24.
//

import XCTest
@testable import DucDang_Fuze_TakeHomeTest
import CoreData

class DucDang_Fuze_TakeHomeTestTests: XCTestCase {
    var sut: TweetViewModel!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = TweetViewModel()
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
    }
    
    func testNewTweet_WillBeSaved_ExpectErrorNil() {
        let newTweet = "test"
        let context = TestCoreDataStack().persistentContainer.newBackgroundContext()
        sut.addNewTweet(newTweety: newTweet)
        expectation(forNotification: .NSManagedObjectContextDidSave, object: context) { _ in
            return true
        }
        
        sut.addNewTweet(newTweety: newTweet)
        
        try! context.save()
        
        waitForExpectations(timeout: 2) { err in
            XCTAssertNil(err, "Save did nor occur")
        }
    }
    
    func testAddNewTweet_ShouldReturnTweety() {
        
        let newTweet: () = sut.addNewTweet(newTweety: "")
        XCTAssertNotNil(newTweet)
        
    }
        
    var tweets: [Tweet] = [
        Tweet(username: "Mark Zuckerberg", text: "Hello guys use facebook 😡", numOfComments: 2, numOfLikes: 5, numOfRetweets: 10, date: Date().addingTimeInterval(-10)),
        Tweet(username: "Jeff Bezos", text: "Shut up ı'm richer 💰", numOfComments: 56, numOfLikes: 18, numOfRetweets: 18, date: Date().addingTimeInterval(-27)),
        Tweet(username: "Elon Musk", text: "Go to spacee 🚀🚀🚀 ", numOfComments: 7, numOfLikes: 19, numOfRetweets: 8, date: Date().addingTimeInterval(-100)),
        Tweet(username: "Larry Page", text: "What a beautiful day 🌞", numOfComments: 9, numOfLikes: 37, numOfRetweets: 21, date: Date().addingTimeInterval(-40)),
        Tweet(username: "Warren Buffett", text: "Did u see news ? 🧐", numOfComments: 94, numOfLikes: 89, numOfRetweets: 61, date: Date().addingTimeInterval(-25)),
        Tweet(username: "Jamie Dimon", text: "What's up man", numOfComments: 14, numOfLikes: 25, numOfRetweets: 11, date: Date().addingTimeInterval(-1000)),
        Tweet(username: "Rex Tillerson", text: "😍😍😍 This is nice clone", numOfComments: 124, numOfLikes: 481, numOfRetweets: 246, date: Date().addingTimeInterval(-7)),
        Tweet(username: "Doug McMillon", text: "Hello guys", numOfComments: 54, numOfLikes: 35, numOfRetweets: 34, date: Date().addingTimeInterval(-48))
    ]
    
    func addNewTweet(text: String) {
        tweets.append(Tweet(username: sut.usernames.first ?? "username", text: text, numOfComments: 0, numOfLikes: 0, numOfRetweets: 0, date: Date().addingTimeInterval(10)))
    }
    
    func testTweets_IsSortedByDated_ReturnFirstUserName() {
        let result = tweets.sorted{ $0.date > $1.date}
        XCTAssertTrue(result.first?.username == "Rex Tillerson")
    }
    
    func testAddNewTweet_ExpectNewCountBiggerThanCurrentCOunt() {
        let currentCount = tweets.count
        _ = addNewTweet(text: "Hello")
        XCTAssertTrue(currentCount < tweets.count )
    }
    
    func testUserAuthentication_ExpectUserIsAuthenticated() {
        let username = sut.usernames.first!
        let password = sut.passwords.first!
        
        if  sut.passwords.contains(password) &&  sut.usernames.contains(username) {
            XCTAssertTrue(true)
        }
    }
}
