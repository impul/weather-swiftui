//
//  WeatherError.swift
//  Calendar
//
//  Created by Pavlo Boiko on 11/19/19.
//  Copyright © 2019 Pavlo Boiko. All rights reserved.
//

import Foundation

public enum WeatherError: Error {
    case http(Error)
    case incorrectUrl
    case unknown
    case decoding
    case request(Error)
}
