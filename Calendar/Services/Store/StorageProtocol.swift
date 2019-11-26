//
//  StorageProtocol.swift
//  Calendar
//
//  Created by Pavlo Boiko on 11/26/19.
//  Copyright © 2019 Pavlo Boiko. All rights reserved.
//

import Foundation

protocol StorageProtocol {
    func getCities() -> [String]
    func storeCity(_ city: String)
    func removeCity(_ city: String)
}
