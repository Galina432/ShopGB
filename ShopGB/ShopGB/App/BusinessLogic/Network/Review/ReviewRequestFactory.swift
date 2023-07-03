//
//  ReviewRequestFactory.swift
//  ShopGB
//
//  Created by Irina on 02.07.2023.
//

import Foundation
import Alamofire

protocol ReviewRequestFactory {
    func remove(idComment: Int, completionHandler: @escaping (AFDataResponse<RemoveReviewResult>) -> Void)
    
    func add(idUser: Int, text: String, completionHandler: @escaping (AFDataResponse<AddReviewResult>) -> Void)
    
}
