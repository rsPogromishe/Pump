//
//  Model.swift
//  Pump
//
//  Created by Снытин Ростислав on 05.01.2022.
//

import Foundation

var random = Random()

class Model {
    
    var indexAHI = random.randomIndexAHI()
    var usageHours = random.randomUsageHours()
    var usageMinutes = random.randomUsageMinutes()
    var eventsPerHour = random.randomEventsPerHours()
    var maskOnOff = random.randomMaskOnOff()
    var maskSeal = random.randomMaskSeal()
    
}
