//
//  UITableView+Extensions.swift
//  Pods-YFZSwiftExtensions_Example
//
//  Created by YosiFZ on 28/06/2020.
//

import UIKit

@available(iOS 11.0, tvOS 11.0, *)
public extension UITableView {
    convenience init(frame:CGRect = .zero, style:UITableView.Style, dataSource:UITableViewDataSource? = nil, delegate:UITableViewDelegate? = nil) {
        self.init(frame:frame, style:style)
        
        self.dataSource = dataSource
        self.delegate = delegate
    }
}
