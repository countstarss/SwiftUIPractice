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
//    let password, birthDate: String
    let image: String
//    let bloodGroup: String
//    let height: Int
//    let weight: Double
//    let eyeColor: String
    
    static var mock : User {
        User(
             id: 1341,
             firstName: "King",
             lastName: "Luke",
             maidenName: "",
             age: 24,
             gender: "male",
             email: "lukeking404@icloud.com",
             phone: "13835472064",
             username: "lukeking", 
             image: ""
        )
    }
}
