//
//  DayWeather.swift
//  Calendar
//
//  Created by Pavlo Boiko on 11/19/19.
//  Copyright © 2019 Pavlo Boiko. All rights reserved.
//

import SwiftUI

struct DayWeatherView: View {
    var weather: DaylyWeather
    
    var body: some View {
        VStack {
            Text(weather.date.formatted(format: .hour))
            Image(uiImage: weather.icon.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, alignment: .center)
            Text(String(weather.current.rounded()))
        }
    }
}

struct DayWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherRootView()
    }
}
