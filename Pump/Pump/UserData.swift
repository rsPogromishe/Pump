//
//  UserData.swift
//  Pump
//
//  Created by Снытин Ростислав on 06.02.2022.
//

import Foundation

/*
 class Obj: NSObject {
     var prop: String
     
     override init() {
         prop = "Prop"
         
         super.init()
     }
     
     
     init(prop: String) {
         self.prop = prop
         
         super.init()
     }
 }
 */
 

class UserData {
    #warning("Вынеси класс за класс UserData и вставь сюда свойством и проинициализируй с помощью init метода")
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
    
    /*
     var obj: Obj
     
     init() {
         obj = Obj()
     }
     */
}
