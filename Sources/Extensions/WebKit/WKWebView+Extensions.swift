//
//  WKWebView+Extensions.swift
//  Pods-YFZSwiftExtensions_Example
//
//  Created by YosiFZ on 28/06/2020.
//

import WebKit

extension WKWebView {
    
    convenience init(frame:CGRect = .zero, uiDelegate:WKUIDelegate? = nil, navigationDelegate:WKNavigationDelegate? = nil, customUserAgent:String? = nil) {
        let webConfiguration = WKWebViewConfiguration()
        
        self.init(frame: frame, configuration: webConfiguration)
        self.uiDelegate = uiDelegate
        self.navigationDelegate = navigationDelegate
        self.customUserAgent = customUserAgent
    }
    
    func load(urlString: String) {
        if let url = URL(string: urlString) {
            let request = URLRequest(url: url)
            load(request)
        }
    }
    
    func load(url: URL) {
        let request = URLRequest(url: url)
        load(request)
    }
}
