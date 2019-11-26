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
    
    var cities: [String] {
        set {
            store.set(newValue, forKey: Keys.cities)
        }
        get {
            store.stringArray(forKey: Keys.cities) ?? []
        }
    }
}
