//
//  UISearchBar+Extensions.swift
//  Pods-YFZSwiftExtensions_Example
//
//  Created by YosiFZ on 29/06/2020.
//

import Foundation

extension UISearchBar {
    var textField : UITextField? {
        if #available(iOS 13.0, *) {
            return self.searchTextField
        } else {
            for view: UIView in (self.subviews[0]).subviews {
                if let textField = view as? UITextField {
                    return textField
                }
            }
        }
        return nil
    }
    
    func trimmedText() -> String? {
        return text?.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    func clear() {
        text = ""
    }
}
