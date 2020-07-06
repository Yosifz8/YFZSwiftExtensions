//
//  CGSize+Layout.swift
//  Pods-YFZSwiftExtensions_Example
//
//  Created by YosiFZ on 30/06/2020.
//

import Foundation

@available(iOS 11.0, tvOS 11.0, *)
public extension CGSize {
    static func equalEdge(_ edge: CGFloat) -> CGSize {
        return .init(width: edge, height: edge)
    }
}
