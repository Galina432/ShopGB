//
//  ReviewTests.swift
//  ShopGBTests
//
//  Created by Irina on 02.07.2023.
//

import Foundation

func test_Review_removeReview_ShouldRemoveReview() {
        let reviews = requestFactory.makeReviewsRequestFactory()
        let id = 123
        var itemResult = 3

        reviews.removeReview(idComment: id) { response in
            switch response.result {
            case .success(let item):
                itemResult = item.result
            case .failure:
                XCTFail()
            }
            self.expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10.0)
        XCTAssertEqual(1, itemResult)
        XCTAssertNotEqual(0, itemResult)
    }

    func test_Review_addReview_ShouldAddReview() {
        let reviews = requestFactory.makeReviewsRequestFactory()
        let id = 123
        let text = "Good value of money"
        var itemResult = 3

        reviews.addReview(idUser: id, text: text) { response in
            switch response.result {
            case .success(let item):
                itemResult = item.result
            case .failure:
                XCTFail()
            }
            self.expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10.0)
        XCTAssertEqual(1, itemResult)
        XCTAssertNotEqual(0, itemResult)
    }

    func test_Review_getListReview_ShouldReturnArrayOfReview() {
        let reviews = requestFactory.makeReviewsRequestFactory()
        let id = 123
        let page = 1
        var itemResult = 0

        reviews.getListReview(page: page, idProduct: id) { response in
            switch response.result {
            case .success(let item):
                itemResult = item.reviews[0].idComment
            case .failure:
                XCTFail()
            }
            self.expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10.0)
        XCTAssertNotEqual(0, itemResult)
    }
}
