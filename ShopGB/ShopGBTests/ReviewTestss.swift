//
//  ReviewTestss.swift
//  ShopGBTests
//
//  Created by Irina on 02.07.2023.

import XCTest
import Alamofire
@testable import ShopGB

class ReviewTests: XCTestCase {
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
    
    
    func testAddReviews() {
        let factory = RequestFactory().makeReviewsRequestFactory()

        factory.add(idUser: 123, text: "Текст отзыва") { [weak self] response in
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
    
    func testRemoveReviews() {
        let factory = RequestFactory().makeReviewsRequestFactory()
        
        factory.remove(idComment: 123) { [weak self] response in
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
