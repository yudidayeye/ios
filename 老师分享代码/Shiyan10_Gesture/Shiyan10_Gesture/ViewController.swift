//
//  ViewController.swift
//  Shiyan10_Gesture
//
//  Created by student on 2019/11/7.
//  Copyright © 2019年 lmq. All rights reserved.
//

import UIKit
import WebKit
extension UILabel{
    //设置移动手势
    @objc func pan(recognizer: UIPanGestureRecognizer) {
        switch recognizer.state {
        case .changed, .ended:
            let translation = recognizer.translation(in: self.superview)
            self.center.x += translation.x
            self.center.y += translation.y
            recognizer.setTranslation(CGPoint.zero, in: self.superview)
        default:
            return
        }
    }
    
    //点击numberofRequored次删除moveView视图
    @objc func tap(recognizer: UITapGestureRecognizer) {
        switch recognizer.state {
        case .recognized:
            self.removeFromSuperview()
        default:
            return
        }
    }
}


class ViewController: UIViewController {
    
    
    
    @IBOutlet weak var moveView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        moveView.layer.backgroundColor = UIColor.gray.cgColor
        moveView.layer.cornerRadius = 10
        moveView.layer.shadowColor = UIColor.black.cgColor
        moveView.layer.shadowOffset = CGSize(width: 5, height: 5)
        moveView.layer.shadowOpacity = 0.5
        
        //设置移动手势
        let panGesturer = UIPanGestureRecognizer(target: self, action: #selector(pan))
        moveView.addGestureRecognizer(panGesturer)
        //设置放大缩小手势
        let pinchGesturer = UIPinchGestureRecognizer(target: self, action: #selector(pinch))
        moveView.addGestureRecognizer(pinchGesturer)
        //设置转动手势
        let rotationGesturer = UIRotationGestureRecognizer(target: self, action: #selector(rotation))
        moveView.addGestureRecognizer(rotationGesturer)
        //设置点击手势（这里设置为点击2次就删除moveView这个视图）
        let tapGesturer = UITapGestureRecognizer(target: self, action: #selector(tap))
        tapGesturer.numberOfTapsRequired = 2
        moveView.addGestureRecognizer(tapGesturer)
    }
    
    //设置移动手势
    @objc func pan(recognizer: UIPanGestureRecognizer) {
        switch recognizer.state {
        case .changed, .ended:
            let translation = recognizer.translation(in: self.view)
            moveView.center.x += translation.x
            moveView.center.y += translation.y
            recognizer.setTranslation(CGPoint.zero, in: self.view)
        default:
            return
        }
    }
    
    //设置放大缩小手势
    @objc func pinch(recognizer: UIPinchGestureRecognizer) {
        switch recognizer.state {
        case .changed, . ended:
            let scale = recognizer.scale
            moveView.bounds.size = CGSize(width: moveView.bounds.width * scale, height: moveView.bounds.height * scale)
            recognizer.scale = 1
        default:
            return
        }
    }
    
    @objc func rotation(recognizer: UIRotationGestureRecognizer) {
        switch recognizer.state {
        case .changed, .ended:
            let rotation = recognizer.rotation
            moveView.transform = CGAffineTransform(rotationAngle: rotation)
        default:
            return
        }
    }
    
    //点击numberofRequored次删除moveView视图
    @objc func tap(recognizer: UITapGestureRecognizer) {
        switch recognizer.state {
        case .recognized:
            moveView.removeFromSuperview()
        default:
            return
        }
    }
    
    //设置简单动画效果，让add的UILabel动起来
    @IBAction func move(_ sender: Any) {
        for v in self.view.subviews {
            if v is UILabel {
                let rect = self.view.bounds
                let x = Int(arc4random()) % Int(rect.width)
                let y = Int(arc4random()) % Int(rect.height)
                
                UIView.animate(withDuration: 2) {
                    v.center  = CGPoint(x: x, y: y)
                }
            }
        }
    }
    
    //加入 UILabel
    @IBAction func add(_ sender: Any) {
     
        let rect = self.view.bounds
        let x = Int(arc4random()) % Int(rect.width)
        let y = Int(arc4random()) % Int(rect.height)
        
        let v = UILabel(frame: CGRect(x: x, y: y, width: 20, height: 20))
        v.backgroundColor = UIColor.green
        
        let mypanGesturer = UIPanGestureRecognizer(target: v, action: #selector(pan))
        v.addGestureRecognizer(mypanGesturer)
        
        let mytapGesturer = UITapGestureRecognizer(target: v, action: #selector(tap))
        mytapGesturer.numberOfTapsRequired = 2
        v.addGestureRecognizer(mytapGesturer)
        v.isUserInteractionEnabled = true
        
        self.view.addSubview(v)
        
    }
    
    
    @IBAction func clear(_ sender: Any) {
        for v in self.view.subviews {
            if v is UILabel{
                v.removeFromSuperview()
            }
        }
    }
    


}

