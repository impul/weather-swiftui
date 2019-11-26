//
//  UserDefaultsStorage.swift
//  Calendar
//
//  Created by Pavlo Boiko on 11/26/19.
//  Copyright © 2019 Pavlo Boiko. All rights reserved.
//

import Foundation

private enum Keys {
    static var cities = "Defaults.city"
}

class UserDefaultsStorage: StorageProtocol {
    let store: UserDefaults
    
    init() {
        store = .standard
    }
    
    func getCities() -> [String] {
        return store.stringArray(forKey: Keys.cities) ?? []
    }
    
    func storeCity(_ city: String) {
        store.mutableArrayValue(forKey: Keys.cities).add(city)
    }
    
    func removeCity(_ city: String) {
        store.mutableArrayValue(forKey: Keys.cities).remove(city)
    }
}
