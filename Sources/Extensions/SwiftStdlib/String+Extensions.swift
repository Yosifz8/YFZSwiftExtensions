//
//  String+Extensions.swift
//  Pods-YFZSwiftExtensions_Example
//
//  Created by YosiFZ on 28/06/2020.
//

import Foundation

extension String {
    //convert string to json object or array
    
    init?(base64: String) {
        guard let decodedData = Data(base64Encoded: base64) else { return nil }
        guard let str = String(data: decodedData, encoding: .utf8) else { return nil }
        self.init(str)
    }
    
    init(randomOfLength length: Int) {
        guard length > 0 else {
            self.init()
            return
        }

        let base = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"
        var randomString = ""
        for _ in 1...length {
            randomString.append(base.randomElement()!)
        }
        self = randomString
    }
    
    var url: URL? {
        return URL(string: self)
    }
    
    func base64Encoded() -> String? {
       if let data = self.data(using: .utf8) {
           return data.base64EncodedString()
       }
       return nil
    }
    
    func base64Decoded() -> String? {
        if let data = Data(base64Encoded: self) {
            return String(data: data, encoding: .utf8)
        }
        return nil
    }
    
    func isAlphanumeric() -> Bool {
        let notAlphanumeric = NSCharacterSet.decimalDigits.union(NSCharacterSet.letters).inverted
        return rangeOfCharacter(from: notAlphanumeric, options: String.CompareOptions.literal, range: nil) == nil
    }
    
    func containsOnlyDigits() -> Bool {
        let notDigits = NSCharacterSet.decimalDigits.inverted
        return rangeOfCharacter(from: notDigits, options: String.CompareOptions.literal, range: nil) == nil
    }
    
    func containsOnlyLetters() -> Bool {
        let notLetters = NSCharacterSet.letters.inverted
        return rangeOfCharacter(from: notLetters, options: String.CompareOptions.literal, range: nil) == nil
    }
    
    func isValidEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }
    
//is valid url
    
//    func isValidMobileNumber() -> Bool {
//        do {
//            let detector = try NSDataDetector(types: NSTextCheckingResult.CheckingType.phoneNumber.rawValue)
//            let matches = detector.matches(in: self, options: [], range: NSMakeRange(0, self.characters.count))
//            if let res = matches.first {
//                return res.resultType == .phoneNumber && res.range.location == 0 && res.range.length == self.characters.count
//            } else {
//                return false
//            }
//        } catch {
//            return false
//        }
//    }
    
    func toInt() -> Int {
        Int(self)!
    }
    
    func toIntOrNull() -> Int? {
        Int(self)
    }
    
    func toFloat() -> Float {
        Float(self)!
    }
    
    func toFloatOrNull() -> Float? {
        Float(self)
    }
    
    func toDouble() -> Double {
        Double(self)!
    }
    
    func toDoubleOrNull() -> Double? {
        Double(self)
    }
    
    func toBool() -> Bool {
        Bool(self)!
    }
    
    func toBoolOrNull() -> Bool? {
        Bool(self)
    }
    
    mutating func insert(separator: String, every n: Int) {
        self = inserting(separator: separator, every: n)
    }
    
    func inserting(separator: String, every n: Int) -> String {
        var result: String = ""
        let characters = Array(self)
        stride(from: 0, to: count, by: n).forEach {
            result += String(characters[$0..<min($0+n, count)])
            if $0+n < count {
                result += separator
            }
        }
        return result
    }
    
    func wordCount() -> Int {
        let regex = try? NSRegularExpression(pattern: "\\w+")
        return regex?.numberOfMatches(in: self, range: NSRange(location: 0, length: self.utf16.count)) ?? 0
    }
    
    func withPrefix(_ prefix: String) -> String {
        if self.hasPrefix(prefix) { return self }
        return "\(prefix)\(self)"
    }
    
    func withSuffix(_ suffix: String) -> String {
        if self.hasSuffix(suffix) { return self }
        return "\(self)\(suffix)"
    }
    
    mutating func appendString(str: String) {
        self = self + str
    }
    
    func getLines() -> [String] {
        var result = [String]()
        enumerateLines { line, _ in
            result.append(line)
        }
        return result
    }
    
    func getWords() -> [String] {
        let chararacterSet = CharacterSet.whitespacesAndNewlines.union(.punctuationCharacters)
        let comps = components(separatedBy: chararacterSet)
        return comps.filter { !$0.isEmpty }
    }
    
    func copyToPasteboard() {
        UIPasteboard.general.string = self
    }
    
    mutating func firstCharacterUppercased() {
        guard let first = first else { return }
        self = String(first).uppercased() + dropFirst()
    }
    
    static func random(ofLength length: Int) -> String {
        guard length > 0 else { return "" }
        let base = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        var randomString = ""
        for _ in 1...length {
            randomString.append(base.randomElement()!)
        }
        return randomString
    }
    
    mutating func reverse() -> String {
        let chars: [Character] = reversed()
        self = String(chars)
        return self
    }
    
    func date(withFormat format: String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.date(from: self)
    }
    
    mutating func trim() -> String {
        self = trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        return self
    }
    
    mutating func urlEncode() -> String {
        if let encoded = addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) {
            self = encoded
        }
        return self
    }
    
    func removingPrefix(_ prefix: String) -> String {
        guard hasPrefix(prefix) else { return self }
        return String(dropFirst(prefix.count))
    }
    
    func removingSuffix(_ suffix: String) -> String {
        guard hasSuffix(suffix) else { return self }
        return String(dropLast(suffix.count))
    }
    
    func replace(target: String, withString: String) -> String {
        return self.replacingOccurrences(of: target, with: withString)
    }
    
    func appendLineToURL(fileURL: URL) throws {
        try (self + "\n").appendToURL(fileURL: fileURL)
    }

    func appendToURL(fileURL: URL) throws {
        let data = self.data(using: String.Encoding.utf8)!
        try data.append(fileURL: fileURL)
    }
    
    func hexadecimal() -> Data? {
        var data = Data(capacity: self.count / 2)

        let regex = try! NSRegularExpression(pattern: "[0-9a-f]{1,2}", options: .caseInsensitive)
        regex.enumerateMatches(in: self, range: NSRange(startIndex..., in: self)) { match, _, _ in
            let byteString = (self as NSString).substring(with: match!.range)
            let num = UInt8(byteString, radix: 16)!
            data.append(num)
        }

        guard data.count > 0 else { return nil }

        return data
    }
    
//    func hexColor() -> UIColor? {
//        let hex = self.stringByTrimmingCharactersInSet(NSCharacterSet.alphanumericCharacterSet().invertedSet)
//        var int = UInt32()
//        guard NSScanner(string: hex).scanHexInt(&int) else {
//            return nil
//        }
//        let a, r, g, b: UInt32
//        switch hex.characters.count {
//        case 3: // RGB (12-bit)
//            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
//        case 6: // RGB (24-bit)
//            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
//        case 8: // ARGB (32-bit)
//            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
//        default:
//            return nil
//        }
//        return UIColor(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
//    }
    
    func guessLanguage() -> String {
        let length = self.utf16.count
        let languageCode = CFStringTokenizerCopyBestStringLanguage(self as CFString, CFRange(location: 0, length: length)) as String? ?? ""

        let locale = Locale(identifier: languageCode)
        return locale.localizedString(forLanguageCode: languageCode) ?? "Unknown"
    }
    
    func capitalizingFirstLetter() -> String {
        let first = String(self.prefix(1)).capitalized
        let other = String(self.dropFirst())
        return first + other
    }
    
    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
    
    subscript (bounds: CountableClosedRange<Int>) -> String {
        let start = index(startIndex, offsetBy: bounds.lowerBound)
        let end = index(startIndex, offsetBy: bounds.upperBound)
        return String(self[start...end])
    }

    subscript (bounds: CountableRange<Int>) -> String {
        let start = index(startIndex, offsetBy: bounds.lowerBound)
        let end = index(startIndex, offsetBy: bounds.upperBound)
        return String(self[start..<end])
    }

    subscript (bounds: PartialRangeUpTo<Int>) -> String {
        let end = index(startIndex, offsetBy: bounds.upperBound)
        return String(self[startIndex..<end])
    }

    subscript (bounds: PartialRangeThrough<Int>) -> String {
        let end = index(startIndex, offsetBy: bounds.upperBound)
        return String(self[startIndex...end])
    }

    subscript (bounds: CountablePartialRangeFrom<Int>) -> String {
        let start = index(startIndex, offsetBy: bounds.lowerBound)
        return String(self[start..<endIndex])
    }
    
    subscript(int: Int) -> Character {
      return Array(self)[int]
    }
}
