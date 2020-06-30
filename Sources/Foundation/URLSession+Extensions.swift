//
//  URLSession+Extensions.swift
//  Pods-YFZSwiftExtensions_Example
//
//  Created by YosiFZ on 28/06/2020.
//

import Foundation

extension URLSession {
    func makeHTTPReqest(url:URL, method:String = "GET", completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> () {
        var request = URLRequest(url: url)
        request.httpMethod = method
        
        URLSession.shared.dataTask(with: request, completionHandler: completionHandler).resume()
    }
    
    func makeHTTPReqest(url:String, method:String = "GET", completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> () {
        guard let url = URL(string: url) else {
            completionHandler(nil,nil,URLError(URLError.Code.init(rawValue: -159159)))
            return;
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = method
        
        URLSession.shared.dataTask(with: request, completionHandler: completionHandler).resume()
    }
    
    func makeHTTPReqest(request: URLRequest, with completion: @escaping (Data?, URLResponse?, Error?) -> Void) {
        URLSession.shared.dataTask(with: request, completionHandler: completion).resume()
    }
}
