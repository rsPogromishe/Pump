//
//  UserInformation.swift
//  Pump
//
//  Created by Снытин Ростислав on 02.02.2022.
//

import UIKit

class UserInformationView: UIView, UserInformationDelegate {

    @IBOutlet weak var contentView: UIView!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var registrationLabel: UILabel!
    
    @IBOutlet weak var nameOfUserLabel: UILabel!
    @IBOutlet weak var dateOfRegistrationLabel: UILabel!
    
    #warning("UIStackView вертикальный и так предполагает, что вьюхи друг за другом, констреинты то для чего, выставляй в савьюхах конкретное значение высоты")
    
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
    
    func configure(data: UserData.User) {
        nameLabel.text = data.user
        nameOfUserLabel.text = data.userName
        registrationLabel.text = data.registration
        dateOfRegistrationLabel.text = data.userDateRegistration
    }
    
    #warning("(НЕ ИСПРАВЛЕНО)Вью должна прокидывать action во вью контроллер. Опиши Delegate, с помощью которого контроллер подпишется на ивент о logout/TODO: в итоге логаут всё так же во вьюхе остался и нтгде не вызывается")
    @IBAction func logoutButtonTapped(_ sender: Any) {
        logout()
    }
    
    func logout() {
        print("logout")
    }
}
protocol UserInformationDelegate {
    func logout()
}
