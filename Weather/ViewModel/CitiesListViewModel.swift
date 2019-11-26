//
//  CitiesListViewModel.swift
//  Calendar
//
//  Created by Pavlo Boiko on 11/26/19.
//  Copyright © 2019 Pavlo Boiko. All rights reserved.
//

import Foundation
import Combine

final class CitiesListViewModel: ObservableObject {
    @Published var enteredCity: String = ""
    @Published var cities: [String] = Current.storage.cities {
        willSet {
            Current.storage.cities = newValue
        }
    }
    
    func storeCity() {
        if enteredCity.isEmpty || cities.contains(enteredCity) { return }
        cities.append(enteredCity)
        enteredCity = ""
    }
    
    func delete(at offsets: IndexSet) {
        cities.remove(atOffsets: offsets)
    }
}

