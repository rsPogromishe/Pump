//
//  MainViewController.swift
//  Pump
//
//  Created by Снытин Ростислав on 30.12.2021.
//

import UIKit

//#warning("Та же пробелма UIScrollView , как в дашбоарде")
//#warning("Не забывай приписывать что значит класс, например Dashboard говорит о том, что это Дашбоард, ViewController, говорит что это экран - Экран дашбоарда")
class DashboardViewController: BaseViewController {
    //#warning("(НЕ ИСПРАВЛЕНО)Размер мелких графиков теряет пропорциональность по сравнению с тем, что выставлено в дизайне, из-за чего они с более узким экраном становились бы всё вытянутее по вертикали, не ок")
    //#warning("Вьюхи в UIStackView без размеров")
    
    //#warning("(НЕ ИСПРАВИЛ) Инициализируешь здесь модель, а потом используешь её методы, которые возвращают совершенно другие значения. Можно же переиницилиазировать модель и вставлять значения")
    
    @IBOutlet weak var indexAHIView: IndexAHIView!
    
    @IBOutlet weak var usageHoursView: ValueBlockView!
    @IBOutlet weak var eventsPerHoursView: ValueBlockView!
    @IBOutlet weak var maskOnOffView: ValueBlockView!
    @IBOutlet weak var maskSealView: ValueBlockView!
    
    //#warning("Сделай большой график тоже отдельным кастомным вью")
   
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var refreshButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //#warning("Если бы табов стало 5, то пришлось бы прописывать код с таббаром в каждом контроллере, когда можно создать свой, наследуясь от UITabbarController и прописать все настройки в его методе viewDidLoad. TODO: Имелось в виду сделать child класс UIViewController, в котором бы происходила вся настройка")
        self.navigationItem.title = DateFormat.dateToday(formatter: "EEEE, MMMM dd")
        self.navigationController?.navigationItem.titleView?.tintColor = .white
        
        setUpResfreshControl()
        
        usageHoursView.selectTypeOfView(withType: .usageHours, model: Model())
        eventsPerHoursView.selectTypeOfView(withType: .eventsPerHours, model: Model())
        maskOnOffView.selectTypeOfView(withType: .maskOnOff, model: Model())
        maskSealView.selectTypeOfView(withType: .maskSeal, model: Model())
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        indexAHIView.configure(model: Model())
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
        //#warning("На самом деле action методы кнопок вызываются и так в Main очереди, сейчас это не сильно замедлит работу, но в дальнейшем могут появиться последствия")
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + .seconds(1)) {
            self.indexAHIView.configure(model: Model())
            self.usageHoursView.selectTypeOfView(withType: .usageHours, model: Model())
            self.eventsPerHoursView.selectTypeOfView(withType: .eventsPerHours, model: Model())
            self.maskOnOffView.selectTypeOfView(withType: .maskOnOff, model: Model())
            self.maskSealView.selectTypeOfView(withType: .maskSeal, model: Model())
            refreshControl.endRefreshing()
            self.refreshButton.isEnabled = true
        }
        
    }
    
    @IBAction func refreshButtonPressed(_ sender: UIBarButtonItem) {
        //#warning("На самом деле action методы кнопок вызываются и так в Main очереди, сейчас это не сильно замедлит работу, но в дальнейшем могут появиться последствия")
        self.scrollView.refreshControl?.isEnabled = false
        self.indexAHIView.configure(model: Model())
        self.usageHoursView.selectTypeOfView(withType: .usageHours, model: Model())
        self.eventsPerHoursView.selectTypeOfView(withType: .eventsPerHours, model: Model())
        self.maskOnOffView.selectTypeOfView(withType: .maskOnOff, model: Model())
        self.maskSealView.selectTypeOfView(withType: .maskSeal, model: Model())
    }
    
}
