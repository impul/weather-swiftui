//
//  NetworkTests.swift
//  WeatherTest
//
//  Created by Pavlo Boiko on 11/26/19.
//  Copyright © 2019 Pavlo Boiko. All rights reserved.
//

import XCTest
@testable import Weather

private let testUrl = "http://samples.openweathermap.org"
private let city = "Berlin"

class NetworkTests: XCTestCase {
    
    func testStorage() {
        let weatherExpect = expectation(description: "Expect weather responce")
        let network = OpenWeatherMapSource()
        _ = network.getWeatherPerDayInCity(city)?
            .sink(receiveCompletion: { (completion) in
                
            }, receiveValue: { (value) in
                XCTAssertEqual(value.name, city)
                weatherExpect.fulfill()
            })
        wait(for: [weatherExpect], timeout: 5)
    }
}
