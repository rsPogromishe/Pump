//
//  SubInformationView.swift
//  Pump
//
//  Created by Снытин Ростислав on 05.02.2022.
//

import UIKit

class SubInformationView: UIView, SubInformationDelegate {
    
    @IBOutlet var contentView: UIView!
    
    @IBOutlet weak var modelLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var versionLabel: UILabel!
    @IBOutlet weak var activationLabel: UILabel!
    
    @IBOutlet weak var modelNumberLabel: UILabel!
    @IBOutlet weak var serialNumberLabel: UILabel!
    @IBOutlet weak var versionNumberLabel: UILabel!
    @IBOutlet weak var activationDateLabel: UILabel!

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
        Bundle.main.loadNibNamed("SubInformationView", owner: self, options: nil)
        addSubview(contentView)
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = bounds
        contentView.updateConstraintsIfNeeded()
    }
    
    func configure(data: UserData.Device) {
        
        modelNumberLabel.text = data.numberOfModel
        serialNumberLabel.text = data.serialNumber
        versionNumberLabel.text = data.versionNumber
        activationDateLabel.text = data.activationDateOfModel
    }
    
    //#warning("Вью должна прокидывать action во вью контроллер. Опиши Delegate, с помощью которого контроллер подпишется на ивент о disconnect")
    @IBAction func disconnectButtonTapped(_ sender: Any) {
        disconnect()
    }
    
    func disconnect() {
        print("disconnect")
    }
}

protocol SubInformationDelegate: AnyObject {
    func disconnect()
}
