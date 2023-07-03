//
//  RegisterUser.swift
//  ShopGB
//
//  Created by Irina on 21.06.2023.
//

import Foundation
import Alamofire

class Register: AbstractRequestFactory {
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

extension Register: RegisterRequestFactory {
    
    func registerUser(idUser: Int, userName: String, password: String, email: String, gender: String, creditCard: String, bio: String, completionHandler: @escaping (Alamofire.AFDataResponse<RegisterUserResult>) -> Void) {
        let requestModel = RegisterUser(baseUrl: baseUrl,
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

extension Register {
    struct RegisterUser: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path: String = "registerUser.json"
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
