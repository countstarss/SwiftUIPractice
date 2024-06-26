//
//  DatabaseHelper.swift
//  SwiftUIPractice
//
//  Created by 王佩豪 on 2024/5/14.
//

import Foundation

struct DatabaseHelper {
    func getProducts () async throws -> [Product] {
        guard let url = URL(string: "https://dummyjson.com/products")else{
            throw URLError(.badURL)
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        let products = try JSONDecoder().decode(ProductArray.self, from: data)
        // 第一个是指fetch到的全部数据
        return products.products
    }
    
    func getUsers () async throws -> [User] {
        guard let url = URL(string: "https://dummyjson.com/users")else{
            throw URLError(.badURL)
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        let users = try JSONDecoder().decode(UserArray.self, from: data)
        return users.users
    }
}

