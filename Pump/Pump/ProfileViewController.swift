//
//  ProfileViewController.swift
//  Pump
//
//  Created by Снытин Ростислав on 06.01.2022.
//

import UIKit

class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "BG")!)
        self.tabBarController?.tabBar.backgroundColor = .black
        self.tabBarController?.tabBar.tintColor = .white
       
    }
    

}
