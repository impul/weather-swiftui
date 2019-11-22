//
//  WeatherRootView.swift
//  Calendar
//
//  Created by Pavlo Boiko on 11/19/19.
//  Copyright © 2019 Pavlo Boiko. All rights reserved.
//

import SwiftUI

struct WeatherRootView: View {
    @ObservedObject var viewModel = WeatherViewModel()
    
    var body: some View {
        NavigationView {
            List {
                TextField("City name", text: $viewModel.searchCity)
                    .padding(.all)
                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(5)
                ScrollView(.horizontal, content: {
                    HStack(spacing: 10) {
                        ForEach(viewModel.daylyWeather) { weather in
                            DayWeatherView(weather: weather)
                        }
                    }
                    .padding(.leading, 10.0)
                })
                .frame(height: 190)
            }.navigationBarTitle("Weather")
        }
    }
}

struct WeatherRootView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherRootView()
    }
}
