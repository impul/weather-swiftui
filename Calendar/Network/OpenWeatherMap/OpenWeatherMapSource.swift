//
//  OpenWeatherMapSource.swift
//  Calendar
//
//  Created by Pavlo Boiko on 11/19/19.
//  Copyright © 2019 Pavlo Boiko. All rights reserved.
//

import Foundation
import Combine

private let url = "https://samples.openweathermap.org"
private let weatherIconsUrl = "http://openweathermap.org/img/wn/"
private let apiKey = "a9f64ccd2f781cff0d2c0b009bdab6f7"

fileprivate enum Enpoints {
    static var weather5per3: NSString = "/data/2.5/forecast?q=%@&appid=%@"
}

public class OpenWeatherMapSource: WeatherSourceProtocol {
 
    func getWeatherPerDayInCity(_ city: String) -> AnyPublisher<[DaylyWeather], Error>?  {
        guard let url = URL(string: url + NSString(format: Enpoints.weather5per3, city, apiKey ).description) else { return nil }
        return URLSession.shared
            .dataTaskPublisher(for: url)
                .map { $0.data }
                .decode(type: OpenWeatherResponce.self, decoder: JSONDecoder())
                .receive(on: RunLoop.main)
                .map { $0.list.map {
                        DaylyWeather(date: Date(timeIntervalSince1970: TimeInterval($0.dt)),
                                     minTemperature: $0.main.temp_min,
                                     maxTemperature: $0.main.temp_max,
                                     rainsProcents: $0.rain?.possibility ?? 0,
                                     iconUrl: URL(string: weatherIconsUrl + ($0.weather.first?.icon ?? "01d") + "@2x.png"))
            }}.eraseToAnyPublisher()
    }
}
