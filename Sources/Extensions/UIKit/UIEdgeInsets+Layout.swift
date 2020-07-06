//
//  UIEdgeInsets+Layout.swift
//  Pods-YFZSwiftExtensions_Example
//
//  Created by YosiFZ on 30/06/2020.
//

import Foundation

@available(iOS 11.0, tvOS 11.0, *)
public extension UIEdgeInsets {
    static func allSides(_ side: CGFloat) -> UIEdgeInsets {
        return .init(top: side, left: side, bottom: side, right: side)
    }
}
