//
//  UserData.swift
//  Pump
//
//  Created by Снытин Ростислав on 06.02.2022.
//

import Foundation

class UserData {
    
    class User {
        let user = "Name"
        let userName = "Voypel Proshka"
        let registration = "Registration"
        let userDateRegistration = DateFormat.yesterday()
    }
    
    class Device {
        let model = "Loewenstein medical"
        let numberOfModel = "v40"
        let number = "Seriennummer"
        let serialNumber = "32002951"
        let version = "Firmware-Version"
        let versionNumber = "3.5.0014"
        let activate = "Activation Date"
        let activationDateOfModel = DateFormat.dateToday(formatter: "MMMM dd, yyyy")
    }
}
