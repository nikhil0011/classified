//
//  classifiedTests.swift
//  classifiedTests
//
//  Created by Nikhil Nangia on 26/11/21.
//

import XCTest
@testable import classified

class ClassifiedTests: XCTestCase {
    var viewControllerUnderTest: ListingViewController!
    
    override func setUp() {
        super.setUp()
        viewControllerUnderTest = ListingViewController()
        self.viewControllerUnderTest.loadView()
        self.viewControllerUnderTest.viewDidLoad()
        viewControllerUnderTest.setupDataSource()
    }
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
    //  Converted to Swift 5.5 by Swiftify v5.5.21910 - https://swiftify.com/
    func testUICollectionViewDataSource() {
        let viewmodel = [ItemListingViewModel(product: nil, section: .products)]
        let dataSource = ListingDataSource(collectionView: ListingView().collectionView, array: viewmodel)
        XCTAssertEqual(dataSource.provider.numberOfItems(in: 0), 1)
        XCTAssertEqual(dataSource.provider.numberOfSections(), 1)
    }
    func testHasAView() {
        XCTAssertNotNil(viewControllerUnderTest.listingView)
    }
    func testHasACollectionView() {
        XCTAssertNotNil(viewControllerUnderTest.listingView.collectionView)
    }
    func testCollectionViewHasDelegate() {
        XCTAssertNotNil(viewControllerUnderTest.listingView.collectionView.delegate)
    }
    func testCollectionViewHasDataSource() {
        XCTAssertNotNil(viewControllerUnderTest.listingView.collectionView.dataSource)
    }
    func testViewControllerHasDataSource() {
        XCTAssertNotNil(viewControllerUnderTest.dataSource)
    }
}
