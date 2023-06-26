//
//  GetProuctRequestFactory.swift
//  ShopGB
//
//  Created by Irina on 26.06.2023.
//

import Foundation
import Alamofire

protocol GetProductRequestFactory {
    func getListProducts(pageNumber: Int, idCategory: Int, completion: @escaping (AFDataResponse<[Product]>) -> Void)
    func getProductById(productId: Int, completion: @escaping (AFDataResponse<ProductResult>) -> Void)
}
