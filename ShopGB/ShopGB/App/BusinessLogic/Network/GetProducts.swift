//
//  GetProducts.swift
//  ShopGB
//
//  Created by Irina on 26.06.2023.
//

import Foundation
import Alamofire

final class GetProducts: AbstractRequestFactory {
    
    var errorParser: AbstractErrorParser
    var sessionManager: Session
    var queue: DispatchQueue
    let baseUrl = URL(string: "https://raw.githubusercontent.com/GeekBrainsTutorial/online-store-api/master/responses/")!
    
    init(errorParser: AbstractErrorParser, sessionManager: Session, queue: DispatchQueue = DispatchQueue.global(qos: .utility)) {
        self.errorParser = errorParser
        self.sessionManager = sessionManager
        self.queue = queue
    }
}

extension GetProducts: GetProductRequestFactory {
   
    func getListProducts(pageNumber: Int, idCategory: Int, completion: @escaping (AFDataResponse<[Product]>) -> Void) {
        
        let requestModel = CatalogData(baseUrl: baseUrl, pageNumber: pageNumber, idCategory: idCategory)
        
        request(request: requestModel, completionHandler: completion)
    }
    
    func getProductById(productId: Int, completion: @escaping (AFDataResponse<ProductResult>) -> Void) {
        
        let requestModel = ProductRequest(baseUrl: baseUrl, productId: productId)
        
        request(request: requestModel, completionHandler: completion)
    }
}

extension GetProducts {
    struct CatalogData: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path: String = "catalogData.json"
        
        let pageNumber: Int
        let idCategory: Int
        var parameters: Parameters? {
            return [
                "page_number": pageNumber,
                "id_category": idCategory]
        }
    }
}

extension GetProducts {
    struct ProductRequest: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path: String = "getGoodById.json"
        
        let productId: Int
        var parameters: Parameters? {
            return [
                "id_product": productId,
            ]
        }
    }
}
