//
//  DateFormatter.swift
//  Pump
//
//  Created by Снытин Ростислав on 30.12.2021.
//

import Foundation

class DateFormat {
    static func dateToday(day: Date) -> String {
        let date = Date()
        let format = DateFormatter()
        format.dateFormat = "EEEE, MMMM dd"
        let day = format.string(from: date)
        return day
    }
    
    
}
