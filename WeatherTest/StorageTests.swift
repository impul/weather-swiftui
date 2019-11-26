//
//  StorageTests.swift
//  WeatherTest
//
//  Created by Pavlo Boiko on 11/26/19.
//  Copyright © 2019 Pavlo Boiko. All rights reserved.
//

import XCTest
@testable import Weather

class StorageTests: XCTestCase {
    
    func testStorage() {
        var storage = Current.storage
        XCTAssertEqual(storage.cities, [])
        storage.cities.append("Berlin")
        XCTAssertEqual(storage.cities, ["Berlin"])
        storage.cities.append("Uzhhorod")
        XCTAssertEqual(storage.cities, ["Berlin", "Uzhhorod"])
        storage.cities.removeAll()
        XCTAssertEqual(storage.cities, [])
    }
}
