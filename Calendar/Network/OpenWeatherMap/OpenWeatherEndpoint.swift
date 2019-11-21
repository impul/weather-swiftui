//
//  OpenWeatherEndpoint.swift
//  Calendar
//
//  Created by Pavlo Boiko on 11/20/19.
//  Copyright © 2019 Pavlo Boiko. All rights reserved.
//

import Foundation

enum OpenWeatherEndpoint: RequestProtocol {
    case weather5days3hours(inCity: String)
    
    var path: String {
        switch self {
        case .weather5days3hours(let city):
            return "/data/2.5/forecast?q=\(city)&appid=a9f64ccd2f781cff0d2c0b009bdab6f7"
        }
    }

    var extraHeaders: HTTPHeader? { nil }
    
    var parameters: HTTParametrs? { nil }
    
    var requestType: RequestType { .get }

}
