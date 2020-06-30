//
//  UIImageView+Extensions.swift
//  Pods-YFZSwiftExtensions_Example
//
//  Created by YosiFZ on 28/06/2020.
//

import Foundation

extension UIImageView {
    convenience public init(image: UIImage?, contentMode: UIView.ContentMode = .scaleAspectFill) {
        self.init(image: image)
        self.contentMode = contentMode
        self.clipsToBounds = true
    }
    
    func circularImage() {
        self.layer.cornerRadius = self.frame.size.width / 2;
        self.clipsToBounds = true;
    }
    
    func imageFromServerURL(urlStr: String) {
        guard let url = URL(string: urlStr) else { return }
        
        imageFromServerURL(url: url)
    }
    
    func imageFromServerURL(url: URL) {        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error != nil {
                print(error ?? "No Error")
                return
            }
            
            DispatchQueue.main.async(execute: { () -> Void in
                self.image = UIImage(data: data!)
            })
        }.resume()
    }
}
