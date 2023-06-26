//
//  UserTests.swift
//  ShopGBTests
//
//  Created by Irina on 26.06.2023.
//

import XCTest
@testable import ShopGB

class UserRequestsTests: XCTestCase {
    
    let expectation = XCTestExpectation(description: "Download https://raw.githubusercontent.com/GeekBrainsTutorial/online-store-api/master/responses/")
    
    var registrationRequest: RegisterRequestFactory!
    var changeProfileRequest: ChangeRequestFactory!
    
    override func setUpWithError() throws {
        registrationRequest = RequestFactory().makeRegisterRequestFatory()
        changeProfileRequest = RequestFactory().makeChangeRequestFatory()
    }
    
    override func tearDownWithError() throws {
        registrationRequest = nil
        changeProfileRequest = nil
    }
    
    func testRegister() throws {
        let userId = 123
        
        registrationRequest.registerUser(idUser: userId, userName: "Somebody", password: "mypassword", email: "some@some.ru", gender: "m", creditCard: "9872389-2424-234224-234", bio: "This is good! I think I will switch to another language") { [weak self] response in
            
            switch response.result {
            case .success(let response):
                //Then
                XCTAssertEqual(response.result, 1)
                          
            case .failure(let error):
                XCTFail()
            }
            self?.expectation.fulfill()
            
        }
        wait(for: [expectation], timeout: 10.0)
        
    }
    func test_Change() throws {
        let userId = 123
        
        changeProfileRequest.changeUserData(idUser: userId, userName: "Somebody", password: "mypassword", email: "some@some.ru", gender: "m", creditCard: "9872389-2424-234224-234", bio: "This is good! I think I will switch to another language") { [weak self] response in
            
            switch response.result {
            case .success(let response):
                //Then
                XCTAssertEqual(response.result, 1)
                          
            case .failure(let error):
                XCTFail()
            }
            self?.expectation.fulfill()
            
        }
        wait(for: [expectation], timeout: 10.0)
        
    }
    
}
