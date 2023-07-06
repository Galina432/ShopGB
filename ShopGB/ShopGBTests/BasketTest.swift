//
//  BasketTest.swift
//  ShopGBTests
//
//  Created by Irina on 05.07.2023.
//

import XCTest
import Alamofire
@testable import ShopGB

class BasketTest: XCTestCase {
    var requestFactory: RequestFactory!
    
    let expectation = XCTestExpectation(description: "Download https://raw.githubusercontent.com/GeekBrainsTutorial/online-store-api/master/responses/")
    let timeoutValue = 10.0
    
    override func setUpWithError() throws {
        try? super.setUpWithError()
        requestFactory = RequestFactory()
        
    }
    
    override func tearDownWithError() throws {
        try? super.tearDownWithError()
        requestFactory = nil
        
    }
    
    
    func testAddBasket() {
        let factory = RequestFactory().makeBasketRequestFactory()
        factory.addToBasket(idProduct: 123, quantity: 1) { [weak self] response in
            switch response.result {
            case .success(let result):
                XCTAssertEqual(result.result, 1)
            case .failure:
                XCTFail()
            }
            self?.expectation.fulfill()
        }
        wait(for: [expectation], timeout: timeoutValue)
    }
    
    func testRemoveBasket() {
        let factory = RequestFactory().makeBasketRequestFactory()
        factory.deleteFromBasket(idProduct: 123) { [weak self] response in
            switch response.result {
            case .success(let result):
                XCTAssertEqual(result.result, 1)
            case .failure:
                XCTFail()
            }
            self?.expectation.fulfill()
        }
        wait(for: [expectation], timeout: timeoutValue)
    }
    
    func testPayBasket() {
        let factory = RequestFactory().makeBasketRequestFactory()
        factory.payBasket(totalCost: 1000) { [weak self] response in
            switch response.result {
            case .success(let result):
                XCTAssertEqual(result.result, 1)
            case .failure:
                XCTFail()
            }
            self?.expectation.fulfill()
        }
        wait(for: [expectation], timeout: timeoutValue)
    }
    
}
