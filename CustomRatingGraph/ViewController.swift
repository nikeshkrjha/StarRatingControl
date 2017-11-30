//
//  ViewController.swift
//  CustomRatingGraph
//
//  Created by Nikesh Jha on 11/22/17.
//  Copyright © 2017 Javra Software. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var ratingView: RatingGraphView = RatingGraphView()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ratingView =  RatingGraphView(frame: CGRect(x: 20, y: 40, width: 300, height: 180))
        ratingView.ratingsDict = [.one : "1500",.two : "1450",.three : "1600",.four : "1300",.five : "1370"]
        ratingView.layer.borderColor = UIColor.lightGray.cgColor
        ratingView.layer.borderWidth = 1
        
        self.view.addSubview(ratingView)
        self.view.bringSubview(toFront: ratingView)
        
        ratingView.oneStarBar.backgroundColor = UIColor.green
        ratingView.twoStarBar.backgroundColor = UIColor.red
        ratingView.threeStarbar.backgroundColor = UIColor.brown
        ratingView.fourStarBare.backgroundColor = UIColor.blue
        ratingView.fiveStarBar.backgroundColor = UIColor.yellow
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        print("landscape")
        print(size)
        let screenWidth = size.width
        ratingView.frame.size.width = screenWidth * 0.70
        ratingView.frame.origin.x = screenWidth * 0.15
        ratingView.setNeedsDisplay()
        
    }
}

