//
//  ProfileViewController.swift
//  Pump
//
//  Created by Снытин Ростислав on 06.01.2022.
//

import UIKit

class ProfileViewController: BaseViewController, UserInformationDelegate, SubInformationDelegate {
    
    let dataUser = UserData()
    let dataDevice = UserData()
    
    @IBOutlet weak var userInformationView: UserInformationView!
    @IBOutlet weak var subInformationView: SubInformationView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userInformationView.configure(data: dataUser)
        subInformationView.configure(data: dataDevice)
        userInformationView.delegate = self
        subInformationView.delegate = self
    }
    
    func logout(sender: Any) {
        print("logout")
    }
    
    func disconnect(sender: Any) {
        print("disconnect")
    }
}
