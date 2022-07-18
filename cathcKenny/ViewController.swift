//
//  ViewController.swift
//  cathcKenny
//
//  Created by Doğukan Doğan on 13.06.2022.
//

import UIKit

class ViewController: UIViewController {

    var timer = Timer()
    var timeLabel = UILabel()
    var count = 30
    var scoreLabel = UILabel()
    var score = 0
    var highScore = 0
    var highscoreLabel = UILabel()
    var kennyArray = [UIImageView()]
    var kennyTimer = Timer()
    var kennyImage1 = UIImageView()
    var kennyImage2 = UIImageView()
    var kennyImage3 = UIImageView()
    var kennyImage4 = UIImageView()
    var kennyImage5 = UIImageView()
    var kennyImage6 = UIImageView()
    var kennyImage7 = UIImageView()
    var kennyImage8 = UIImageView()
    var kennyImage9 = UIImageView()
    var width = 0.0
    var height = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.black
        
        width = view.frame.size.width
        height = view.frame.size.height
        
        let storegHighScore = UserDefaults.standard.object(forKey: "highscore")
        if storegHighScore == nil {
            highScore = 0
            highscoreLabel.text = "High Score: \(highScore)"
        }
        if let newScore = storegHighScore as? Int {
            highScore = newScore
            highscoreLabel.text = "High Score: \(highScore)"
        }
        
        kennyArray = [kennyImage1, kennyImage2, kennyImage3, kennyImage4, kennyImage5, kennyImage6, kennyImage7, kennyImage8, kennyImage9]
        
        timeLabel.text = "Time: \(count)"
        timeLabel.textColor = UIColor.white
        timeLabel.textAlignment = .center
        timeLabel.font = UIFont.systemFont(ofSize: width * 0.1)
        timeLabel.frame = CGRect(x: width * 0.5 - width * 0.4 / 2, y: height * 0.15 - height * 0.08 / 2, width: width * 0.4, height: height * 0.08)
        view.addSubview(timeLabel)
        
        kennyTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(kennyHidden), userInfo: nil, repeats: true)
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(censusTimer), userInfo: nil, repeats: true)
        
        scoreLabel.text = "Score: \(score)"
        scoreLabel.textColor = UIColor.white
        scoreLabel.textAlignment = .center
        scoreLabel.font = UIFont.systemFont(ofSize: width * 0.05)
        scoreLabel.frame = CGRect(x: width * 0.5 - width * 0.4 / 2, y: height * 0.235 - height * 0.08 / 2, width: width * 0.4, height: height * 0.08)
        view.addSubview(scoreLabel)
        
        kennyImage1.image = UIImage(named: "kenny")
        kennyImage1.frame = CGRect(x: width * 0.17 - width * 0.3 / 2, y: height * 0.4 - height * 0.15 / 2, width: width * 0.3, height: height * 0.15)
        view.addSubview(kennyImage1)
        
        kennyImage1.isUserInteractionEnabled = true
        let gestureRecognize = UITapGestureRecognizer(target: self, action: #selector(kennyTapped))
        kennyImage1.addGestureRecognizer(gestureRecognize)
        
        kennyImage2.image = UIImage(named: "kenny")
        kennyImage2.frame = CGRect(x: width * 0.5 - width * 0.3 / 2, y: height * 0.4 - height * 0.15 / 2, width: width * 0.3, height: height * 0.15)
        view.addSubview(kennyImage2)
        
        kennyImage2.isUserInteractionEnabled = true
        let gestureRecognize2 = UITapGestureRecognizer(target: self, action: #selector(kennyTapped))
        kennyImage2.addGestureRecognizer(gestureRecognize2)
        
        kennyImage3.image = UIImage(named: "kenny")
        kennyImage3.frame = CGRect(x: width * 0.83 - width * 0.3 / 2, y: height * 0.4 - height * 0.15 / 2, width: width * 0.3, height: height * 0.15)
        view.addSubview(kennyImage3)
        
        kennyImage3.isUserInteractionEnabled = true
        let gestureRecognize3 = UITapGestureRecognizer(target: self, action: #selector(kennyTapped))
        kennyImage3.addGestureRecognizer(gestureRecognize3)
        
        kennyImage4.image = UIImage(named: "kenny")
        kennyImage4.frame = CGRect(x: width * 0.17 - width * 0.3 / 2, y: height * 0.56 - height * 0.15 / 2, width: width * 0.3, height: height * 0.15)
        view.addSubview(kennyImage4)
        
        kennyImage4.isUserInteractionEnabled = true
        let gestureRecognize4 = UITapGestureRecognizer(target: self, action: #selector(kennyTapped))
        kennyImage4.addGestureRecognizer(gestureRecognize4)
        
        kennyImage5.image = UIImage(named: "kenny")
        kennyImage5.frame = CGRect(x: width * 0.5 - width * 0.3 / 2, y: height * 0.56 - height * 0.15 / 2, width: width * 0.3, height: height * 0.15)
        view.addSubview(kennyImage5)
        
        kennyImage5.isUserInteractionEnabled = true
        let gestureRecognize5 = UITapGestureRecognizer(target: self, action: #selector(kennyTapped))
        kennyImage5.addGestureRecognizer(gestureRecognize5)
        
        kennyImage6.image = UIImage(named: "kenny")
        kennyImage6.frame = CGRect(x: width * 0.83 - width * 0.3 / 2, y: height * 0.56 - height * 0.15 / 2, width: width * 0.3, height: height * 0.15)
        view.addSubview(kennyImage6)
        
        kennyImage6.isUserInteractionEnabled = true
        let gestureRecognize6 = UITapGestureRecognizer(target: self, action: #selector(kennyTapped))
        kennyImage6.addGestureRecognizer(gestureRecognize6)
        
        kennyImage7.image = UIImage(named: "kenny")
        kennyImage7.frame = CGRect(x: width * 0.17 - width * 0.3 / 2, y: height * 0.722 - height * 0.15 / 2, width: width * 0.3, height: height * 0.15)
        view.addSubview(kennyImage7)
        
        kennyImage7.isUserInteractionEnabled = true
        let gestureRecognize7 = UITapGestureRecognizer(target: self, action: #selector(kennyTapped))
        kennyImage7.addGestureRecognizer(gestureRecognize7)
        
        kennyImage8.image = UIImage(named: "kenny")
        kennyImage8.frame = CGRect(x: width * 0.5 - width * 0.3 / 2, y: height * 0.72 - height * 0.15 / 2, width: width * 0.3, height: height * 0.15)
        view.addSubview(kennyImage8)
        
        kennyImage8.isUserInteractionEnabled = true
        let gestureRecognize8 = UITapGestureRecognizer(target: self, action: #selector(kennyTapped))
        kennyImage8.addGestureRecognizer(gestureRecognize8)
        
        kennyImage9.image = UIImage(named: "kenny")
        kennyImage9.frame = CGRect(x: width * 0.83 - width * 0.3 / 2, y: height * 0.72 - height * 0.15 / 2, width: width * 0.3, height: height * 0.15)
        view.addSubview(kennyImage9)
        
        kennyImage9.isUserInteractionEnabled = true
        let gestureRecognize9 = UITapGestureRecognizer(target: self, action: #selector(kennyTapped))
        kennyImage9.addGestureRecognizer(gestureRecognize9)
        
        highscoreLabel.text = "High Score: \(highScore)"
        highscoreLabel.textColor = UIColor.white
        highscoreLabel.textAlignment = .center
        highscoreLabel.font = UIFont.systemFont(ofSize: width * 0.1)
        highscoreLabel.frame = CGRect(x: width * 0.5 - width * 0.6 / 2, y: height * 0.88 - height * 0.08 / 2, width: width * 0.6, height: height * 0.08)
        view.addSubview(highscoreLabel)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        kennyHidden()
    }
    
    @objc func kennyHidden(){
        for kenny in kennyArray {
            kenny.isHidden = true
        }
        
        let random = Int(arc4random_uniform(UInt32(kennyArray.count - 1)))
            kennyArray[random].isHidden = false
    }
    
    @objc func kennyTapped(){
        score += 1
        scoreLabel.text = "Score: \(score)"
    }
    
    @objc func censusTimer(){
        timeLabel.text = "Time: \(count)"
        count -= 1
        
        if count < 0 {
            for kenny in kennyArray {
                kenny.isHidden = true
            }
            
            if self.score > self.highScore {
                highscoreLabel.text = ("High Score: \(self.score)")
                UserDefaults.standard.set(self.score, forKey: "highscore")
            }
            timer.invalidate()
            kennyTimer.invalidate()
            let alert = UIAlertController(title: "Time's Up", message: "Try Again", preferredStyle: UIAlertController.Style.alert)
            let okButton = UIAlertAction(title: "Ok", style: UIAlertAction.Style.cancel, handler: nil)
            let replayButton = UIAlertAction(title: "Replay", style: UIAlertAction.Style.default) { UIAlertAction in
                
                self.score = 0
                self.scoreLabel.text = "Score: \(self.score)"
                self.count = 30
                self.timeLabel.text = "Time: \(self.count)"
                
                self.kennyTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(self.kennyHidden), userInfo: nil, repeats: true)
                
                self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.censusTimer), userInfo: nil, repeats: true)
            }
            alert.addAction(okButton)
            alert.addAction(replayButton)
            self.present(alert, animated: true, completion: nil)
        }
    }

}

