//
//  WeatherSourceProtocol.swift
//  Calendar
//
//  Created by Pavlo Boiko on 11/19/19.
//  Copyright © 2019 Pavlo Boiko. All rights reserved.
//

import Foundation
import Combine

protocol WeatherSourceProtocol {
    func getWeatherPerDayInCity(_ city: String) -> AnyPublisher<CityModel, Error>?
}
