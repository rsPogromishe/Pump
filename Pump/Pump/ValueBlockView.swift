//
//  ValueBlockView.swift
//  Pump
//
//  Created by Снытин Ростислав on 06.02.2022.
//

import UIKit

enum TypeOfView {
    case usageHours
    case eventsPerHours
    case maskOnOff
    case maskSeal
}

class ValueBlockView: UIView {
    
    @IBOutlet var contentView: UIView!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var informationLabel: UILabel!
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var progressLabel: UILabel!
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
        
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
        
    private func commonInit() {
        Bundle.main.loadNibNamed("ValueBlockView", owner: self, options: nil)
        addSubview(contentView)
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = bounds
        //#warning("Не нужно это здесь")
    }
    
    func selectTypeOfView(withType type: TypeOfView, model: Model) {
        switch type {
        case .usageHours:
            usageHours(model: model)
        case .eventsPerHours:
            eventsPerHours(model: model.eventsPerHour)
        case .maskOnOff:
            maskOnOff(model: model.maskOnOff)
        case .maskSeal:
            maskSeal(model: model.maskSeal)
        }
    }
    
    //#warning("Сюда уже можно передавать только необходимые данные")
    func usageHours(model: Model) {
        titleLabel.text = "Usage Hours"
        informationLabel.text = "\(model.usageHours):\(model.usageMinutes)"
        progressView.progress = (Float(model.usageHours) ?? 0) / 10
        progressLabel.text = "\(model.usageHours)/10"
    }
    
    func eventsPerHours(model: String) {
        titleLabel.text = "Events Per Hours"
        informationLabel.text = model
        progressView.progress = (Float(model) ?? 0) / 5
        if let randomNumber = NumberFormatter().number(from: model) {
            let randomInt = randomNumber.intValue
            progressLabel.text = "\(randomInt)/5"
        }
    }
    
    func maskOnOff(model: String) {
        titleLabel.text = "Mask On/Off"
        informationLabel.text = model
        progressView.progress = (Float(model) ?? 0) / 5
        progressLabel.text = "\(model)/5"
    }
    
    func maskSeal(model: String) {
        titleLabel.text = "Mask Seal"
        if let randomNumber = NumberFormatter().number(from: model) {
            let randomInt = randomNumber.intValue
            switch randomInt {
            case 0...5:
                progressLabel.text = "\(randomInt)/20"
                informationLabel.text = "Bad"
            case 6...10:
                progressLabel.text = "\(randomInt)/20"
                informationLabel.text = "Normal"
            case 11...15:
                progressLabel.text = "\(randomInt)/20"
                informationLabel.text = "Good"
            case 16...20:
                progressLabel.text = "\(randomInt)/20"
                informationLabel.text = "Excellent"
            default:
                break
            }
            progressView.progress = Float(randomInt) / 20
        }
    }
}
