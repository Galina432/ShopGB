//
//  AddReviewRequestFactory.swift
//  ShopGB
//
//  Created by Irina on 02.07.2023.
//

import Foundation
import Alamofire

protocol AddReviewRequestFactory {
    func addReview(userName: String, password: String, completionHandler: @escaping (AFDataResponse<LoginResult>) -> Void)
}

