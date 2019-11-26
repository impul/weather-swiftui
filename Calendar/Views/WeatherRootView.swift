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
                ForEach(viewModel.days) { dayDate in
                    VStack {
                        HStack {
                            Text(dayDate.formatted(format: .dayWeek)).bold()
                            Spacer()
                        }
                        ScrollView(.horizontal, content: {
                            HStack(spacing: 5) {
                                ForEach(self.viewModel.weatherByDay(day: dayDate)) { weather in
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
