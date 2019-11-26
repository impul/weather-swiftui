//
//  Environment.swift
//  Calendar
//
//  Created by Pavlo Boiko on 11/20/19.
//  Copyright © 2019 Pavlo Boiko. All rights reserved.
//

import Foundation

struct Environment {
    var weather: WeatherSourceProtocol = OpenWeatherMapSource()
    var storage: StorageProtocol = UserDefaultsStorage()
}

var Current = Environment()
