//
//  WeatherSourceProtocol.swift
//  Calendar
//
//  Created by Pavlo Boiko on 11/19/19.
//  Copyright © 2019 Pavlo Boiko. All rights reserved.
//

import Foundation

protocol WeatherSourceProtocol {
    func getWeatherPerDayInCity(_ city: String, response: @escaping (Result<[DaylyWeather], WeatherError>) -> Void)
}
