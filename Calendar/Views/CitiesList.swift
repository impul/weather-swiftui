//
//  CitiesList.swift
//  Calendar
//
//  Created by Pavlo Boiko on 11/26/19.
//  Copyright © 2019 Pavlo Boiko. All rights reserved.
//

import SwiftUI

struct CitiesList: View {
    @ObservedObject var viewModel = CitiesListViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    TextField("Add city", text: $viewModel.enteredCity)
                    Button(action: {
                        self.viewModel.storeCity()
                    }, label: { Text("Add") })
                }.padding(.all)
                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(5)
                List {
                    ForEach(viewModel.cities) { city in
                        NavigationLink(destination: WeatherRootView(city: city)) {
                            Text(city)
                        }
                    }.onDelete(perform: viewModel.delete(at:))
                }
            }.navigationBarTitle("Weather App")
        }
    }
}
