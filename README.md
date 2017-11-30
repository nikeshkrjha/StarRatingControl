# StarRatingControl

### Usage:


![alt text](https://github.com/nikeshkrjha/StarRatingControl/commit/1d5dcc1f37964dfd38abd92552dfb185d8fbe0b6#diff-1410620144ff355f3a9ddb41b512d913)

    override func viewDidLoad() {
        super.viewDidLoad()
        let ratingView =  RatingGraphView(frame: CGRect(x: 20, y: 40, width: 300, height: 180))
        ratingView.ratingsDict = [.one : "10000",.two : "5000",.three : "4000",.four : "7000",.five : "15000"]
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

    
    
