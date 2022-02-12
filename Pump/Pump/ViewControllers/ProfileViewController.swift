//
//  ProfileViewController.swift
//  Pump
//
//  Created by Снытин Ростислав on 06.01.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    #warning("UIScrollView имеет bottom constraint -100, потом нижняя вью имеет 110. Получается ты сделал UIScrollView выше на 100 ниже экрана, а потом контент в ней поднял на 110. UIScrollView не должна в этом кейсе быть ниже даваемого ей места")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

}
