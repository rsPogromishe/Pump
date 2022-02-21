//
//  MainViewController.swift
//  Pump
//
//  Created by Снытин Ростислав on 30.12.2021.
//

import UIKit

class DashboardViewController: BaseViewController {
    //#warning("(НЕ ИСПРАВЛЕНО)Размер мелких графиков теряет пропорциональность по сравнению с тем, что выставлено в дизайне, из-за чего они с более узким экраном становились бы всё вытянутее по вертикали, не ок")
    //#warning("Вьюхи в UIStackView без размеров")
    
    @IBOutlet weak var indexAHIView: IndexAHIView!
    
    @IBOutlet weak var usageHoursView: ValueBlockView!
    @IBOutlet weak var eventsPerHoursView: ValueBlockView!
    @IBOutlet weak var maskOnOffView: ValueBlockView!
    @IBOutlet weak var maskSealView: ValueBlockView!
   
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var refreshButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = DateFormat.dateToday(formatter: "EEEE, MMMM dd")
        self.navigationController?.navigationItem.titleView?.tintColor = .white
        
        setUpResfreshControl()
        
        //#warning("Модель же одна для всех вьюх")
        setUpViews()
    }
    
    func setUpResfreshControl() {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(refresh), for: .valueChanged)
        let refreshString = "Refreshing..."
        let mutableAttributedString = NSMutableAttributedString.init(string: refreshString)
        let range = (refreshString as NSString).range(of: refreshString)
        mutableAttributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.white, range: range)
        refreshControl.attributedTitle = mutableAttributedString
        refreshControl.tintColor = .white
        self.scrollView.refreshControl = refreshControl
    }
    
    @objc func refresh(refreshControl: UIRefreshControl) {
        self.refreshButton.isEnabled = false
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + .seconds(1)) {
            self.setUpViews()
            refreshControl.endRefreshing()
            self.refreshButton.isEnabled = true
        }
        
    }
    
    @IBAction func refreshButtonPressed(_ sender: UIBarButtonItem) {
        self.scrollView.refreshControl?.isEnabled = false
        //#warning("Обновляй одну модель и передавай её во вьюхи")
        setUpViews()
    }
    
    func setUpViews() {
        let model = Model()
        indexAHIView.configure(model: model)
        usageHoursView.selectTypeOfView(withType: .usageHours, model: model)
        eventsPerHoursView.selectTypeOfView(withType: .eventsPerHours, model: model)
        maskOnOffView.selectTypeOfView(withType: .maskOnOff, model: model)
        maskSealView.selectTypeOfView(withType: .maskSeal, model: model)
    }
}
