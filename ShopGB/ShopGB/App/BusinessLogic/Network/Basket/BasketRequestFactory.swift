//
//  BasketRequestFactory.swift
//  ShopGB
//
//  Created by Irina on 05.07.2023.
//

import Foundation
import Alamofire

protocol BasketRequestFactory {
    func addToBasket(idProduct: Int, quantity: Int, completionHandler: @escaping (AFDataResponse<AddToBasketResult>) -> Void)
    
    func deleteFromBasket(idProduct: Int, completionHandler: @escaping (AFDataResponse<DeleteFromBasketResult>) -> Void)
    
    func payBasket(totalCost: Int, completionHandler: @escaping(AFDataResponse<PayBasketResult>) -> Void)
    
}

