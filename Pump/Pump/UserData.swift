//
//  UserData.swift
//  Pump
//
//  Created by Снытин Ростислав on 06.02.2022.
//

import Foundation

class UserData {
    var userInfo: User
    var device: Device
    
    init() {
        userInfo = User()
        device = Device()
    }
}
class User {
    var user: String
    var userName: String
    var registration: String
    var userDateRegistration: String
    
    init() {
        user = "Name"
        userName = "Voypel Proshka"
        registration = "Registration"
        userDateRegistration = DateFormat.yesterday()
    }
}
class Device {
    var model: String
    var numberOfModel: String
    var number: String
    var serialNumber: String
    var version: String
    var versionNumber: String
    var activate: String
    var activationDateOfModel: String
    
    init() {
        model = "Loewenstein medical"
        numberOfModel = "v40"
        number = "Seriennummer"
        serialNumber = "32002951"
        version = "Firmware-Version"
        versionNumber = "3.5.0014"
        activate = "Activation Date"
        activationDateOfModel = DateFormat.dateToday(formatter: "MMMM dd, yyyy")
    }
}
