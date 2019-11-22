//
//  WeatherViewModel.swift
//  Calendar
//
//  Created by Pavlo Boiko on 11/22/19.
//  Copyright © 2019 Pavlo Boiko. All rights reserved.
//

import Foundation
import Combine

final class WeatherViewModel: ObservableObject {
    private var searchCancellable: Cancellable? {
        didSet { oldValue?.cancel() }
    }
    
    @Published var searchCity: String = "" {
        didSet {
           searchCancellable = Current
                .weather
                .getWeatherPerDayInCity(searchCity)?
                .compactMap { $0 }
                .replaceError(with: [])
                .assign(to: \.daylyWeather, on: self)
            
        }
    }
    @Published private(set) var daylyWeather: [DaylyWeather] = []
    
    deinit {
        searchCancellable?.cancel()
    }
}
