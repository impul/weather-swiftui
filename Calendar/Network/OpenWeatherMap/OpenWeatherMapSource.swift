//
//  OpenWeatherMapSource.swift
//  Calendar
//
//  Created by Pavlo Boiko on 11/19/19.
//  Copyright © 2019 Pavlo Boiko. All rights reserved.
//

import Foundation

private let url = "https://samples.openweathermap.org"
private let weatherIconsUrl = "http://openweathermap.org/img/wn/"

public class OpenWeatherMapSource: WeatherSourceProtocol {
    private let network: NetworkBroadcastingInterface
    
    init(serverUrl: String = url) {
        network = DefaultNetworkBroadcaster(serverUrl)
    }
    
    func getWeatherPerDayInCity(_ city: String, response: @escaping (Result<[DaylyWeather], WeatherError>) -> Void) {
        network.request(OpenWeatherEndpoint.weather5days3hours(inCity: city)) { (result: Result<OpenWeatherResponce, WeatherError>) in
            switch result {
            case .failure(let error):
                response(.failure(error))
                
            case .success(let openWeatherResponce):
                response(.success(openWeatherResponce.list.map { weather in
                    return DaylyWeather(date: Date(timeIntervalSince1970: TimeInterval(weather.dt)),
                                        minTemperature: weather.main.temp_min,
                                        maxTemperature: weather.main.temp_max,
                                        rainsProcents: weather.rain.possibility,
                                        iconUrl: URL(string: weatherIconsUrl + weather.water.icon + "@2x.png"))
                }))
            }
        }
    }
}
