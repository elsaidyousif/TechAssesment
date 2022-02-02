//
//  BoubyanTechAssesmentTests.swift
//  BoubyanTechAssesmentTests
//
//  Created by elsaid yousif on 01/02/2022.
//

import XCTest
@testable import BoubyanTechAssesment

class BoubyanTechAssesmentTests: XCTestCase {
    private let viewModel = ArticleListViewModel()
    // test if called api without errors
    func testCallingApi() {
        viewModel.getArticlesList()
        let expectation = self.expectation(description: "Test articles api resposne without errors")
        viewModel.callingApiError.bind { error in
            if let err = error {
                if err {
                XCTFail("Failed")
                }
                expectation.fulfill()
            }
        }
        wait(for: [expectation], timeout: 60)
    }
    // test if count of articles = 20
    func testArticlesCount() {
        viewModel.getArticlesList()
        let expectation = self.expectation(description: "Test if count of articles = 20")
        viewModel.ArticlesList.bind { articlesRes in
            if let articlesResFromAPI = articlesRes {
                if let results = articlesResFromAPI.results {
                    XCTAssertEqual(results.count, 20)
                }
            }
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 60)
    }
}
