//
//  UIDatePicker+Extensions.swift
//  Pods-YFZSwiftExtensions_Example
//
//  Created by YosiFZ on 29/06/2020.
//

import Foundation

@available(iOS 11.0, tvOS 11.0, *)
public extension UIDatePicker {
    
    convenience init(frame:CGRect, datePickerMode:UIDatePicker.Mode = .dateAndTime, date:Date, minimumDate:Date, maximumDate:Date, timeZone:TimeZone? = nil) {
        self.init(frame:frame)
        
        self.datePickerMode = datePickerMode
        self.timeZone = timeZone
        self.date = date
        self.minimumDate = minimumDate
        self.maximumDate = maximumDate
    }
    
    static func createDatePicker(frame:CGRect, date:Date, minimumDate:Date, maximumDate:Date, timeZone:TimeZone? = nil) -> UIDatePicker {
        return UIDatePicker(frame:frame, date:date, minimumDate:minimumDate, maximumDate:maximumDate)
    }
    
    static func createCountDown(frame:CGRect, countDownDuration:TimeInterval, minuteInterval:Int) -> UIDatePicker {
        let picker = UIDatePicker(frame:frame)
        picker.datePickerMode = .countDownTimer
        picker.countDownDuration = countDownDuration
        picker.minuteInterval = minuteInterval
        
        return picker
    }
    
    func setDate(from string: String, format: String, animated: Bool = true) {
        let formater = DateFormatter()
        formater.dateFormat = format
        let date = formater.date(from: string) ?? Date()
        setDate(date, animated: animated)
    }
    
    var textColor: UIColor? {
        get {
            return value(forKeyPath: "textColor") as? UIColor
        } set {
            setValue(newValue, forKeyPath: "textColor")
        }
    }
}
