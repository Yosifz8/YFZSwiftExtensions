//
//  Int+Extensions.swift
//  Pods-YFZSwiftExtensions_Example
//
//  Created by YosiFZ on 29/06/2020.
//

import Foundation

extension Int {
    func multiply(by multiplier: Int) -> Int {
        return self * multiplier
    }
    
    var isEven: Bool {
      return self%2 == 0
    }
    
    var isOdd: Bool {
      return self%2 == 0
    }
}
