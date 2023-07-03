//
//  AppDelegate.swift
//  ShopGB
//
//  Created by Irina on 20.06.2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    let requestFactory = RequestFactory()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
//        let auth = requestFactory.makeAuthRequestFatory()
//        auth.login(userName: "Somebody", password: "mypassword") { response in
//            switch response.result {
//            case .success(let login):
//                print(login)
//            case .failure(let error):
//                print(error.localizedDescription)
//            }
//        }
//        return true
        
        
//        let logout = requestFactory.makeLogoutRequestFatory()
//        logout.logout(idUser: 123) { response in
//            switch response.result {
//            case .success(let login):
//                print(login)
//            case .failure(let error):
//                print(error.localizedDescription)
//            }
//        }
//        return true
        
        
//        let register = requestFactory.makeRegisterRequestFatory()
//        register.registerUser(idUser: 123, userName: "Somebody", password: "mypassword", email: "some@some.ru", gender: "m", creditCard: "9872389-2424-234224-234", bio: "This is good! I think I will switch to another language") { response in
//            switch response.result {
//            case .success(let login):
//                print(login)
//            case .failure(let error):
//                print(error.localizedDescription)
//            }
//        }
//        return true
        
        
//        let change = requestFactory.makeChangeRequestFatory()
//        change.changeUserData(idUser: 123, userName: "Somebody", password: "mypassword", email: "some@some.ru", gender: "m", creditCard: "9872389-2424-234224-234", bio: "This is good! I think I will switch to another language") { response in
//            switch response.result {
//            case .success(let login):
//                print(login)
//            case .failure(let error):
//                print(error.localizedDescription)
//            }
//        }
//        return true
        
//        let reviews = requestFactory.makeReviewsRequestFactory()
//        reviews.removeReview(idComment: 2) { response in
//            switch response.result {
//            case .success(let result):
//                print(result)
//            case .failure(let error):
//               // print(String(describing: error))
//                print(error.localizedDescription)
//
//            }
//        }
//        return true
        
//        let reviews = requestFactory.makeReviewsRequestFactory()
//        reviews.add(idUser: 123, text: "Текст отзыва") { response in
//            switch response.result {
//            case .success(let result):
//                print(result)
//            case.failure(let error):
//                print(error.localizedDescription)
//
//            }
//
//        }
//        return true
        
        let reviews = requestFactory.makeReviewsRequestFactory()
        reviews.remove(idComment: 123) { response in
            switch response.result {
            case .success(let result):
                print(result)
            case.failure(let error):
                print(error.localizedDescription)
                
            }
            
        }
        return true
    }
    
    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

