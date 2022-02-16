//
//  BaseViewController.swift
//  Pump
//
//  Created by Снытин Ростислав on 15.02.2022.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTabBar()
    }
    
    func setUpTabBar() {
        self.tabBarController?.tabBar.unselectedItemTintColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.5)
        self.tabBarController?.tabBar.backgroundColor = .black
        self.tabBarController?.tabBar.tintColor = .white
    }
    
}
