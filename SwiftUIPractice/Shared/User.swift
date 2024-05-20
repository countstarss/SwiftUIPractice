//
//  User.swift
//  SwiftUIPractice
//
//  Created by 王佩豪 on 2024/5/14.
//

import Foundation

struct UserArray:Codable {
    let users: [User]
    let total,skip,limit : Int
}

// MARK: - Users
struct User: Codable,Identifiable {
    let id: Int
    let firstName, lastName, maidenName: String
    let age: Int
    let gender, email, phone, username: String
    let image: String
    let height:Int
    
    var work : String {
        "work as some job"
    }
    var education :String{
        "Graduate Degree"
    }
    var aboutMe : String {
        "this is a sentense ablut me that will look good on my profile"
    }
    
    var basics : [UserInterest]{
        [
            UserInterest(iconName: "ruler", emoji: nil, text: "\(height)"),
            UserInterest(iconName: "graduationcap", emoji: nil, text: "education"),
            UserInterest(iconName: "wineglass", emoji: nil, text: "Socially"),
            UserInterest(iconName: "moon.star.fill", emoji: nil, text: "Virgo")
        ]
    }
    var interests : [UserInterest]{
        [
            UserInterest(iconName: nil, emoji: "🤡", text: "joker"),
            UserInterest(iconName: nil, emoji: "👹", text: "joker"),
            UserInterest(iconName: nil, emoji: "🎧", text: "Music"),
            UserInterest(iconName: nil, emoji: "🥺", text: "Virgo")
        ]
    }
    var images : [String] {
        [
        "https://picsum.photos/id/101/300/300",
        "https://picsum.photos/id/109/300/300",
        "https://picsum.photos/id/300/300/300",
        "https://picsum.photos/id/102/300/300"
        ]
    }
    
    static var mock : User {
        User(
             id: 1342,
             firstName: "King",
             lastName: "Luke",
             maidenName: "",
             age: 24,
             gender: "male",
             email: "lukeking404@icloud.com",
             phone: "13835472064",
             username: "lukeking", 
             image: Constants.randomImage, height: 168
        )
    }
    
    
}
