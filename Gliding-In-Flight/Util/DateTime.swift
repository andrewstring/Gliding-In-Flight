//
//  Date.swift
//  Gliding-In-Flight
//
//  Created by Andrew on 1/30/24.
//

import Foundation

struct DateTime {
    typealias comp = Int
    
    let timeZone: comp
    let month: comp
    let day: comp
    let year: comp
    let hour: comp
    let minute: comp
    let second: comp
    
    static func getDateTime() -> DateTime {
        let date = Date()
        let calendar = Calendar.current
        let timeZone = calendar.component(.timeZone, from: date)
        let month = calendar.component(.month, from: date)
        let day = calendar.component(.day, from: date)
        let year = calendar.component(.year, from: date)
        let hour = calendar.component(.hour, from: date)
        let minute = calendar.component(.minute, from: date)
        let second = calendar.component(.second, from: date)
        
        return DateTime(
            timeZone: timeZone, month: month, day: day, year: year, hour: hour, minute: minute, second: second
        )
    }
    
    func toString() -> String {
        return "\(self.timeZone) \(self.month)\(self.day)\(self.year)\(self.hour)"
            + "\(self.minute)\(self.second)"
    }
}
