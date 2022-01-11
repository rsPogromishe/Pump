//
//  MainViewController.swift
//  Pump
//
//  Created by Снытин Ростислав on 30.12.2021.
//

import UIKit

class MainViewController: UIViewController {

    lazy var dayToday = Date()
    var model = Model(indexAHI: 0, usageHours: 0, eventsPerHour: 0, maskOnOff: 0, maskSeal: "")
    
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var indexAHILabel: UILabel!
    
    @IBOutlet weak var usageHoursLabel: UILabel!
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
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarController?.tabBar.unselectedItemTintColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.5)
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "BG")!)
        self.tabBarController?.tabBar.backgroundColor = .black
        self.tabBarController?.tabBar.tintColor = .white
        self.navigationItem.title = DateFormat.dateToday(day: dayToday)
        self.navigationController?.navigationItem.titleView?.tintColor = .white
        lazy var refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(refresh), for: .valueChanged)
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
        refreshControl.endRefreshing()
    }
    @IBAction func refreshButtonPressed(_ sender: UIBarButtonItem) {
        DispatchQueue.main.async {
            self.indexAHI()
            self.usageHours()
            self.usagePerHours()
            self.maskOnOff()
            self.maskSeal()
        }
    }
    
}
