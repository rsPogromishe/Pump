//
//  UserInformation.swift
//  Pump
//
//  Created by Снытин Ростислав on 02.02.2022.
//

import UIKit

class UserInformationView: UIView {
    
    var delegate: UserInformationDelegate?

    @IBOutlet weak var contentView: UIView!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var registrationLabel: UILabel!
    
    @IBOutlet weak var nameOfUserLabel: UILabel!
    @IBOutlet weak var dateOfRegistrationLabel: UILabel!
    
    //#warning("UIStackView вертикальный и так предполагает, что вьюхи друг за другом, констреинты то для чего, выставляй в савьюхах конкретное значение высоты")
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
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
    
    func configure(data: UserData) {
        nameLabel.text = data.userInfo.user
        nameOfUserLabel.text = data.userInfo.userName
        registrationLabel.text = data.userInfo.registration
        dateOfRegistrationLabel.text = data.userInfo.userDateRegistration
    }

    @IBAction func logoutButtonTapped(_ sender: Any) {
        delegate?.logout(sender: sender)
    }
    
}

protocol UserInformationDelegate {
    func logout(sender: Any)
}
