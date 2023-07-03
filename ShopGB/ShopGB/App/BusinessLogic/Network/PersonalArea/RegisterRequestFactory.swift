//
//  RegisterRequestFactory.swift
//  ShopGB
//
//  Created by Irina on 21.06.2023.
//

import Foundation
import Alamofire

protocol RegisterRequestFactory {
    func registerUser(idUser: Int, userName: String, password: String, email: String, gender: String, creditCard: String, bio: String, completionHandler: @escaping (AFDataResponse<RegisterUserResult>) -> Void)
}
