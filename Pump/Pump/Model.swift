//
//  Model.swift
//  Pump
//
//  Created by Снытин Ростислав on 05.01.2022.
//

import Foundation

var random = Random()

class Model {
    
    var indexAHI: String
    var usageHours: String
    var usageMinutes: String
    var eventsPerHour: String
    var maskOnOff: String
    var maskSeal: String
    
    init() {
        indexAHI = random.randomIndexAHI()
        usageHours = random.randomUsageHours()
        usageMinutes = random.randomUsageMinutes()
        eventsPerHour = random.randomEventsPerHours()
        maskOnOff = random.randomMaskOnOff()
        maskSeal = random.randomMaskSeal()
    }
}
