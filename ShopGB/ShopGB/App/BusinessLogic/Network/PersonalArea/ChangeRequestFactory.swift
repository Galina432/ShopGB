//
//  ChangeRequestFactory.swift
//  ShopGB
//
//  Created by Irina on 21.06.2023.
//

import Foundation
import Alamofire

protocol ChangeRequestFactory {
    func changeUserData(idUser: Int, userName: String, password: String, email: String, gender: String, creditCard: String, bio: String, completionHandler: @escaping (AFDataResponse<ChangeUserDataResult>) -> Void)
}
