//
//  DayWeather.swift
//  Calendar
//
//  Created by Pavlo Boiko on 11/19/19.
//  Copyright © 2019 Pavlo Boiko. All rights reserved.
//

import SwiftUI

struct DayWeatherView: View {
    var weather: DayWeather
    
    var body: some View {
        Text(weather.text)
    }
}

struct DayWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherRootView()
    }
}
