//
//  ViewController.swift
//  01Exam_add UIView_grivity
//
//  Created by lijin on 2019/11/19.
//  Copyright © 2019 lijin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var myView: UIView!
    @IBOutlet weak var rectCountLabel: UILabel!
    @IBOutlet weak var labelCountLabel: UILabel!
    
    lazy var animator1 = UIDynamicAnimator(referenceView: myView)
    lazy var animator2 = UIDynamicAnimator(referenceView: myView)
    let labelGravity = UIGravityBehavior()
    let rectGravity = UIGravityBehavior()
    let collision = UICollisionBehavior()
    let collision2 = UICollisionBehavior()
    
    var labelCount = 0
    var rectCount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collision.translatesReferenceBoundsIntoBoundary = true
        collision2.translatesReferenceBoundsIntoBoundary = true
        
        labelGravity.gravityDirection = CGVector(dx: 0, dy: 1)
        rectGravity.gravityDirection = CGVector(dx: -1, dy: 0)
        
        animator1.addBehavior(labelGravity)
        animator2.addBehavior(rectGravity)
        animator2.addBehavior(collision2)
        animator1.addBehavior(collision)
    }
    
    func randomX() -> Int{
        let myViewWidth = myView.frame.width;
        return Int(arc4random())%Int(myViewWidth - 50);
    }
    
    func randomY() -> Int{
        let myViewHeight = myView.frame.height;
        return Int(arc4random())%Int(myViewHeight - 50);
    }
    
    @IBAction func addRect(_ sender: UIButton) {
        let x = randomX()
        let y = randomY()
        let addView = UIView(frame: CGRect(x: x, y: y, width: 50, height: 50))
        addView.backgroundColor = UIColor.blue
        addView.layer.borderWidth = 10
        addView.layer.cornerRadius = 10
        addView.layer.borderColor = UIColor.red.cgColor
        
        
        myView.addSubview(addView)
        
        rectGravity.addItem(addView)
        collision2.addItem(addView)
        
        //count statistic
        rectCount += 1
        rectCountLabel.text = String(rectCount)
        
    }
    func randomChar() -> Character{
        let ranInt = 65 + arc4random() % 26
        return Character(Unicode.Scalar(ranInt)!)
    }
    
    @IBAction func addLabel(_ sender: UIButton) {
        let x = randomX()
        let y = randomY()
        let addLabel = UILabel(frame: CGRect(x: x, y: y, width: 20, height: 20))
        addLabel.text = String(randomChar())
        addLabel.textColor = UIColor.red
        addLabel.backgroundColor = UIColor.white
        
        myView.addSubview(addLabel)
        
        labelGravity.addItem(addLabel)
        collision.addItem(addLabel)
        
        //count statistic
        labelCount += 1
        labelCountLabel.text = String(labelCount)
    }
    
    @IBAction func clear(_ sender: UIButton) {
        let labels = myView.subviews
        for i in labels{
            i.removeFromSuperview()
        }
        
        //reset count
        labelCount = 0
        labelCountLabel.text = String(labelCount)
        rectCount = 0
        rectCountLabel.text = String(rectCount)
    }
    

}

