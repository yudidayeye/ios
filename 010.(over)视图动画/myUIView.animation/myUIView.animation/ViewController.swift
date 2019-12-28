//
//  ViewController.swift
//  myUIView.animation
//
//  Created by lijin on 2019/11/14.
//  Copyright © 2019 lijin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    
    @IBOutlet weak var myView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    //改变color
    @IBAction func changeColor(_ sender: UIButton) {
        UIView.animate(withDuration: 3) {
            self.myView.backgroundColor = self.randomColor()
        }
    }
    
    //改变位置
    @IBAction func changePosition(_ sender: Any) {
        UIView.animate(withDuration: 2, delay: 0, options: [.curveEaseInOut], animations: {
                self.myView.center.x += 50
                self.myView.center.y += 50
            }, completion: nil)
    }
    
    //放大缩小scale
    @IBAction func scale(_ sender: UIButton) {
        UIView.animate(withDuration: 2) {
            self.myView.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
        }
    }
    
    //移动transition
    @IBAction func transition(_ sender: UIButton) {
        UIView.animate(withDuration: 2) {
            self.myView.transform = CGAffineTransform(translationX: -100, y: -100)
        }
    }
    
    //旋转rotation
    @IBAction func rotation(_ sender: UIButton) {
        UIView.animate(withDuration: 2) {
            self.myView.transform = CGAffineTransform(rotationAngle: 90)
        }
    }
    
    //随机颜色值
    func randomColor() -> UIColor {
        let red = CGFloat(arc4random()) / CGFloat(Int32.max)
        let green = CGFloat(arc4random()) / CGFloat(Int32.max)
        let blue = CGFloat(arc4random()) / CGFloat(Int32.max)
        return UIColor(red: red, green: green, blue: blue, alpha: 1)
    }

}

