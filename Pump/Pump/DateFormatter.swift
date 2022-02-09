//
//  DateFormatter.swift
//  Pump
//
//  Created by Снытин Ростислав on 30.12.2021.
//

import Foundation

class DateFormat {
    //#warning("Метод в себя получается сегодняшнюю дату")
    static func dateToday(day: Date, formatter: String) -> String {
       // #warning("Потом она здесь снова инициализируется и используется уже она, а не переданная в метод, тогда для чего метод в себя берёт дату?")
        let format = DateFormatter()
        format.dateFormat = formatter
       // #warning("А потом здесь создаётся новая переменная String с таким же именем, что и переданная в метод")
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
