//
//  ViewController.swift
//  myGesture
//
//  Created by lijin on 2019/11/13.
//  Copyright © 2019 lijin. All rights reserved.
//

import UIKit
import WebKit

extension UILabel{
    //拖动手势
    @objc func pan(recognizer:UIPanGestureRecognizer){
        switch recognizer.state {
        case .changed, .ended:
            let translation = recognizer.translation(in: self.superview)    //参数为移动组件的父视图
            self.center.x += translation.x
            self.center.y += translation.y
            recognizer.setTranslation(CGPoint.zero, in: self.superview)
        default:
            return
        }
    }
    //双击手势
    @objc func tapTwo(recognizer:UITapGestureRecognizer){
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
        
        //MARK:设置圆角
        moveView.layer.cornerRadius = 20
        //MARK:设置阴影
        moveView.layer.shadowColor = UIColor.black.cgColor
        moveView.layer.shadowOffset = CGSize(width: 5, height: 5)
        moveView.layer.shadowOpacity = 0.5
        
        
        
        //MARK：手势设置
        //拖动识别器设置
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(pan))
        moveView.addGestureRecognizer(panGesture)
        
        //放大，缩小识别器设置
        let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(pinch))
        moveView.addGestureRecognizer(pinchGesture)
        
        //旋转识别器
        let rotationGesture = UIRotationGestureRecognizer(target: self, action: #selector(rotation))
        moveView.addGestureRecognizer(rotationGesture)
        
        //点击识别器
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapTwo))
        tapGesture.numberOfTapsRequired = 2
        moveView.addGestureRecognizer(tapGesture)
    }
    //拖动方法实现
    @objc func pan(recognizer: UIPanGestureRecognizer){
        switch recognizer.state{
        case .changed, .ended:
            let moveDisPoint = recognizer.translation(in: self.view)    //返回想x，y移动的距离，CGPoint类型
            moveView.center.x += moveDisPoint.x
            moveView.center.y += moveDisPoint.y
            recognizer.setTranslation(CGPoint.zero, in: self.view)  //重置translation（速度重置）
        default:
            return
        }
    }
    //放大,缩小方法实现
    @objc func pinch(recognizer: UIPinchGestureRecognizer){
        switch recognizer.state {
        case .changed, .ended:
            let scale = recognizer.scale    //返回放大，缩小的倍数
            moveView.bounds.size = CGSize(width: moveView.bounds.width * scale, height: moveView.bounds.height * scale)
            recognizer.scale = 1    //重置
        default:
            return
        }
    }
    //旋转方法实现
    @objc func rotation(recognizer: UIRotationGestureRecognizer){
        switch recognizer.state {
        case .changed, .ended:
            let rotation = recognizer.rotation  //返回旋转度数
            moveView.transform = CGAffineTransform(rotationAngle: rotation)
        default:
            return
        }
    }
    //双击方法实现(消失)
    @objc func tapTwo(recognizer: UITapGestureRecognizer){
        switch recognizer.state {
        case .recognized:
            moveView.removeFromSuperview()
        default:
            return
        }
    }
    
    
    //MARK：随机添加UILabel
    @IBAction func add(_ sender: UIButton) {
        
        //随机设置原点位置
        let rect = self.view.bounds
        let x = Int(arc4random()) % Int(rect.size.width)
        let y = Int(arc4random()) % Int(rect.size.height)
        
        //随机设置颜色
        let red = CGFloat(arc4random()) / CGFloat(UInt32.max)
        let green = CGFloat(arc4random()) / CGFloat(UInt32.max)
        let blue = CGFloat(arc4random()) / CGFloat(UInt32.max)
        let color = UIColor(red: red, green: green, blue: blue, alpha: 1)
        
        let addLabel = UILabel(frame: CGRect(x: x, y: y, width: 30, height: 30))
        addLabel.backgroundColor = color
        self.view.insertSubview(addLabel, at: 0)
        
        //为添加的Label添加手势
        let panGes = UIPanGestureRecognizer(target: addLabel, action: #selector(pan))
        addLabel.addGestureRecognizer(panGes)
        
        let tapGesture = UITapGestureRecognizer(target: addLabel, action: #selector(tapTwo))
        tapGesture.numberOfTapsRequired = 2
        addLabel.addGestureRecognizer(tapGesture)
        
        //重要：设置后才能使用手势
        addLabel.isUserInteractionEnabled = true
        
    }
    
    //MARK:随机移动UILabel
    @IBAction func move(_ sender: UIButton) {
        for v in self.view.subviews{
            if v is UILabel{
                let rect = self.view.bounds
                let x = Int(arc4random()) % Int(rect.width)
                let y = Int(arc4random()) % Int(rect.height)
                UIView.animate(withDuration: 2, animations: {
                    v.center = CGPoint(x: x, y: y)
                }, completion: nil)
            }
        }
    }
    
    //MARK:全部删除UILabel
    @IBAction func clear(_ sender: UIButton) {
        for v in self.view.subviews{
            if v is UILabel{
                v.removeFromSuperview()
            }
        }
    }
    

}

