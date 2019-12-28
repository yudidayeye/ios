//
//  ClockView.swift
//  ClockViewDemo
//
//  Created by liguiyang on 2019/11/5.
//  Copyright © 2019 liguiyang. All rights reserved.
//

import UIKit

@IBDesignable
class ClockView: UIView {
    @IBInspectable var timeZone: String = "CST" {
        didSet {
            cal.timeZone = TimeZone(abbreviation: timeZone) ??  TimeZone.current
        
        }
    }
    @IBInspectable var dial: Int = 1
    var start: Bool = false {
        didSet {
            if start {
                timer.fireDate = Date.distantPast
            } else {
                timer.fireDate = Date.distantFuture
            }
        }
    }
    
    let imageName = "MBTClockStyle01"
    private var timer: Timer!
    private var cal = Calendar.current
    private var apImageView, secImageView, minImageView, hourImageView: UIImageView!
    
    private var currentTime:(sec: CGFloat, min: CGFloat, hour: CGFloat) {
        let date = Date()
        let sec = CGFloat(cal.component(.second, from: date))
        let min = CGFloat(cal.component(.minute, from: date))
        let hour = CGFloat(cal.component(.hour, from: date))
        return (sec,min,hour)
    }
    
    func setup() {
        
        initView()
        
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { (timer) in
            let (sec,min,hour) = self.currentTime
            if hour >= 12 {
                self.apImageView.image = UIImage(named: "Images/\(self.imageName)_Pm")
            } else {
                self.apImageView.image = UIImage(named: "Images/\(self.imageName)_Am")
            }
            
            self.secImageView.transform = CGAffineTransform(rotationAngle: sec * CGFloat.pi / 30)
            self.minImageView.transform = CGAffineTransform(rotationAngle: min * CGFloat.pi / 30 + sec * CGFloat.pi / 1800)
            self.hourImageView.transform = CGAffineTransform(rotationAngle: hour * CGFloat.pi / 6 + (min * CGFloat.pi / 30 + sec * CGFloat.pi / 1800) / 12)
        })
    }
    
    func initView() {
        self.backgroundColor = UIColor.clear
        let bkImageView = UIImageView()
        bkImageView.contentMode = .scaleAspectFit
        bkImageView.frame = self.bounds
        bkImageView.image = UIImage(named: "Images/MBTClockStyle0\(dial)_BK")
        self.addSubview(bkImageView)
        
        
        apImageView = UIImageView()
        apImageView.contentMode = .scaleAspectFit
        apImageView.image = UIImage(named: "Images/\(imageName)_Am")
        apImageView.frame =  CGRect(x: bounds.width * 9 / 20, y: bounds.height * 5 / 8, width: bounds.width / 10, height: bounds.height / 14)
        self.addSubview(apImageView)

        secImageView = UIImageView()
        secImageView.contentMode = .scaleAspectFit
        secImageView.image = UIImage(named: "Images/\(imageName)_Sec")
        secImageView.frame = self.bounds
        self.addSubview(secImageView)

        minImageView = UIImageView()
        minImageView.contentMode = .scaleAspectFit
        minImageView.image = UIImage(named: "Images/\(imageName)_Min")
        minImageView.frame = self.bounds
        self.addSubview(minImageView)

        hourImageView = UIImageView()
        hourImageView.contentMode = .scaleAspectFit
        hourImageView.image = UIImage(named: "Images/\(imageName)_Hour")
        hourImageView.frame = self.bounds
        self.addSubview(hourImageView)
  
        let maskImageView = UIImageView()
        maskImageView.contentMode = .scaleAspectFit
        maskImageView.frame = self.bounds
        maskImageView.image = UIImage(named: "Images/\(imageName)_BKMask")
        self.addSubview(maskImageView)
}
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func awakeFromNib() {
        setup()
    }
    
    
}
