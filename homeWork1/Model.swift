//
//  Model.swift
//  homeWork1
//
//  Created by Chinara on 5/15/23.
//

import Foundation

struct Welcome: Codable {
    let products: [Product]
    let total, skip, limit: Int
}


struct Product: Codable {
    let id: Int
    let title, description: String
    let price: Int
    let discountPercentage, rating: Double
    let stock: Int
    let brand, category: String
    let thumbnail: String
    let images: [String]
}
