//
//  RatingGraphView.swift
//  CustomRatingGraph
//
//  Created by Nikesh Jha on 11/23/17.
//  Copyright © 2017 Javra Software. All rights reserved.
//

import UIKit


enum RatingLevel: Int {
    case one = 1
    case two = 2
    case three = 3
    case four = 4
    case five = 5
}

class RatingGraphView: UIView {

    
    @IBOutlet weak var topLevelView: UIView!
    @IBOutlet weak var oneStarVal: UILabel!
    @IBOutlet weak var twoStarVal: UILabel!
    @IBOutlet weak var fiveStarVal: UILabel!
    @IBOutlet weak var fourStarVal: UILabel!
    @IBOutlet weak var threeStarVal: UILabel!
    @IBOutlet weak var fiveStarBar: UILabel!
    @IBOutlet weak var fourStarBare: UILabel!
    @IBOutlet weak var threeStarbar: UILabel!
    @IBOutlet weak var twoStarBar: UILabel!
    @IBOutlet weak var oneStarBar: UILabel!
    
    @IBOutlet weak var fourStarWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var twoStarWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var fiveStarWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var threeStarWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var oneStarWidthConstraint: NSLayoutConstraint!
    var maxWidth:CGFloat = 0
    
    var ratingsDict: [RatingLevel : String] = [.one : "400",.two : "500",.three : "700",.four : "600",.five : "1000"]{
        didSet {
            self.setNeedsDisplay()
        }
    }
    
    var barColorsArray: [UIColor] = [UIColor.gray,UIColor.green,UIColor.blue,UIColor.yellow,UIColor.red] {
        didSet {
            self.setNeedsDisplay()
        }
    }
    var ratingBars: [UILabel] = []
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setBarWidth()
    }
    
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.frame = frame
        
        
        let view = Bundle.main.loadNibNamed("RatingView", owner: self, options: nil)?[0] as! UIView
        view.frame = self.bounds
        self.addSubview(view)
        ratingBars = [oneStarBar,twoStarBar,threeStarbar,fourStarBare,fiveStarBar]
        setBarBackground()
    }
    
    
    
    
    func setBarBackground(){
        for i in 0..<barColorsArray.count {
            ratingBars[i].backgroundColor = barColorsArray[i]
        }
    }
    
    //MARK:- Set width of different bars
    func setBarWidth(){
        maxWidth = self.frame.width * 0.6
        let valuesArr = ratingsDict.values.map {
            return Int($0)!
        }
        let maxValue = valuesArr.max()!
        
        let keysArr = ratingsDict.keys.sorted(by: {$0.rawValue < $1.rawValue})
        
        for item in keysArr {
            let value = CGFloat(Int(ratingsDict[item]!)!)
            switch item {
            case .one:
                oneStarWidthConstraint.constant = (value / CGFloat(maxValue)) * maxWidth
                oneStarVal.text = "(\(value))"
//                print(oneStarWidthConstraint.constant)
            case .two:
                twoStarWidthConstraint.constant = (value / CGFloat(maxValue)) * maxWidth
                twoStarVal.text = "(\(value))"
//                print(twoStarWidthConstraint.constant)
            case .three:
                threeStarWidthConstraint.constant = (value / CGFloat(maxValue)) * maxWidth
                threeStarVal.text = "(\(value))"
//                print(threeStarWidthConstraint.constant)
            case .four:
                fourStarWidthConstraint.constant = (value / CGFloat(maxValue)) * maxWidth
                fourStarVal.text = "(\(value))"
//                print(fourStarWidthConstraint.constant)
            case .five:
                fiveStarWidthConstraint.constant = (value / CGFloat(maxValue)) * maxWidth
                fiveStarVal.text = "(\(value))"
//                print(fiveStarWidthConstraint.constant)
            default:
                print()
            }
        }
    }
}
