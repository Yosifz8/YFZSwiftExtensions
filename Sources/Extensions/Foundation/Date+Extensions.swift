//
//  Date+Extensions.swift
//  Pods-YFZSwiftExtensions_Example
//
//  Created by YosiFZ on 28/06/2020.
//

import Foundation

@available(iOS 11.0, tvOS 11.0, *)
public extension Date {
    init?(dateString:String, dateFormat:String) {
        let dateStringFormatter = DateFormatter()
        dateStringFormatter.dateFormat = dateFormat
        let date = dateStringFormatter.date(from: dateString)!
        self.init(timeInterval:0, since:date)
    }
    
    init?(dateString:String, dateFormat:String, local:Locale) {
        let dateStringFormatter = DateFormatter()
        dateStringFormatter.dateFormat = dateFormat
        dateStringFormatter.locale = local
        let date = dateStringFormatter.date(from: dateString)!
        self.init(timeInterval:0, since:date)
    }
    
    static func date(dateString:String, dateFormat:String) -> Date? {
        let dateStringFormatter = DateFormatter()
        dateStringFormatter.dateFormat = dateFormat
        let date = dateStringFormatter.date(from: dateString)!
        return self.init(timeInterval:0, since:date)
    }
    
    static func date(dateString:String, dateFormat:String, local:Locale) -> Date? {
        let dateStringFormatter = DateFormatter()
        dateStringFormatter.dateFormat = dateFormat
        dateStringFormatter.locale = local
        let date = dateStringFormatter.date(from: dateString)!
        return self.init(timeInterval:0, since:date)
    }
    
    func string(withFormat format: String = "dd/MM/yyyy HH:mm") -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
    
    func string(withFormat format: String = "dd/MM/yyyy HH:mm", local:Locale) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        dateFormatter.locale = local
        return dateFormatter.string(from: self)
    }

    func dateString(ofStyle style: DateFormatter.Style = .medium) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = .none
        dateFormatter.dateStyle = style
        return dateFormatter.string(from: self)
    }
    
    func dateString(ofStyle style: DateFormatter.Style = .medium, local:Locale) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = .none
        dateFormatter.dateStyle = style
        dateFormatter.locale = local
        return dateFormatter.string(from: self)
    }
    
    func timeString(ofStyle style: DateFormatter.Style = .medium) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = style
        dateFormatter.dateStyle = .none
        return dateFormatter.string(from: self)
    }
    
    func timeString(ofStyle style: DateFormatter.Style = .medium, local:Locale) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = style
        dateFormatter.dateStyle = .none
        dateFormatter.locale = local
        return dateFormatter.string(from: self)
    }

    func dateTimeString(ofStyle style: DateFormatter.Style = .medium) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = style
        dateFormatter.dateStyle = style
        return dateFormatter.string(from: self)
    }
    
    func dateTimeString(ofStyle style: DateFormatter.Style = .medium, local:Locale) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = style
        dateFormatter.dateStyle = style
        dateFormatter.locale = local
        return dateFormatter.string(from: self)
    }

    func secondsSince(_ date: Date) -> Double {
        return timeIntervalSince(date)
    }

    func minutesSince(_ date: Date) -> Double {
        return timeIntervalSince(date)/60
    }

    func hoursSince(_ date: Date) -> Double {
        return timeIntervalSince(date)/3600
    }

    func daysSince(_ date: Date) -> Double {
        return timeIntervalSince(date)/(3600*24)
    }
    
    //
    static func localDate() -> Date {
        let timezone = TimeZone.current
        let seconds = TimeInterval(timezone.secondsFromGMT(for: Date()))
        return Date(timeInterval: seconds, since: Date())
    }
    
    var month: Int {
       let cal = Calendar.current
       return cal.dateComponents([.month], from: self).month ?? 0
    }
    
    var day: Int {
       let cal = Calendar.current
       return cal.dateComponents([.day], from: self).day ?? 0
    }
    
    var year: Int {
       let cal = Calendar.current
       return cal.dateComponents([.year], from: self).year ?? 0
    }
    
    var second: Int {
       let cal = Calendar.current
       return cal.dateComponents([.second], from: self).second ?? 0
    }
    
    var minute: Int {
       let cal = Calendar.current
       return cal.dateComponents([.minute], from: self).minute ?? 0
    }
    
    var hour: Int {
       let cal = Calendar.current
       return cal.dateComponents([.hour], from: self).hour ?? 0
    }
}
