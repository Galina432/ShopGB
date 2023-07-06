//
//  Basket.swift
//  ShopGB
//
//  Created by Irina on 05.07.2023.
//

import Foundation
import Alamofire

class Basket: AbstractRequestFactory {
    let errorParser: AbstractErrorParser
    let sessionManager: Session
    let queue: DispatchQueue
    let baseUrl = URL(string: "https://raw.githubusercontent.com/GeekBrainsTutorial/online-store-api/master/responses/")!
    
    init(
        errorParser: AbstractErrorParser,
        sessionManager: Session,
        queue: DispatchQueue = DispatchQueue.global(qos: .utility)) {
            self.errorParser = errorParser
            self.sessionManager = sessionManager
            self.queue = queue
        }
}

extension Basket: BasketRequestFactory {
    func addToBasket(idProduct: Int, quantity: Int, completionHandler: @escaping (Alamofire.AFDataResponse<AddToBasketResult>) -> Void) {
        let requestModel = AddBasket(baseUrl: baseUrl, idProduct: idProduct, quantity: quantity)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
    
    func deleteFromBasket(idProduct: Int, completionHandler: @escaping (Alamofire.AFDataResponse<DeleteFromBasketResult>) -> Void) {
        let requestModel = RemoveBasket(baseUrl: baseUrl, idProduct: idProduct)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
    
    func payBasket(totalCost: Int, completionHandler: @escaping (AFDataResponse<PayBasketResult>) -> Void) {
            let requestModel = PayBasket(baseUrl: baseUrl, totalCost: totalCost)
            self.request(request: requestModel, completionHandler: completionHandler)
        }
    
}

extension Basket {
    struct RemoveBasket: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path: String = "deleteFromBasket.json"
        let idProduct: Int
        var parameters: Parameters? {
            return [
                "id_product": idProduct
            ]
        }
    }
}

extension Basket {
    struct AddBasket: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path: String = "addToBasket.json"
        let idProduct: Int
        let quantity: Int
        var parameters: Parameters? {
            return [
                "id_product": idProduct,
                "quantity": quantity
            ]
        }
    }
}
extension Basket {
    struct PayBasket: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path: String = "pay"
        let totalCost: Int
        var parameters: Parameters? {
            return [
                "cost_total": totalCost,
            ]
        }
    }
}

