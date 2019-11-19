//
//  DayWeather.swift
//  Calendar
//
//  Created by Pavlo Boiko on 11/19/19.
//  Copyright © 2019 Pavlo Boiko. All rights reserved.
//

import Foundation

struct DayWeather: Codable, Identifiable {
    var id: String { text }
    
    let text: String
}
