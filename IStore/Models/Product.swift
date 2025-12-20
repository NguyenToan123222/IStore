//
//  Product.swift
//  IStore
//
//  Created by Nguyễn Toàn on 3/9/25.
//

import Foundation


struct ProductResponseArray: Codable {
    let product: [ProductResponse]
    let currentPage: Int
    let totalPages: Int
    let totalProducts: Int
}
struct ProductResponse: Codable, Identifiable {
    
    var id: String
    var user: String
    var name: String
    var descriptionName: String
    var price: Double
    var image: String
    var countInStock: Int
    var views: Int
    var category: String
    var rating: Double
    var numReviews: Int
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case user
        case name
        case descriptionName = "description"
        case price
        case image
        case countInStock
        case views
        case category
        case rating
        case numReviews
    }
    func encode() -> Data? {
        let encoder = JSONEncoder()
        return try? encoder.encode(self)
    }
    
    static func decode(productData: Data) -> ProductResponse? {
        let decoder = JSONDecoder()
        return try? decoder.decode(ProductResponse.self, from: productData)
    }
}

struct EmptyResponse: Codable {
    
}
