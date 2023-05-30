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
    let title, description: String?
    let thumbnail: String?
    
    init(id: Int, title: String, description: String? = nil, thumbnail: String? = nil) {
        self.id = id
        self.title = title
        self.description = description
        self.thumbnail = thumbnail
    }
}
