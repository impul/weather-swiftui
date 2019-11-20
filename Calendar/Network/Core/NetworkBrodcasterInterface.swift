//
//  NetworkBroadcastingInterface.swift
//  Calendar
//
//  Created by Pavlo Boiko on 11/20/19.
//  Copyright © 2019 Pavlo Boiko. All rights reserved.
//

import Foundation

public protocol NetworkBroadcastingInterface {
    func request<SuccImpModel: Decodable> (
        _ request: RequestProtocol,
        result: @escaping (Result<SuccImpModel, WeatherError>) -> Void
    )
}
