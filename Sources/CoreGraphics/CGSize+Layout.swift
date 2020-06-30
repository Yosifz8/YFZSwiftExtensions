//
//  CGSize+Layout.swift
//  Pods-YFZSwiftExtensions_Example
//
//  Created by YosiFZ on 30/06/2020.
//

import Foundation

extension CGSize {
    static public func equalEdge(_ edge: CGFloat) -> CGSize {
        return .init(width: edge, height: edge)
    }
}
