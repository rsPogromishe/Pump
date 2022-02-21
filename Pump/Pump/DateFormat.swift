//
//  DateFormatter.swift
//  Pump
//
//  Created by Снытин Ростислав on 30.12.2021.
//

import Foundation

class DateFormat {
    
    static func dateToday(formatter: String) -> String {
        let format = DateFormatter()
        format.dateFormat = formatter
        format.locale = Locale(identifier: "en_EN")
        return format.string(from: Date()).capitalized
    }
    
    static func yesterday() -> String {
        let yesterday = Calendar.current.date(byAdding: .day, value: -7, to: Date())
        guard let yesterday = yesterday else {
            return ""
        }
     
        let format = DateFormatter()
        format.dateFormat = "MMMM dd, yyyy"
        format.locale = Locale(identifier: "en_EN")
        return format.string(from: yesterday).capitalized
    }
    
}
