//
//  URLRequest+Extensions.swift
//  Pods-YFZSwiftExtensions_Example
//
//  Created by YosiFZ on 29/06/2020.
//

import Foundation

@available(iOS 11.0, tvOS 11.0, *)
public struct ContentType: ExpressibleByStringLiteral {
    public static let json = ContentType("application/json")
    public static let text = ContentType("text/plain")
    public static let xml = ContentType("text/xml")
    public static let urlEncoded = ContentType("application/x-www-form-urlencoded")
    public static let multipartFormData = ContentType("multipart/form-data")
    
    public init(stringLiteral value: String) {
        self.value = value
    }
    
    let value: String
}

@available(iOS 11.0, tvOS 11.0, *)
public enum Method: String {
    case GET = "GET",
        POST = "POST",
        PUT = "PUT",
        DELETE = "DELETE",
        PATCH = "PATCH"
}

@available(iOS 11.0, tvOS 11.0, *)
public extension URLRequest {
    init(url: String) {
        self.init(url: URL(string: url)!)
    }
    
    init(url:URL, userAgent:String, cachePolicy:CachePolicy = .useProtocolCachePolicy, timeInterval:TimeInterval = 60) {
        self.init(url: url, cachePolicy: cachePolicy, timeoutInterval: timeInterval)
        setValue(userAgent, forHTTPHeaderField: "User-Agent")
    }
    
    func set(method: Method) -> URLRequest {
        var req = self
        req.httpMethod = method.rawValue
        return req
    }
    
    func set(contentType: ContentType) -> URLRequest {
        set(header: "Content-Type", value: contentType.value)
    }
    
    func set(header: String, value: String) -> URLRequest {
        var req = self
        req.setValue(value, forHTTPHeaderField: header)
        return req
    }
    
    func set(body: String) -> URLRequest {
        set(body: body.data(using: .utf8)!)
    }
    
    func set(body: Data) -> URLRequest {
        var req = self
        req.httpBody = body
        return req
    }
}
