//
//  Date+Formatted.swift
//  Calendar
//
//  Created by Pavlo Boiko on 11/23/19.
//  Copyright © 2019 Pavlo Boiko. All rights reserved.
//

import Foundation

public enum DateFormat: String {
    case dayWeek = "dd EEEE"
    case hour = "hh"
    case dayMonthYear = "dd-MM-YYYY-Z"
    
    var formatter: DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = .current
        dateFormatter.dateFormat = rawValue
        return dateFormatter
    }
}

extension Date {
    func formatted(format: DateFormat) -> String {
        return format.formatter.string(from: self)
    }
    
    func roundToDay() -> Date {
        var calendar =  Calendar.current
        calendar.timeZone = .current
        let components = calendar.dateComponents([.year, .month, .day, .timeZone], from: self)
        return calendar.date(from: components) ?? Date()
    }
}

extension Date: Identifiable {
    public var id: Date {
        self
    }
}
