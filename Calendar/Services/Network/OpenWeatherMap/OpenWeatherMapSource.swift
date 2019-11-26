//
//  OpenWeatherMapSource.swift
//  Calendar
//
//  Created by Pavlo Boiko on 11/19/19.
//  Copyright © 2019 Pavlo Boiko. All rights reserved.
//

import Foundation
import Combine

private let url = "http://api.openweathermap.org"
private let weatherIconsUrl = "http://openweathermap.org/img/wn/"
private let apiKey = "a9f64ccd2f781cff0d2c0b009bdab6f7"

fileprivate enum Enpoints {
    static var weather5per3: NSString = "/data/2.5/forecast?q=%@&APPID=%@&units=metric"
}

public class OpenWeatherMapSource: WeatherSourceProtocol {
    
    func getWeatherPerDayInCity(_ city: String) -> AnyPublisher<CityModel, Error>?  {
        guard let url = URL(string: url + NSString(format: Enpoints.weather5per3, city, apiKey).description) else { return nil }
        return URLSession.shared
            .dataTaskPublisher(for: url)
            .tryMap { data, response -> Data in
                if let error = try? JSONDecoder().decode(OpenWeatherError.self, from: data)  {
                    throw error
                }
                return data
        }
        .decode(type: OpenWeatherResponce.self, decoder: JSONDecoder())
        .receive(on: RunLoop.main)
        .map { CityModel(name: $0.city.name, weather: $0.list.map {
            DaylyWeather(date: Date(timeIntervalSince1970: TimeInterval($0.dt)),
                         minTemperature: Int($0.main.temp_min),
                         current: Int($0.main.temp) ,
                         maxTemperature: Int($0.main.temp_max),
                         rainsProcents: $0.rain?.possibility ?? 0,
                         icon: $0.weather.first?.dayIcon ?? .clearSky)}
            )
        }
        .eraseToAnyPublisher()
    }
}


