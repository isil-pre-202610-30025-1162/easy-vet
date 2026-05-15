//
//  ProductDto.swift
//  EasyVet
//
//  Created by Jorge Mayta on 14/05/26.
//

struct ProductDto: Decodable {
    let id: Int
    let title: String
    let price: Double
    let description: String
    let image: String
    let category: String
    let rating: Double
    let stock: Int
}


nonisolated struct ProductsResponseDto: Decodable {
    let count: Int
    let products: [ProductDto]
    
    enum CodingKeys: String, CodingKey {
        case count
        case products = "results"
    }
}
