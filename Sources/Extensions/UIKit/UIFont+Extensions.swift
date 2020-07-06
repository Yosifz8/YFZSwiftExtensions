//
//  UIFont+Extensions.swift
//  Pods-YFZSwiftExtensions_Example
//
//  Created by YosiFZ on 30/06/2020.
//

import Foundation

@available(iOS 11.0, tvOS 11.0, *)
public extension UIFont {
    static func regularFont(_ size : CGFloat) -> UIFont {
        return UIFont(name: "HelveticaNeue", size: size)!
    }
    
    static func boldFont(_ size : CGFloat) -> UIFont {
        return UIFont(name:"HelveticaNeue-Bold", size: size)!
    }
}
