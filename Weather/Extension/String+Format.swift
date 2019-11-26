//
//  String+Format.swift
//  Calendar
//
//  Created by Pavlo Boiko on 11/26/19.
//  Copyright © 2019 Pavlo Boiko. All rights reserved.
//

import Foundation

extension String {
    var firstUppercased: String {
        return prefix(1).uppercased() + self.lowercased().dropFirst()
    }
}
