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
        VStack {
            TextField("City name", text: $viewModel.searchCity)
                .padding(.all)
                .background(Color(.secondarySystemBackground))
                .cornerRadius(5)
            List {
                ForEach(viewModel.daylyWeather.map { $0.0 }.sorted()) { dayWeathers in
                    VStack {
                        HStack { Text(dayWeathers).bold();Spacer()}
                        ScrollView(.horizontal, content: {
                            HStack(spacing: 5) {
                                ForEach(self.viewModel.daylyWeather[dayWeathers]!) { weather in
                                    DayWeatherView(weather: weather)
                                        .background(Color.blue.opacity(55))
                                        .cornerRadius(5)
                                }
                            }
                        })
                    }
                }.frame(height: 130)
            }.onAppear { UITableView.appearance().separatorStyle = .none }
        }
    }
}

struct WeatherRootView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherRootView()
    }
}
