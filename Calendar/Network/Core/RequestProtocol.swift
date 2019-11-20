//
//  RequestProtocol.swift
//  Calendar
//
//  Created by Pavlo Boiko on 11/20/19.
//  Copyright © 2019 Pavlo Boiko. All rights reserved.
//

import Foundation

public typealias HTTPHeader = [String: String]
public typealias HTTParametrs = [String: Any]

public enum RequestType {
    case post, get
    public var description: String {
        return String(describing: self).uppercased()
    }
}

public protocol RequestProtocol {
    var path: String { get }
    var extraHeaders: HTTPHeader? { get }
    var parameters: HTTParametrs? { get }
    var requestType: RequestType { get }
}

extension RequestProtocol {
    func build(for serverUrl: String) throws -> URLRequest {
        guard let url = URL(string: serverUrl + path) else {
            throw WeatherError.incorrectUrl
        }
        var urlRequest: URLRequest = URLRequest(url: url)
        
        if let params = parameters {
            let data = try JSONSerialization.data(withJSONObject: params, options: .prettyPrinted)
            urlRequest.httpBody = data
        }
        
        if let headers = extraHeaders {
            headers.forEach { (key, value) in
                urlRequest.setValue(value, forHTTPHeaderField: key)
            }
        }
        
        urlRequest.httpMethod = requestType.description
        return urlRequest
    }
}
