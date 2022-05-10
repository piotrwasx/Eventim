//
//  EventsViewModelTests.swift
//  EventimAppTests
//
//  Created by Piotr Waś on 08/05/2022.
//

import XCTest
@testable import EventimApp

class EventsViewModelTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
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
    
    func testCounter() throws {
        // given
        let basketMock = BasketMock()
        basketMock.items = []
        let sut = EventViewModel(basket: basketMock, ticketsProvider: TicketsProviderMock())
        
        // when
        let count = sut.basketCount
        
        // then
        XCTAssertEqual(count, 5)
    }

}
