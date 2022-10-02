//
//  Product.swift
//  HGCase
//
//  Created by Burak AKCAN on 3.09.2022.
//

import Foundation


// MARK: - Product
struct Product: Codable,Hashable {
    let id: Int
    let title: String
    let price: Double
    let productDescription: String
    let category: Category
    let image: String
    let rating: Rating

    enum CodingKeys: String, CodingKey {
        case id, title, price
        case productDescription = "description"
        case category, image, rating
    }
}

enum Category: String, Codable,Hashable {
    case electronics    = "electronics"
    case jewelery       = "jewelery"
    case menSClothing   = "men's clothing"
    case womenSClothing = "women's clothing"
}

// MARK: - Rating
struct Rating: Codable,Hashable {
    let rate: Double
    let count: Int
}

typealias Products = [Product]
