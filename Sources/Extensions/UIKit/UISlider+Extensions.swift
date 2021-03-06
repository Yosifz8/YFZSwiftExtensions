//
//  UISlider+Extensions.swift
//  Pods-YFZSwiftExtensions_Example
//
//  Created by YosiFZ on 29/06/2020.
//

import Foundation

@available(iOS 11.0, tvOS 11.0, *)
public extension UISlider {
    convenience init(frame:CGRect, value:Float = 0.0, minimumValue:Float = 0.0, maximumValue:Float = 1.0, isContinuous:Bool = true) {
        self.init(frame: frame)
        self.minimumValue = minimumValue
        self.maximumValue = minimumValue
        
        if value >= minimumValue && value <= maximumValue {
            self.value = value
        }
        
        self.isContinuous = isContinuous
    }
}
