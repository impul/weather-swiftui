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
            guard !searchCity.isEmpty else {
                return daylyWeather = [:]
            }
            
            searchCancellable = Current
                .weather
                .getWeatherPerDayInCity(searchCity)?
                .map { $0 }
                .sink(receiveCompletion: { (completion) in
                    print(completion)
                }, receiveValue: { (city) in
                    self.city = city.name
                    self.daylyWeather = Dictionary(grouping: city.weather) {
                        return $0.date.roundToDay()
                    }
                })
        }
    }
    @Published private(set) var city: String = ""
    @Published private(set) var daylyWeather: [Date:[DaylyWeather]] = [:]
    
    var days: [Date] {
        daylyWeather
            .map { $0.key }
            .sorted()
    }
    
    func weatherByDay(day: Date) -> [DaylyWeather] {
        return daylyWeather[day] ?? []
    }
    
    deinit {
        searchCancellable?.cancel()
    }
}
