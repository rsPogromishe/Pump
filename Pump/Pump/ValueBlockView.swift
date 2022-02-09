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
    
    var model = Model()
    
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
        contentView.updateConstraintsIfNeeded()
    }
    
    func selectTypeOfView(withType type: TypeOfView) {
        switch type {
        case .usageHours:
            usageHours()
        case .eventsPerHours:
            eventsPerHours()
        case .maskOnOff:
            maskOnOff()
        case .maskSeal:
            maskSeal()
        }
    }
    
    func usageHours() {
        let random = model.randomUsageHours()
        let randomMinutes = model.randomUsageMinutes()
        titleLabel.text = "Usage Hours"
        informationLabel.text = "\(random):\(randomMinutes)"
        progressView.progress = (Float(random) ?? 0) / 10
        progressLabel.text = "\(random)/10"
    }
    
    func eventsPerHours() {
        let random = model.randomEventsPerHours()
        titleLabel.text = "Events Per Hours"
        informationLabel.text = random
        progressView.progress = (Float(random) ?? 0) / 5
        if let randomNumber = NumberFormatter().number(from: random) {
            let randomInt = randomNumber.intValue
            progressLabel.text = "\(randomInt)/5"
        }
    }
    
    func maskOnOff() {
        let random = model.randomMaskOnOff()
        titleLabel.text = "Mask On/Off"
        informationLabel.text = random
        progressView.progress = (Float(random) ?? 0) / 5
        progressLabel.text = "\(random)/5"
    }
    
    func maskSeal() {
        let random = model.randomMaskSeal()
        titleLabel.text = "Mask Seal"
        if let randomNumber = NumberFormatter().number(from: random) {
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
