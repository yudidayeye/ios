//
//  ViewController.swift
//  DynamicDemo
//
//  Created by liguiyang on 2019/11/6.
//  Copyright © 2019 20191102. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    lazy var animator = UIDynamicAnimator(referenceView: self.view)
    
    let gravity = UIGravityBehavior()
    let collision = UICollisionBehavior()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collision.translatesReferenceBoundsIntoBoundary = true
        
        //画圆
        let layer = CAShapeLayer()
        layer.path = UIBezierPath(ovalIn: view.bounds).cgPath
        layer.fillColor = UIColor.clear.cgColor
        layer.strokeColor = UIColor.black.cgColor
        view.layer.addSublayer(layer)
        collision.addBoundary(withIdentifier: NSString("abc"), for: UIBezierPath(ovalIn: view.bounds))

    }

    func randColor() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }

    @IBAction func add(_ sender: Any) {
        let width = Int(view.bounds.width / 10)
        let randx = Int(arc4random() % 10) * width
        let rect = CGRect(x: randx, y: 50, width: width, height: width)
        
        let v = UILabel(frame: rect)
        v.backgroundColor = UIColor(red: randColor(), green: randColor(), blue: randColor(), alpha: 1)
        view.insertSubview(v, at: 0)
        
        gravity.addItem(v)
        collision.addItem(v)
        
    }
    @IBAction func move(_ sender: Any) {
        animator.addBehavior(gravity)
        animator.addBehavior(collision)
    }
    
    @IBAction func stop(_ sender: Any) {
        animator.removeBehavior(gravity)
        animator.removeBehavior(collision)

    }
    
    @IBAction func left(_ sender: Any) {
        gravity.gravityDirection = CGVector(dx: -1, dy: 0)
    }
    
    @IBAction func right(_ sender: Any) {
        gravity.gravityDirection = CGVector(dx: 1, dy: 0)
    }
    
    @IBAction func up(_ sender: Any) {
        gravity.gravityDirection = CGVector(dx: 0, dy: -1)
    }
    
    @IBAction func down(_ sender: Any) {
        gravity.gravityDirection = CGVector(dx: 0, dy: 1)
    }
}

