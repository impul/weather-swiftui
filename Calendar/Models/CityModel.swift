//
//  CityModel.swift
//  Calendar
//
//  Created by Pavlo Boiko on 11/24/19.
//  Copyright © 2019 Pavlo Boiko. All rights reserved.
//

import Foundation

typealias CityName = String

extension CityName: Identifiable {
    public var id: String {
        self
    }
}

struct CityModel {
    var name: CityName
    var weather: [DaylyWeather]
}
