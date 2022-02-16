//
//  IndexAHIView.swift
//  Pump
//
//  Created by Снытин Ростислав on 16.02.2022.
//

import UIKit

class IndexAHIView: UIView {
    
    @IBOutlet var contentView: UIView!
    
    @IBOutlet weak var indexAHILabel: UILabel!
    
    @IBOutlet weak var rightAHIProgress: UIView!
    @IBOutlet weak var indexAHIProgress: UIView!
    @IBOutlet weak var currentIndex: UIImageView!
    @IBOutlet weak var currentIndexConst: NSLayoutConstraint!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        Bundle.main.loadNibNamed("IndexAHIView", owner: self, options: nil)
        addSubview(contentView)
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = bounds
        contentView.updateConstraintsIfNeeded()
        
        self.indexAHIProgress.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
        self.indexAHIProgress.layer.cornerRadius = 3
        self.rightAHIProgress.layer.cornerRadius = 3
        self.rightAHIProgress.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMaxXMinYCorner]
    }
    
    func configure(model: Model) {
        indexAHILabel.text = model.indexAHI
        let randomInt = Double(model.indexAHI) ?? 0
        var constant: Double = 31
        var startX = 0.0
        var coef = 0.0
        switch randomInt {
        case 0..<5:
            coef = randomInt / 5
        case 5..<15:
            coef = (randomInt - 5) / (15 - 5)
            startX = indexAHIProgress.frame.width
        case 15..<30:
            coef = (randomInt - 15) / (30 - 15)
            startX = indexAHIProgress.frame.width * 2
        case 30...45:
            coef = (randomInt - 30) / (45 - 30)
            startX = indexAHIProgress.frame.width * 3
        default:
            break
        }
        constant = startX + indexAHIProgress.frame.width * coef - currentIndex.frame.width / 2.0
        currentIndexConst.constant = CGFloat(constant)
    }
}
