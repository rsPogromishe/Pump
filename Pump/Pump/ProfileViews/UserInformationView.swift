//
//  UserInformation.swift
//  Pump
//
//  Created by Снытин Ростислав on 02.02.2022.
//

import UIKit

class UserInformationView: UIView {
    
    let userData = UserData.shared

    @IBOutlet weak var contentView: UIView!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var registrationLabel: UILabel!
    
    @IBOutlet weak var nameOfUserLabel: UILabel!
    @IBOutlet weak var dateOfRegistrationLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
        
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
        nameOfUserLabel.text = userData.userName
        dateOfRegistrationLabel.text = userData.userDateRegistration
    }
        
    private func commonInit() {
        Bundle.main.loadNibNamed("UserInformationView", owner: self, options: nil)
        addSubview(contentView)
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = bounds
        contentView.updateConstraintsIfNeeded()
    }
    
    @IBAction func logoutButtonTapped(_ sender: Any) {
        
    }
}
