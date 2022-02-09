//
//  UserData.swift
//  Pump
//
//  Created by Снытин Ростислав on 06.02.2022.
//

import Foundation

class UserData {
    static let shared = UserData()
    
    let userName = "Voypel Proshka"
    let userDateRegistration = DateFormat.yesterday(date: Date())
    
    let numberOfModel = "v40"
    let serialNumber = "32002951"
    let versionNumber = "3.5.0014"
    let activationDateOfModel = DateFormat.dateToday(day: Date(), formatter: "MMMM dd, yyyy")
}
