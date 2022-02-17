//
//  ProfileViewController.swift
//  Pump
//
//  Created by Снытин Ростислав on 06.01.2022.
//

import UIKit

class ProfileViewController: BaseViewController {
    var delegateUser: UserInformationDelegate?
    var delegateDevice: SubInformationDelegate?
    
    let dataUser = UserData.User()
    let dataDevice = UserData.Device()
    
    @IBOutlet weak var userInformationView: UserInformationView!
    @IBOutlet weak var subInformationView: SubInformationView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userInformationView.configure(data: dataUser)
        subInformationView.configure(data: dataDevice)
        delegateUser?.logout()
        delegateDevice?.disconnect()
    }
 
}
