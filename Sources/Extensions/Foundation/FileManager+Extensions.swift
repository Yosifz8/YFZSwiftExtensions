//
//  FileManager+Extensions.swift
//  Pods-YFZSwiftExtensions_Example
//
//  Created by YosiFZ on 29/06/2020.
//

import Foundation

extension FileManager {
    //Get list of files in folder (document ad ect.....)
    //get list of files by extention
    
    
    
    
    static func getDocumentsDirectory() -> URL {
       let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
       let documentsDirectory = paths[0]
       return documentsDirectory
    }
}
