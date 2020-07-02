//
//  UITableView+Extensions.swift
//  Pods-YFZSwiftExtensions_Example
//
//  Created by YosiFZ on 28/06/2020.
//

import UIKit

extension UITableView {
    convenience public init(frame:CGRect = .zero, style:UITableView.Style, dataSource:UITableViewDataSource? = nil, delegate:UITableViewDelegate? = nil) {
        self.init(frame:frame, style:style)
        
        self.dataSource = dataSource
        self.delegate = delegate
    }
}
