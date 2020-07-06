//
//  Data+Extensions.swift
//  Pods-YFZSwiftExtensions_Example
//
//  Created by YosiFZ on 28/06/2020.
//

import Foundation

@available(iOS 11.0, tvOS 11.0, *)
public extension Data {
    func printString() {
        guard let dataAsString = self.toString() else {
            print("ERROR: Could not convert data to string")
            return
        }

        print(dataAsString)
    }

    func toString(encoding: String.Encoding = String.Encoding.utf8) -> String? {
        return String.init(data: self, encoding: encoding)
    }
    
    func append(fileURL: URL) throws {
        if let fileHandle = FileHandle(forWritingAtPath: fileURL.path) {
            defer {
                fileHandle.closeFile()
            }
            fileHandle.seekToEndOfFile()
            fileHandle.write(self)
        }
        else {
            try write(to: fileURL, options: .atomic)
        }
    }
    
    func prettyPrintedJSONString() -> NSString? {
        guard let object = try? JSONSerialization.jsonObject(with: self, options: []),
              let data = try? JSONSerialization.data(withJSONObject: object, options: [.prettyPrinted]),
              let prettyPrintedString = NSString(data: data, encoding: String.Encoding.utf8.rawValue) else { return nil }

        return prettyPrintedString
    }
}
