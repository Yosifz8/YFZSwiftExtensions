//
//  Bool+Extensions.swift
//  Pods-YFZSwiftExtensions_Example
//
//  Created by YosiFZ on 29/06/2020.
//

import Foundation

@available(iOS 11.0, tvOS 11.0, *)
public extension Bool {
    mutating func toggle() {
        self = !self
    }
    
    var toInt: Int {
        return self ? 1 : 0
    }
    
    var toString: String {
        return self ? "true" : "false"
    }
}
