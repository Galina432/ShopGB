//
//  AuthRequestFactory.swift
//  ShopGB
//
//  Created by Irina on 20.06.2023.
//

import Foundation
import Alamofire


// реализация входа в личный кабинет

protocol AuthRequestFactory {
    func login(userName: String, password: String, completionHandler: @escaping (AFDataResponse<LoginResult>) -> Void)
}
