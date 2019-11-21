//
//  DayWeather.swift
//  Calendar
//
//  Created by Pavlo Boiko on 11/19/19.
//  Copyright © 2019 Pavlo Boiko. All rights reserved.
//

import Foundation

struct DaylyWeather: Identifiable {
    var id: String { String(date.timeIntervalSince1970) }
    
    var date: Date
    var minTemperature: Double
    var maxTemperature: Double
    var rainsProcents: Double
    var iconUrl: URL?
}
