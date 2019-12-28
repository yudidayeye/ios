//
//  ViewController.swift
//  AnimationDemo
//
//  Created by liguiyang on 2016/11/12.
//  Copyright © 2016年 sicnu. All rights reserved.
//

import UIKit

extension UIButton {
    func setup() {
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.borderWidth =  1
        self.backgroundColor = UIColor.yellow
        
        self.addTarget(self, action: #selector(springUp(_:)), for: .touchUpInside)
        self.addTarget(self, action: #selector(springDown(_:)), for: .touchDown)
    }
    
    open override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    
    
    @objc func springUp(_ sender: UIButton) {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.1, initialSpringVelocity: 50, options: .allowUserInteraction, animations: {
            sender.bounds.size.width -= 10
            sender.bounds.size.height -= 10
            }, completion: nil)
    }
    
    @objc func springDown(_ sender: UIButton) {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.1, initialSpringVelocity: 50, options: .allowUserInteraction, animations: {
            sender.bounds.size.width += 10
            sender.bounds.size.height += 10
            }, completion: nil)
    }
}

class ViewController: UIViewController{
    
    @IBOutlet weak var testLabel: UILabel!
    @IBOutlet weak var testview: UIView!
    @IBAction func transformanim(_ sender: AnyObject) {
        UIView.animate(withDuration: 2) {
            var trans = CGAffineTransform(scaleX: 2, y: 2)
            trans = trans.rotated(by: CGFloat(Double.pi))
            trans = trans.translatedBy(x: 100, y: 100)
            self.testview.transform = trans
            self.testview.transform = CGAffineTransform.identity
            
        }
        //        testview.transform = CGAffineTransform.identity
        UIView.animate(withDuration: 2, delay: 0, options: .curveEaseInOut, animations: {
            self.testLabel.transform =  CGAffineTransform(rotationAngle: CGFloat(Double.pi))
            self.testLabel.transform = CGAffineTransform.identity
            self.testLabel.transform =  CGAffineTransform(rotationAngle: CGFloat(Double.pi))
            self.testLabel.transform = CGAffineTransform.identity
            }, completion: { _ in
//                self.testLabel.transform =  CGAffineTransform(rotationAngle: CGFloat(0))
                
        })
        testLabel.transform = CGAffineTransform.identity
    }
    @IBAction func animate(_ sender: AnyObject) {
        
        UIView.animate(withDuration: 1, animations: {
            self.testview.center.x += 200.0
            },completion: { _ in
                UIView.animate(withDuration: 1, animations: {
                    self.testview.center.x -= 200.0
                    }, completion:nil)
        })
    }
    
    @IBAction func keyframes(_ sender: AnyObject) {
        UIView.animateKeyframes(withDuration: 2,
                                delay: 0,
                                options: [],
                                animations:
            {
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.25, animations: {
                    self.testview.center.x += 200.0
                })
                UIView.addKeyframe(withRelativeStartTime: 0.25, relativeDuration: 0.25, animations: {
                    self.testview.center.y += 100.0
                })
                UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.25, animations: {
                    self.testview.center.x -= 200.0
                })
                UIView.addKeyframe(withRelativeStartTime: 0.75, relativeDuration: 0.25, animations: {
                    self.testview.center.y -= 100.0
                })
                
            }, completion: nil)
        

    }
    
    @IBAction func layertransform(_ sender: AnyObject) {
        
        UIView.animate(withDuration: 2, animations: {
            var trans3d = CATransform3DIdentity
            trans3d.m34 = -1.0 / 200
            trans3d = CATransform3DRotate(trans3d, CGFloat(Double.pi), 0, 1, 0)
            self.testview.layer.transform = trans3d

        }){ (_) in
            UIView.animate(withDuration: 2) {
                self.testview.layer.transform = CATransform3DIdentity
            }
        }
        
    }
    
    @IBAction func basicanim(_ sender: AnyObject) {
        let shapeLayer = CAShapeLayer()
        shapeLayer.frame = self.testview.bounds
        shapeLayer.strokeStart = 0
        shapeLayer.strokeEnd = 0.5
        let path = UIBezierPath(ovalIn: testview.bounds)
        shapeLayer.path = path.cgPath
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeColor = UIColor.red.cgColor
        shapeLayer.lineWidth = 2
        
        testview.layer.addSublayer(shapeLayer)
        
        
        let anim = CABasicAnimation(keyPath: "strokeEnd")
        anim.duration = 3
        anim.fromValue = 0
        anim.toValue = 1
        anim.isRemovedOnCompletion = false
        anim.fillMode = kCAFillModeForwards
        anim.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        shapeLayer.add(anim, forKey: "")
        
    }
    
    func animateCircleLayer(frame: CGRect, duration: CFTimeInterval) ->CAShapeLayer {
        let shapeLayer = CAShapeLayer()
        shapeLayer.frame = frame
        shapeLayer.strokeStart = 0
        shapeLayer.strokeEnd = 0.5
        let path = UIBezierPath(ovalIn: frame)
        shapeLayer.path = path.cgPath
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeColor = UIColor.red.cgColor
        shapeLayer.lineWidth = 10
        
        
        let anim = CABasicAnimation(keyPath: "strokeEnd")
        anim.duration = duration
        anim.fromValue = 0
        anim.repeatCount = Float.greatestFiniteMagnitude
        anim.toValue = 1
        anim.isRemovedOnCompletion = false
        anim.fillMode = kCAFillModeForwards
        anim.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        shapeLayer.add(anim, forKey: "")
        
        return shapeLayer
    }
    
    @IBAction func clear(_ sender: AnyObject) {
        testview.layer.removeAllAnimations()
        for layer in testview.layer.sublayers! {
            if layer is CATransformLayer || layer is CAShapeLayer {
                layer.removeFromSuperlayer()
            }
        }
        for layer in view.layer.sublayers! {
            if layer is CAShapeLayer {
                layer.removeFromSuperlayer()
            }
        }

        testLabel.layer.removeAllAnimations()
    }
    
    @IBAction func layer3danim(_ sender: AnyObject) {
        clear(sender)
        let layer1 = CAShapeLayer()
        layer1.frame = self.testview.bounds
        layer1.backgroundColor = UIColor.green.cgColor
        layer1.opacity = 0.5
        
        
        let layer2 = CAShapeLayer()
        layer2.frame = self.testview.bounds
        layer2.backgroundColor = UIColor.blue.cgColor
        layer2.opacity = 0.5
        
        let containlayer = CATransformLayer()
        
        containlayer.frame = self.testview.bounds
        containlayer.backgroundColor = UIColor.clear.cgColor
        
        self.testview.layer.addSublayer(containlayer)
        
        let trans1 = CATransform3DIdentity
        layer1.transform = CATransform3DTranslate(trans1, 0, 0, -30)
        let trans2 = CATransform3DIdentity
        layer2.transform = CATransform3DTranslate(trans2, 0, 0, 30)
        
        containlayer.addSublayer(layer2)
        containlayer.addSublayer(layer1)
        
        let faceLayer = animateCircleLayer(frame: self.testview.bounds, duration: 3)
        faceLayer.transform = CATransform3DTranslate(trans2, 0, 0, -10)
        let littlefaceLayer1 = animateCircleLayer(frame: CGRect(x:10,y:10,width:40,height:40), duration: 1)
        littlefaceLayer1.transform = CATransform3DTranslate(trans2, 0, 0, 10)
        let littlefaceLayer2 = animateCircleLayer(frame: CGRect(x:50,y:10,width:40,height:40), duration: 1)
        littlefaceLayer2.transform = CATransform3DTranslate(trans2, 0, 0, 10)
        let littlefaceLayer3 = animateCircleLayer(frame: CGRect(x:30,y:40,width:40,height:40), duration: 1)
        littlefaceLayer3.transform = CATransform3DTranslate(trans2, 0, 0, 20)
        containlayer.addSublayer(faceLayer)
        containlayer.addSublayer(littlefaceLayer1)
        containlayer.addSublayer(littlefaceLayer2)
        containlayer.addSublayer(littlefaceLayer3)
        
        
        
        var degree: CGFloat = 0.0
        
        let timer = Timer(timeInterval: 2, repeats: true) { (_) in
            var trans2 = CATransform3DIdentity
            
            trans2.m34 = -1.0 / 500
            let anim = CABasicAnimation(keyPath: "transform")
            anim.duration = 1
            anim.fromValue = CATransform3DRotate(trans2, degree, 0, 1, 0)
            degree += CGFloat(Double.pi/2)
            anim.toValue = CATransform3DRotate(trans2, degree, 0, 1, 0)
            containlayer.transform = CATransform3DRotate(trans2, degree, 0, 1, 0)
            containlayer.add(anim, forKey: "transform3D")
        }
        RunLoop.main.add(timer, forMode: .defaultRunLoopMode)
        timer.fire()
        
        
        
        
    }
    
    @IBAction func cakeyframeanim(_ sender: AnyObject) {
        //draw keypath
        let path1 = UIBezierPath()
        path1.move(to: CGPoint(x: 0, y: view.bounds.size.height))
        path1.addQuadCurve(to: CGPoint(x: view.bounds.size.width, y: view.bounds.size.height), controlPoint: view.center)
        
        let shapeLayer1 = CAShapeLayer()
        shapeLayer1.path = path1.cgPath
        shapeLayer1.fillColor = UIColor.clear.cgColor
        shapeLayer1.strokeColor = UIColor.red.cgColor
        shapeLayer1.lineWidth = 4
        self.view.layer.addSublayer(shapeLayer1)
        
        let path2 = UIBezierPath()
        path2.move(to: CGPoint(x: 0, y: view.bounds.size.height/2))
        path2.addCurve(to: CGPoint(x: view.bounds.size.width, y: view.bounds.size.height/2), controlPoint1: CGPoint(x: view.bounds.size.width/2, y: 100), controlPoint2: CGPoint(x: view.bounds.size.width/2, y: view.bounds.size.height - 100))
        
        let shapeLayer2 = CAShapeLayer()
        shapeLayer2.path = path2.cgPath
        shapeLayer2.fillColor = UIColor.clear.cgColor
        shapeLayer2.strokeColor = UIColor.red.cgColor
        shapeLayer2.lineWidth = 4
        self.view.layer.addSublayer(shapeLayer2)

        let path3 = UIBezierPath(ovalIn: self.testview.frame)
        
        let shapeLayer3 = CAShapeLayer()
        shapeLayer3.path = path3.cgPath
        shapeLayer3.fillColor = UIColor.clear.cgColor
        shapeLayer3.strokeColor = UIColor.red.cgColor
        shapeLayer3.lineWidth = 1
        self.view.layer.addSublayer(shapeLayer3)

        //move circle with the path
        let anim1 = CAKeyframeAnimation(keyPath: "position")
        anim1.path = path1.cgPath
        anim1.duration = 2
        anim1.autoreverses = true
        anim1.repeatCount = Float.greatestFiniteMagnitude
        self.testview.layer.add(anim1, forKey: "")
        
        let anim2 = CAKeyframeAnimation(keyPath: "position")
        anim2.path = path2.cgPath
        anim2.duration = 2
        anim2.autoreverses = true
        anim2.repeatCount = Float.greatestFiniteMagnitude
        self.testLabel.layer.add(anim2, forKey: "")
        
        let anim3 = CAKeyframeAnimation(keyPath: "position")
        anim3.path = path3.cgPath
        anim3.duration = 6
        anim3.repeatCount = Float.greatestFiniteMagnitude
        anim3.isRemovedOnCompletion = false
        anim3.fillMode = kCAFillModeForwards
        
        let circle = CAShapeLayer()
        circle.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        circle.path = UIBezierPath(ovalIn: circle.frame).cgPath
        circle.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        circle.fillColor = UIColor.blue.cgColor
        self.view.layer.addSublayer(circle)
        circle.add(anim3, forKey: "")
        
        let circle2 = CAShapeLayer()
        circle2.frame = CGRect(x: 0, y: 0, width: 10, height: 10)
        circle2.path = UIBezierPath(ovalIn: circle2.frame).cgPath
        circle2.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        circle2.fillColor = UIColor.orange.cgColor
        view.layer.addSublayer(circle2)
        circle2.add(anim3, forKey: "")

        
        

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.testview.layer.shadowColor = UIColor.black.cgColor
        self.testview.layer.shadowOffset = CGSize(width: 10, height: 10)
        self.testview.layer.shadowOpacity = 0.5
        self.testview.layer.shadowRadius = 5
        testview.layer.cornerRadius = 5
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

