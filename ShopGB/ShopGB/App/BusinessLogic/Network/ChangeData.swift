//
//  ChangeData.swift
//  ShopGB
//
//  Created by Irina on 21.06.2023.
//

import Foundation
import Alamofire

class ChangeData: AbstractRequestFactory {
    let errorParser: AbstractErrorParser
    let sessionManager: Session
    let queue: DispatchQueue
    let baseUrl = URL(string: "https://raw.githubusercontent.com/GeekBrainsTutorial/online-store-api/master/responses/")!
    
    init(errorParser: AbstractErrorParser, sessionManager: Session, queue: DispatchQueue = DispatchQueue.global(qos: .utility)) {
        self.errorParser = errorParser
        self.sessionManager = sessionManager
        self.queue = queue
    }
}

extension ChangeData: ChangeRequestFactory {
    func changeUserData(idUser: Int, userName: String, password: String, email: String, gender: String, creditCard: String, bio: String, completionHandler: @escaping (Alamofire.AFDataResponse<ChangeUserDataResult>) -> Void) {
        let requestModel = ChangeUserData(baseUrl: baseUrl,
                                          idUser: idUser,
                                          login: userName,
                                          password: password,
                                          email: email,
                                          gender: gender,
                                          creditCard: creditCard,
                                          bio: bio)
        self.request(request: requestModel,
                     completionHandler: completionHandler)
    }
}

extension ChangeData {
    struct ChangeUserData: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path: String = "changeUserData.json"
        let idUser: Int
        let login: String
        let password: String
        let email: String
        let gender: String
        let creditCard: String
        let bio: String
        var parameters: Parameters? {
            return ["id_user": idUser,
                    "username": login,
                    "password": password,
                    "email": email,
                    "gender": gender,
                    "credit_card": creditCard,
                    "bio": bio
            ]
        }
    }
}
