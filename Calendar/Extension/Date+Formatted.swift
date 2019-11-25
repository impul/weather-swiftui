//
//  Date+Formatted.swift
//  Calendar
//
//  Created by Pavlo Boiko on 11/23/19.
//  Copyright © 2019 Pavlo Boiko. All rights reserved.
//

import Foundation

public enum DateFormat: String {
    case dayMonth = "dd MM"
    case hour = "hh"
    case dayMonthYear = "d MMMM YYYY"
}

extension Date {
    func formatted(format: DateFormat) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format.rawValue
        return dateFormatter.string(from: self)
    }
}
