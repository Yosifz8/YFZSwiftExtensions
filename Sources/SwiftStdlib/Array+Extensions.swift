//
//  Array+Extensions.swift
//  Pods-YFZSwiftExtensions_Example
//
//  Created by YosiFZ on 28/06/2020.
//

import Foundation

extension Array {
    mutating func removeAllAndAdd(array:Array) {
        self.removeAll()
        self.append(contentsOf: array)
    }
    
    mutating func moveItem(fromIndex: Int, toIndex: Int) {
        let element = self.remove(at: fromIndex)
        self.insert(element, at: toIndex)
    }
    
    mutating func insertFirst(_ newElement: Element) {
        insert(newElement, at: 0)
    }
    
    func random() -> Element? {
        guard count > 0 else { return nil }
        let index = Int(arc4random_uniform(UInt32(count)))
        return self[index]
    }
    
    subscript(indexPath: IndexPath) -> Element {
        self[indexPath.row]
    }
}
