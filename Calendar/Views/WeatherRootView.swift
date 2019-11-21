//
//  WeatherRootView.swift
//  Calendar
//
//  Created by Pavlo Boiko on 11/19/19.
//  Copyright © 2019 Pavlo Boiko. All rights reserved.
//

import SwiftUI

struct WeatherRootView: View {
    let dayWeather: [DaylyWeather] = []
    
    var body: some View {
        Current.weather.getWeatherPerDayInCity("Uzhhorod") { (weather) in
            print(weather)
        }
        
        return List {
            ScrollView(.horizontal, content: {
                HStack(spacing: 10) {
                    ForEach(dayWeather) { weather in
                        DayWeatherView(weather: weather)
                    }
                }
                .padding(.leading, 10)
            })
            .frame(height: 190)
            
        }
    }
}

struct WeatherRootView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherRootView()
    }
}
