//
//  WeatherRootView.swift
//  Calendar
//
//  Created by Pavlo Boiko on 11/19/19.
//  Copyright © 2019 Pavlo Boiko. All rights reserved.
//

import SwiftUI

struct WeatherRootView: View {
    var weathers = [DayWeather(text: "Day 1"), DayWeather(text: "Day 2"), DayWeather(text: "Day 3"), DayWeather(text: "Day 4")]
    
    var body: some View {
        List {
            ScrollView(.horizontal, content: {
                HStack(spacing: 10) {
                    ForEach(weathers) { weather in
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
