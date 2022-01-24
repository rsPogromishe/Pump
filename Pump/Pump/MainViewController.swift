//
//  MainViewController.swift
//  Pump
//
//  Created by Снытин Ростислав on 30.12.2021.
//

import UIKit

#warning("Почему называется MainViewController, когда это Dashboard? Приучивай себя правильно называть класса сразу")
class MainViewController: UIViewController {
    #warning("Размер мелких графиков теряет пропорциональность по сравнению с тем, что выставлено в дизайне, из-за чего они с более узким экраном становились бы всё вытянутее по вертикали, не ок")
    #warning("Скруглений у большого графика нет")

    lazy var dayToday = Date()
    #warning("Инициализируешь здесь модель, а потом используешь её методы, которые возвращают совершенно другие значения. Можно же переиницилиазировать модель и вставлять значения")
    var model = Model(indexAHI: 0, usageHours: 0, eventsPerHour: 0, maskOnOff: 0, maskSeal: "")
    
    #warning("Вот о чём я и говорил в Профиле, появилась куча аутлетов в контроллере, хотя 4 вью с прогресс баром очень похожи друг на друга, можно было бы создать один класс UIView для них и сократить кол-во кода минимум вдвое")
    
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var indexAHILabel: UILabel!
    
    @IBOutlet weak var usageHoursLabel: UILabel!
    #warning("Та же тема с переиспользование, каждый UIProgressView в сторибоарде нужно было настраивать, хотя и есть Ctrl+C/Ctrl+V, но ты мог создать один UIView, где один раз настроил и больше трогать не надо")
    @IBOutlet weak var progressUsageHours: UIProgressView!
    @IBOutlet weak var statusUsageHoursLabel: UILabel!
    
    @IBOutlet weak var usagePerHoursLabel: UILabel!
    @IBOutlet weak var progressUsagePerHours: UIProgressView!
    @IBOutlet weak var statusUsagePerHoursLabel: UILabel!
    
    @IBOutlet weak var maskOnOffLabel: UILabel!
    @IBOutlet weak var progressMaskOnOff: UIProgressView!
    @IBOutlet weak var statusMaskOnOffLabel: UILabel!
    
    @IBOutlet weak var maskSealLabel: UILabel!
    @IBOutlet weak var progressMaskSeal: UIProgressView!
    @IBOutlet weak var statusMaskSealLabel: UILabel!
    
    @IBOutlet weak var currentIndex: UIImageView!
    @IBOutlet weak var currentIndexConst: NSLayoutConstraint!
    @IBOutlet weak var indexAHIprogress: UIView!
    
    #warning("Нижний отступ в 148 не совсем понял для чего нужен")
    @IBOutlet weak var scrollView: UIScrollView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        #warning("Если бы табов стало 5, то пришлось бы прописывать код с таббаром в каждом контроллере, когда можно создать свой, наследуясь от UITabbarController и прописать все настройки в его методе viewDidLoad")
        self.tabBarController?.tabBar.unselectedItemTintColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.5)
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "BG")!)
        self.tabBarController?.tabBar.backgroundColor = .black
        self.tabBarController?.tabBar.tintColor = .white
        self.navigationItem.title = DateFormat.dateToday(day: dayToday)
        self.navigationController?.navigationItem.titleView?.tintColor = .white
        #warning("lazy здесь не нужен, тк переменная в доли секунды начинает использоваться")
        #warning("UIRefreshControl лучше настраивать в отдельном методе и здесь этот метод использовать, лучше работать не станет, но читабельность улучшится")
        lazy var refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(refresh), for: .valueChanged)
        #warning("Определяешь переменную со строкой, потом её передаёшь в новую переменную, для чего?")
        let refreshString = "Refreshing..."
        let stringToColor = refreshString
        let mutableAttributedString = NSMutableAttributedString.init(string: refreshString)
        let range = (refreshString as NSString).range(of: stringToColor)
        mutableAttributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.white, range: range)
        refreshControl.attributedTitle = mutableAttributedString
        refreshControl.tintColor = .white
        self.scrollView.refreshControl = refreshControl
        indexAHI()
        usageHours()
        usagePerHours()
        maskOnOff()
        maskSeal()
    }
    func indexAHI() {
        let random = model.randomIndexAHI()
        indexAHILabel.text = random
        let randomInt = Double(random)!
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
    func usageHours() {
        let random = model.randomUsageHours()
        let randomMinutes = model.randomUsageMinutes()
        usageHoursLabel.text = "\(random):\(randomMinutes)"
        #warning("Не забывай про проверки на то, что объект наверняка создастся, малоли что с сервера будет приходить")
        progressUsageHours.progress = Float(random)! / 10
        statusUsageHoursLabel.text = "\(random)/10"
    }
    func usagePerHours() {
        let random = model.randomEventsPerHours()
        usagePerHoursLabel.text = random
        progressUsagePerHours.progress = Float(random)! / 5
        if let randomNumber = NumberFormatter().number(from: random) {
            let randomInt = randomNumber.intValue
            statusUsagePerHoursLabel.text = "\(randomInt)/5"
        }
    }
    func maskOnOff() {
        let random = model.randomMaskOnOff()
        maskOnOffLabel.text = random
        progressMaskOnOff.progress = Float(random)! / 5
        statusMaskOnOffLabel.text = "\(random)/5"
    }
    func maskSeal() {
        let random = model.randomMaskSeal()
        maskSealLabel.text = random
        if let randomNumber = NumberFormatter().number(from: random) {
            let randomInt = randomNumber.intValue
            switch randomInt {
            case 0...5:
                statusMaskSealLabel.text = "\(randomInt)/20"
            case 6...10:
                statusMaskSealLabel.text = "\(randomInt)/20"
            case 11...15:
                statusMaskSealLabel.text = "\(randomInt)/20"
            case 16...20:
                statusMaskSealLabel.text = "\(randomInt)/20"
            default:
                break
            }
            progressMaskSeal.progress = Float(randomInt) / 20
        }
    }
    @objc func refresh(refreshControl: UIRefreshControl) {
        DispatchQueue.main.async {
            self.indexAHI()
            self.usageHours()
            self.usagePerHours()
            self.maskOnOff()
            self.maskSeal()
        }
        #warning("endRefreshing тоже UI метод, так почему он вне Main очереди")
        refreshControl.endRefreshing()
    }
    @IBAction func refreshButtonPressed(_ sender: UIBarButtonItem) {
        #warning("При вызове одного из двух одинаковых методов нужно выключать другой, иначе если запрос будет выполняться слишком долго, то есть вероятность, что пользователь нажмёт на другую кнопку и запрос будет уже выполняться дважды")
        DispatchQueue.main.async {
            self.indexAHI()
            self.usageHours()
            self.usagePerHours()
            self.maskOnOff()
            self.maskSeal()
        }
    }
    
}
