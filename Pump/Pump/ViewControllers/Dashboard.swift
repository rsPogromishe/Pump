//
//  MainViewController.swift
//  Pump
//
//  Created by Снытин Ростислав on 30.12.2021.
//

import UIKit

//#warning("Почему называется MainViewController, когда это Dashboard? Приучивай себя правильно называть класса сразу")
class Dashboard: UIViewController {
    //#warning("Размер мелких графиков теряет пропорциональность по сравнению с тем, что выставлено в дизайне, из-за чего они с более узким экраном становились бы всё вытянутее по вертикали, не ок")
    //#warning("Скруглений у большого графика нет")

    lazy var dayToday = Date()
    //#warning("Инициализируешь здесь модель, а потом используешь её методы, которые возвращают совершенно другие значения. Можно же переиницилиазировать модель и вставлять значения")
    var model = Model()
    
    //#warning("Вот о чём я и говорил в Профиле, появилась куча аутлетов в контроллере, хотя 4 вью с прогресс баром очень похожи друг на друга, можно было бы создать один класс UIView для них и сократить кол-во кода минимум вдвое")
    
    @IBOutlet weak var indexAHILabel: UILabel!
    
    @IBOutlet weak var usageHoursView: ValueBlockView!
    @IBOutlet weak var eventsPerHoursView: ValueBlockView!
    @IBOutlet weak var maskOnOffView: ValueBlockView!
    @IBOutlet weak var maskSealView: ValueBlockView!
    
    //#warning("Та же тема с переиспользование, каждый UIProgressView в сторибоарде нужно было настраивать, хотя и есть Ctrl+C/Ctrl+V, но ты мог создать один UIView, где один раз настроил и больше трогать не надо")
    
    @IBOutlet weak var currentIndex: UIImageView!
    @IBOutlet weak var currentIndexConst: NSLayoutConstraint!
    @IBOutlet weak var indexAHIprogress: UIView!
    @IBOutlet weak var rightAHIProgress: UIView!
    
    //#warning("Нижний отступ в 148 не совсем понял для чего нужен")
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var refreshButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //#warning("Если бы табов стало 5, то пришлось бы прописывать код с таббаром в каждом контроллере, когда можно создать свой, наследуясь от UITabbarController и прописать все настройки в его методе viewDidLoad")
        self.navigationItem.title = DateFormat.dateToday(day: dayToday, formatter: "EEEE, MMMM dd")
        self.navigationController?.navigationItem.titleView?.tintColor = .white
        //#warning("lazy здесь не нужен, тк переменная в доли секунды начинает использоваться")
        //#warning("UIRefreshControl лучше настраивать в отдельном методе и здесь этот метод использовать, лучше работать не станет, но читабельность улучшится")
        setUpTabBar()
        setUpResfreshControl()
        setUpCorners()
        
        usageHoursView.selectTypeOfView(withType: .usageHours)
        eventsPerHoursView.selectTypeOfView(withType: .eventsPerHours)
        maskOnOffView.selectTypeOfView(withType: .maskOnOff)
        maskSealView.selectTypeOfView(withType: .maskSeal)
    }
    
    func setUpCorners() {
        self.indexAHIprogress.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
        self.indexAHIprogress.layer.cornerRadius = 3
        self.rightAHIProgress.layer.cornerRadius = 3
        self.rightAHIProgress.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMaxXMinYCorner]
    }
    
    func setUpTabBar() {
        self.tabBarController?.tabBar.unselectedItemTintColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.5)
        self.tabBarController?.tabBar.backgroundColor = .black
        self.tabBarController?.tabBar.tintColor = .white
    }
    
    func setUpResfreshControl() {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(refresh), for: .valueChanged)
        //#warning("Определяешь переменную со строкой, потом её передаёшь в новую переменную, для чего?")
        let refreshString = "Refreshing..."
        let mutableAttributedString = NSMutableAttributedString.init(string: refreshString)
        let range = (refreshString as NSString).range(of: refreshString)
        mutableAttributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.white, range: range)
        refreshControl.attributedTitle = mutableAttributedString
        refreshControl.tintColor = .white
        self.scrollView.refreshControl = refreshControl
    }
    
    func indexAHI() {
        let random = model.randomIndexAHI()
        indexAHILabel.text = random
        let randomInt = Double(random) ?? 0
        var constant: Double = 43
        var startX = 0.0
        var coef = 0.0
        switch randomInt {
        case 0..<5:
            coef = randomInt / 5
        case 5..<15:
            coef = (randomInt - 5) / (15 - 5)
            startX = indexAHIprogress.frame.width
        case 15..<30:
            coef = (randomInt - 15) / (30 - 15)
            startX = indexAHIprogress.frame.width * 2
        case 30...45:
            coef = (randomInt - 30) / (45 - 30)
            startX = indexAHIprogress.frame.width * 3
        default:
            break
        }
        constant = startX + indexAHIprogress.frame.width * coef - currentIndex.frame.width / 2.0
        currentIndexConst.constant = CGFloat(constant)
    }
    
    @objc func refresh(refreshControl: UIRefreshControl) {
        self.refreshButton.isEnabled = false
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + .seconds(1)) {
            self.indexAHI()
            self.usageHoursView.selectTypeOfView(withType: .usageHours)
            self.eventsPerHoursView.selectTypeOfView(withType: .eventsPerHours)
            self.maskOnOffView.selectTypeOfView(withType: .maskOnOff)
            self.maskSealView.selectTypeOfView(withType: .maskSeal)
            refreshControl.endRefreshing()
            self.refreshButton.isEnabled = true
        }
        //#warning("endRefreshing тоже UI метод, так почему он вне Main очереди")
        
    }
    
    @IBAction func refreshButtonPressed(_ sender: UIBarButtonItem) {
        //#warning("При вызове одного из двух одинаковых методов нужно выключать другой, иначе если запрос будет выполняться слишком долго, то есть вероятность, что пользователь нажмёт на другую кнопку и запрос будет уже выполняться дважды")
        self.scrollView.refreshControl?.isEnabled = false
        DispatchQueue.main.async {
            self.indexAHI()
            self.usageHoursView.selectTypeOfView(withType: .usageHours)
            self.eventsPerHoursView.selectTypeOfView(withType: .eventsPerHours)
            self.maskOnOffView.selectTypeOfView(withType: .maskOnOff)
            self.maskSealView.selectTypeOfView(withType: .maskSeal)
            self.scrollView.refreshControl?.isEnabled = true
        }
    }
    
}
