//
//  DayWeather.swift
//  Calendar
//
//  Created by Pavlo Boiko on 11/19/19.
//  Copyright © 2019 Pavlo Boiko. All rights reserved.
//

import UIKit.UIImage

enum WeatherIcon: String {
    case clearSky
    case snow
    case mist
    case rain
    case brokenClouds
    case fewClouds
    case scatteredClouds
    case showerRain
    case thunderstorm
    
    var image: UIImage {
        return UIImage(named: self.rawValue) ?? UIImage()
    }
}

struct DaylyWeather: Identifiable {
    var id: String { String(date.timeIntervalSince1970) }
    
    var date: Date
    var minTemperature: Int
    var current: Int
    var maxTemperature: Int
    var rainsProcents: Double
    var icon: WeatherIcon
}
