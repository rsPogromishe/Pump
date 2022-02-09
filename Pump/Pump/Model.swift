//
//  Model.swift
//  Pump
//
//  Created by Снытин Ростислав on 05.01.2022.
//

import Foundation

struct Model {
    let indexAHI: Double = 0
    let usageHours: Int = 0
    let eventsPerHour: Int = 0
    let maskOnOff: Int = 0
    let maskSeal: String = ""
}

extension Model {
    func randomIndexAHI() -> String {
        let randomIndex = Double.random(in: 0...45)
        let randomIndexStr = String(format: "%.2f", randomIndex)
        return randomIndexStr
    }
    
    func randomUsageHours() -> String {
        let randomUsageHours = Int.random(in: 0..<10)
        return String(randomUsageHours)
    }
    
    func randomUsageMinutes() -> String {
        let randomUsageMinutes = Int.random(in: 0...59)
        let randomUsageMinutesStr = String(format: "%02d", randomUsageMinutes)
        return randomUsageMinutesStr
    }
    
    func randomEventsPerHours() -> String {
        let randomEvents = Double.random(in: 0...5)
        let randomEventsStr = String(format: "%.1f", randomEvents)
        return randomEventsStr
    }
    
    func randomMaskOnOff() -> String {
        let randomMask = Int.random(in: 0...5)
        return String(randomMask)
    }
    
    func randomMaskSeal() -> String {
        let randomMask = Int.random(in: 0...20)
        return String(randomMask)
    }
}
