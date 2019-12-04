//
//  ViewController.swift
//  dynamic animation
//
//  Created by student on 2019/11/7.
//  Copyright © 2019 lijin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //11111111重力动画
    lazy var animator = UIDynamicAnimator(referenceView: self.view)
    let gravity = UIGravityBehavior()   //重力
    let collision = UICollisionBehavior()   //碰撞
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //333333333333,设置这个碰撞生效
        collision.translatesReferenceBoundsIntoBoundary = true
        
        
        //画圆
        let layer = CAShapeLayer()
        layer.path = UIBezierPath(ovalIn: view.bounds).cgPath
        layer.fillColor = UIColor.clear.cgColor     //背景色透明
        layer.strokeColor = UIColor.black.cgColor   //边线颜色
        view.layer.addSublayer(layer)
        //77777777777777 碰撞加边界
        collision.addBoundary(withIdentifier: NSString("随意写"), for: UIBezierPath(ovalIn: view.bounds))
            
    }
    
    //返回一个随机颜色值
    func randColor() -> CGFloat{
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
    
    //添加UIlabel控件
    @IBAction func add(_ sender: Any) {
        let width = Int(view.bounds.width/10)   //设置为屏幕宽度的10分之1
        let randx = Int((arc4random() % 10)) * width    //10以内的整数乘宽度
        let rect = CGRect(x:randx,y:50,width: width,height: width)
        
        let labelAdd = UILabel(frame: rect)
        labelAdd.backgroundColor = UIColor(red: randColor(), green: randColor(), blue: randColor(), alpha: 1)
        
        
        //view.addSubview(labelAdd)
        view.insertSubview(labelAdd, at: 0)
        //让加入的空间不挡住文字，加在0层
        
        //2222222222222
        gravity.addItem(labelAdd)
        collision.addItem(labelAdd)
    }
    
    

    //添加动画
    @IBAction func move(_ sender: Any) {
        //44444444444
        animator.addBehavior(gravity)
        animator.addBehavior(collision)
    }
    
    //移除动画
    @IBAction func stop(_ sender: Any) {
        //55555555555
        animator.removeBehavior(gravity)
        animator.removeBehavior(collision)
    }
    
    //666666666666666
    //设置重力方向
    @IBAction func left(_ sender: Any) {
        gravity.gravityDirection = CGVector(dx: -1, dy: 0)
    }
    
    @IBAction func right(_ sender: UIButton) {
        gravity.gravityDirection = CGVector(dx: 1, dy: 0)
    }
    
    @IBAction func up(_ sender: UIButton) {
        gravity.gravityDirection = CGVector(dx: 0, dy: -1)
    }
    
    @IBAction func down(_ sender: UIButton) {
        gravity.gravityDirection = CGVector(dx: 0, dy: 1)
    }
}

