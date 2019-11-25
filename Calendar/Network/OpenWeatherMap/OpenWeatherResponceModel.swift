//
//  OpenWeatherResponceModel.swift
//  Calendar
//
//  Created by Pavlo Boiko on 11/21/19.
//  Copyright © 2019 Pavlo Boiko. All rights reserved.
//

import Foundation

struct OpenWeatherResponce: Codable {
    let cod: String
    let message: Double
    let cnt: Double
    let list: [DaylyWeather]
    let city: City
    
    struct DaylyWeather: Codable {
        let dt_txt: String
        let dt: UInt64
        let main: General
        let weather: [Weather]
        let clouds: Clouds
        let wind: Wind
        let rain: Rain?
        
        struct Weather: Codable {
            let id: Int
            let main: String
            let description: String
            let icon: String
            
            var dayIcon: WeatherIcon {
                switch icon.prefix(2) {
                case "01": return .clearSky
                case "02": return .fewClouds
                case "03": return .scatteredClouds
                case "04": return .brokenClouds
                case "09": return .showerRain
                case "10": return .rain
                case "11": return .thunderstorm
                case "13": return .snow
                case "50": return .mist
                default: return .clearSky
                }
            }
        }
        
        struct General: Codable {
            let temp: Double
            let temp_min: Double
            let temp_max: Double
            let pressure: Double
            let sea_level: Double
            let grnd_level: Double
            let humidity: Double
            let temp_kf: Double
        }
        
        struct Clouds: Codable {
            let all: Int
        }
        
        struct Wind: Codable {
            let speed: Double
            let deg: Double
        }
        
        struct Rain: Codable {
            let possibility: Double?
            
            enum CodingKeys: String, CodingKey {
                case possibility = "3h"
            }
        }
    }
    
    struct City: Codable {
        let id: Int64
        let name: String
        let coord: Coordinates
        let country: String
        
        struct Coordinates: Codable {
            let lat: Double
            let lon: Double
        }
    }
}
