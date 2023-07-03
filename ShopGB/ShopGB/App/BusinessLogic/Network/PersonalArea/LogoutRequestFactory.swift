//
//  LogoutRequestFactory.swift
//  ShopGB
//
//  Created by Irina on 21.06.2023.
//

import Foundation
import Alamofire

protocol LogoutRequestFactory {
    func logout(idUser: Int, completionHandler: @escaping (AFDataResponse<LogoutResult>) -> Void)
}
