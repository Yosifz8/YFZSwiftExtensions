//
//  UIView - Extensions.swift
//  Pods-YFZSwiftExtensions_Example
//
//  Created by Yosi Faroh Zada on 28/06/2020.
//

import UIKit

extension UIView {
    public var width: CGFloat {
        get {
            self.frame.size.width
        }
        set(newWidth) {
            self.frame.size.width = newWidth
        }
    }
//    public var width: CGFloat {
//        return self.frame.size.width
//    }

    public var height: CGFloat {
        return self.frame.size.height
    }
    
    public var x: CGFloat {
        return self.frame.origin.x
    }
    
    public var y: CGFloat {
        return self.frame.origin.y
    }
    
    public var centerX: CGFloat {
        return self.center.x
    }
    
    public var centerY: CGFloat {
        return self.center.y
    }
}
