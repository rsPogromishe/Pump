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
    
    //#warning("UIScrollView имеет bottom constraint -100, потом нижняя вью имеет 110. Получается ты сделал UIScrollView выше на 100 ниже экрана, а потом контент в ней поднял на 110. UIScrollView не должна в этом кейсе быть ниже даваемого ей места")
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
