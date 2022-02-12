//
//  DateFormatter.swift
//  Pump
//
//  Created by Снытин Ростислав on 30.12.2021.
//

import Foundation

class DateFormat {
    static func dateToday(day: Date, formatter: String) -> String {
        let format = DateFormatter()
        format.dateFormat = formatter
        return format.string(from: day)
    }
    
    static func yesterday(date: Date) -> String? {
        let yesterday = Calendar.current.date(byAdding: .day, value: -7, to: date)
        guard let yesterday = yesterday else {
            return nil
        }
     
        let format = DateFormatter()
        format.dateFormat = "MMMM dd, yyyy"
        return format.string(from: yesterday)
    }
    
}
