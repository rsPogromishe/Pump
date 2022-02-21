//
//  SubInformationView.swift
//  Pump
//
//  Created by Снытин Ростислав on 05.02.2022.
//

import UIKit

class SubInformationView: UIView {
    
    var delegate: SubInformationDelegate?
    
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
    
    func configure(data: UserData) {
        
        modelNumberLabel.text = data.device.numberOfModel
        serialNumberLabel.text = data.device.serialNumber
        versionNumberLabel.text = data.device.versionNumber
        activationDateLabel.text = data.device.activationDateOfModel
    }
    
    @IBAction func disconnectButtonTapped(_ sender: Any) {
        delegate?.disconnect(sender: sender)
    }

}

protocol SubInformationDelegate: AnyObject {
    func disconnect(sender: Any)
}
