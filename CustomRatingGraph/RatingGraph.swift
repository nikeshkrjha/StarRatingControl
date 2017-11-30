//
//  RatingGraph.swift
//  CustomRatingGraph
//
//  Created by Nikesh Jha on 11/22/17.
//  Copyright © 2017 Javra Software. All rights reserved.
//

import UIKit

@IBDesignable
class RatingGraph: UIView {
    
    var colorArr: [UIColor] = [UIColor.green,UIColor.red, UIColor.blue, UIColor.yellow, UIColor.brown]
    let barSpacing: CGFloat = 5
    let padding:CGFloat = 10
    var barHeight:CGFloat = 0
    var imageWidth: CGFloat = 25
    var textWidth: CGFloat = 35
    
    let ratingScoreArr:[Int] = [100,200,300,400,500]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.layer.borderColor = UIColor.lightGray.cgColor
        self.layer.borderWidth = 1
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    override func draw(_ rect: CGRect) {
        self.layer.borderColor = UIColor.clear.cgColor
        self.layer.borderWidth = 1
//        drawAxes(rect: rect)
        drawBars(rect: rect)
    }
    
    
    //MARK:- Draw axis
    func drawAxes(rect: CGRect){
        let path = UIBezierPath(rect: rect)
        let x:CGFloat = padding
        let y:CGFloat = padding
        path.move(to: CGPoint(x: x, y: y))
        path.addLine(to: CGPoint(x:x, y:rect.height - 2 * y ))
        path.addLine(to: CGPoint(x:rect.width - 2 * x, y:rect.height - 2 * y ))
        
        UIColor.darkText.setStroke()
        path.stroke()
        
    }
    
    func drawBars(rect: CGRect){
        let x:CGFloat = padding + imageWidth
        var y:CGFloat = padding
        let maxWidth:CGFloat = (rect.width - 2 * x) - textWidth - imageWidth
        let drawableHeight: CGFloat = rect.height - 2 * y
        barHeight = (drawableHeight  - (4 * barSpacing)) / 5
        
        
        
        for i in 0..<5 {
            let widthValue = (maxWidth / CGFloat(ratingScoreArr.max()!)) * CGFloat(ratingScoreArr[i])
            let barRect = CGRect(x: x, y: y, width: widthValue, height: barHeight)
            
            drawText(text: String(ratingScoreArr[i]), x: x + widthValue + 2, y : y)
            
            let imageRect = CGRect(x:x - 25 - padding, y: y, width: 25, height: 25)
            print(imageRect)
            let imgView = UIImageView(image: UIImage(named: "deleteIcon"))
            imgView.contentMode = .scaleAspectFit
            self.addSubview(imgView)
//            imgView.draw(imageRect)
//            imgView.layoutSubviews()
            
            
            
            print("Bar Rect:  \(barRect)")
            let path = UIBezierPath(rect: barRect)
            colorArr[i].set()
            path.fill()
            y += barHeight + barSpacing
        }
    }
    
    
    func drawText(text: String, x: CGFloat, y: CGFloat){
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .left
        
        let attrs = [NSAttributedStringKey.font: UIFont(name: "HelveticaNeue", size: 14)!, NSAttributedStringKey.paragraphStyle: paragraphStyle, NSAttributedStringKey.foregroundColor : UIColor.darkGray]
        
        let string = "(\(text))"
        string.draw(with: CGRect(x: x, y: y * 1.05, width: 50, height: barHeight * 0.8), options: .usesLineFragmentOrigin, attributes: attrs, context: nil)
    }
}
