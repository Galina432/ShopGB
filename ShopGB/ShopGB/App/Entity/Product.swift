//
//  Product.swift
//  ShopGB
//
//  Created by Irina on 26.06.2023.
//

import Foundation

struct Product: Codable {
    let id: Int
    let productName: String
    let productPrice: Int
    
    enum CodingKeys: String, CodingKey {
        case id = "id_product"
        case productName = "product_name"
        case productPrice = "price"
    }
}
