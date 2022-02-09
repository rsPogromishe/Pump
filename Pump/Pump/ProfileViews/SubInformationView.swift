//
//  SubInformationView.swift
//  Pump
//
//  Created by Снытин Ростислав on 05.02.2022.
//

import UIKit

class SubInformationView: UIView {
    
    let userData = UserData.shared
    
    @IBOutlet var contentView: UIView!
    
    @IBOutlet weak var modelLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var versionLabel: UILabel!
    @IBOutlet weak var activationLabel: UILabel!
    
    @IBOutlet weak var modelNumberLabel: UILabel!
    @IBOutlet weak var serialNumberLabel: UILabel!
    @IBOutlet weak var versionNumberLabel: UILabel!
    @IBOutlet weak var activationDateLabel: UILabel!
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
        
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
        modelNumberLabel.text = userData.numberOfModel
        serialNumberLabel.text = userData.serialNumber
        versionNumberLabel.text = userData.versionNumber
        activationDateLabel.text = userData.activationDateOfModel
    }
        
    private func commonInit() {
        Bundle.main.loadNibNamed("SubInformationView", owner: self, options: nil)
        addSubview(contentView)
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = bounds
        contentView.updateConstraintsIfNeeded()
    }
    
    @IBAction func disconnectButtonTapped(_ sender: Any) {
    
    }
    
}
