//
//  ApproveReviewRequestFactory.swift
//  ShopGB
//
//  Created by Irina on 02.07.2023.
//

import Foundation
import Foundation
import Alamofire


// реализация входа в личный кабинет

protocol AuthRequestFactory {
    func login(userName: String, password: String, completionHandler: @escaping (AFDataResponse<LoginResult>) -> Void)
}
