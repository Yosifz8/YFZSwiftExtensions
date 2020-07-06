//
//  URL+Extensions.swift
//  Pods-YFZSwiftExtensions_Example
//
//  Created by YosiFZ on 29/06/2020.
//

import Foundation

@available(iOS 11.0, tvOS 11.0, *)
public extension URL {
    var queryParameters: [String: String]? {
        guard let components = URLComponents(url: self, resolvingAgainstBaseURL: true), let queryItems = components.queryItems else {
            return nil
        }

        var parameters = [String: String]()
        for item in queryItems {
            parameters[item.name] = item.value
        }

        return parameters
    }
    
    func appendQueryItems(queryItems: [URLQueryItem]) -> URL? {
        guard var urlComponents = URLComponents.init(url: self, resolvingAgainstBaseURL: true) else {
            return nil
        }

        var currentQueryItems: [URLQueryItem] = urlComponents.queryItems ??  []
        currentQueryItems.append(contentsOf: queryItems)
        urlComponents.queryItems = currentQueryItems
        
        guard let newURL = urlComponents.url else {
            return nil
        }

        return newURL
    }
    
    var fileSize: UInt64? {
        try? FileManager.default.attributesOfItem(atPath: path)[.size] as? UInt64
    }
}
