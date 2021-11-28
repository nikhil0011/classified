//
//  classifiedTests.swift
//  classifiedTests
//
//  Created by Nikhil Nangia on 26/11/21.
//

import XCTest
@testable import classified

class classifiedTests: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    func testListingApiForValidResponse(){
        // ARRANGE
        let requestViewModel = ListingViewModel()
        let listingExpectations = self.expectation(description: "Valid request returns valid accurate response")
        requestViewModel.loadData()
        requestViewModel.bindableListingData.bind { (data, error) in
            // ASSERT
            XCTAssertNotNil(data)
            if let list = data?.results {
                XCTAssertFalse(list.isEmpty, "List is not empty")
            }
            listingExpectations.fulfill()
        }
        waitForExpectations(timeout: 20, handler: nil)
    }
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
