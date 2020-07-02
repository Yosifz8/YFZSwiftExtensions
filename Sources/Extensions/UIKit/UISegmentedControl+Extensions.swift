//
//  UISegmentedControl+Extensions.swift
//  Pods-YFZSwiftExtensions_Example
//
//  Created by YosiFZ on 29/06/2020.
//

import Foundation

extension UISegmentedControl {
    var segmentTitles: [String] {
        get {
            let range = 0..<numberOfSegments
            return range.compactMap { titleForSegment(at: $0) }
        } set {
            removeAllSegments()
            for (index, title) in newValue.enumerated() {
                insertSegment(withTitle: title, at: index, animated: false)
            }
        }
    }

    var segmentImages: [UIImage] {
        get {
            let range = 0..<numberOfSegments
            return range.compactMap { imageForSegment(at: $0) }
        } set {
            removeAllSegments()
            for (index, image) in newValue.enumerated() {
                insertSegment(with: image, at: index, animated: false)
            }
        }
    }
}
