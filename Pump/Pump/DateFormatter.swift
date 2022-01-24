//
//  DateFormatter.swift
//  Pump
//
//  Created by Снытин Ростислав on 30.12.2021.
//

import Foundation

class DateFormat {
    #warning("Метод в себя получается сегодняшнюю дату")
    static func dateToday(day: Date) -> String {
        #warning("Потом она здесь снова инициализируется и используется уже она, а не переданная в метод, тогда для чего метод в себя берёт дату?")
        let date = Date()
        let format = DateFormatter()
        format.dateFormat = "EEEE, MMMM dd"
        #warning("А потом здесь создаётся новая переменная String с таким же именем, что и переданная в метод")
        let day = format.string(from: date)
        return day
    }
    
    
}
