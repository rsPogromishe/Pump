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
    
    //#warning("Вертикальный UIStackView здесь лучше подойдёт, тк тебе может потребоваться добавить ещё одно Поле - Значение, сейчас это будет проблематично")
    
    //#warning("Сепаратор между Полем и Значением как в дизайне так и не сделал")
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
        
    //#warning("А если данные о пользователе придут после того, как метод init вызовется, то как обновлять эту вью. Описывай метод отдельный метод configure и вызывай его во viewDidLoad, в этом случае ты сможешь обновлять данные по мере прихода информации")
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
    
    //#warning("Вью должна прокидывать action во вью контроллер. Опиши Delegate, с помощью которого контроллер подпишется на ивент о logout")
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
