//
//  File.swift
//  SwiftUIPractice
//
//  Created by 王佩豪 on 2024/5/14.
//

import Foundation

struct ProductArray:Codable {
    let products : [Product]
    let total,skip,limit : Int
}

// MARK: - Product
struct Product: Codable,Identifiable {
    let id: Int
    let title, description: String
    let price: Int
    let discountPercentage, rating: Double
    let stock: Int
    let brand, category: String
    let thumbnail: String
    let images: [String]
    
    var firstImage : String {
        images.first ?? Constants.randomImage
    }
    
    static var mock :Product{
        Product(
            id: 123,
            title: "Example prodyct title",
            description: "Product of mock description gose here gose here gose here",
            price: 12,
            discountPercentage: 8,
            rating: 0.89,
            stock: 1200,
            brand: "Nike",
            category: "Aport",
            thumbnail: Constants.randomImage,
            images: [Constants.randomImage,Constants.randomImage,Constants.randomImage]
        )
    }
}

struct ProductRow :Identifiable{
    let id = UUID().uuidString
    let title:String
    let products :[Product]
}
