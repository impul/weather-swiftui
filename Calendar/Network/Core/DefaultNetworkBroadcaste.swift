//
//  DefaultNetworkBroadcaster.swift
//  Calendar
//
//  Created by Pavlo Boiko on 11/20/19.
//  Copyright © 2019 Pavlo Boiko. All rights reserved.
//

import Foundation


public class DefaultNetworkBroadcaster: NetworkBroadcastingInterface {
    private var urlSession: URLSession
    private let serverUrl: String
    
    public init(_ serverUrl: String) {
        self.serverUrl = serverUrl
        urlSession = URLSession.shared
        urlSession.configuration.requestCachePolicy = .reloadIgnoringLocalCacheData
    }
    
    
    public func request<SuccImpModel: Decodable> (
        _ request: RequestProtocol,
        result: @escaping (Result<SuccImpModel, WeatherError>) -> Void
    ) {
        do {
            let urlRequest = try request.build(for: serverUrl)
        
            urlSession.dataTask(with: urlRequest) { (data, _, error) in
                self.handleResponse(response: (data, error), result: result)
            }.resume()
        } catch {
            result(.failure(.request(error)))
        }
    }
    
    func handleResponse<SuccImpModel: Decodable> (
        response: (Data?, Error?),
        result: @escaping (Result<SuccImpModel, WeatherError>) -> Void
    ) {
        guard let data = response.0 else {
            guard let error = response.1 else {
                result(.failure(.unknown))
                return
            }
            result(.failure(WeatherError.http(error)))
            return
        }
        do {
            let object = try JSONDecoder().decode(SuccImpModel.self, from: data)
            result(.success(object))
        } catch {
            result(.failure(.decoding))
        }
    }
}
