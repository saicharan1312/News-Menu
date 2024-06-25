//
//  Tasks_TestTests.swift
//  Tasks_TestTests
//
//  Created by Sai Charan Thummalapudi on 6/18/24.
//

import XCTest
@testable import Tasks_Test

class Tasks_TestTests: XCTestCase {
    
    var mockObj: MockAPIManager?
    var userMockObj: UserInfoViewModel?
    var peopleMockObj: PeopleViewModel?
    var movieMockObj: MovieViewModel?
    var newsMockObj: NewsViewModel?
    var menuMockObj: MenuViewModel?
    
    override func setUpWithError() throws {
        mockObj = MockAPIManager()
        userMockObj = UserInfoViewModel()
        peopleMockObj = PeopleViewModel()
        movieMockObj = MovieViewModel()
        newsMockObj = NewsViewModel()
        menuMockObj = MenuViewModel()
    }

    override func tearDownWithError() throws {
        mockObj = nil
        userMockObj = nil
        peopleMockObj = nil
        movieMockObj = nil
        newsMockObj = nil
        menuMockObj = nil
    }

    func userMockAPITest() throws {
        userMockObj?.fetchData {}
        XCTAssertEqual(userMockObj?.usersArr.count, 1)
    }
    func peopleMockAPITest() throws {
        peopleMockObj?.fetchData {}
        XCTAssertEqual(peopleMockObj?.peopleData?.name, "Sai")
        XCTAssertNotNil(peopleMockObj?.peopleData)
    }
    func movieMockAPITest() throws {
        movieMockObj?.fetchData {}
        XCTAssertEqual(movieMockObj?.movieArr.count, 1)
    }
    func newsMockAPITest() throws {
        newsMockObj?.fetchData {}
        XCTAssertEqual(newsMockObj?.newsArr.count, 1)
    }
    func menuMockAPITest() throws {
        menuMockObj?.fetchData {}
        XCTAssertEqual(menuMockObj?.menuArr.count, 1)
    }

}
