//
//  ViewController.swift
//  test2_5
//
//  Created by LMQ on 2019/11/19.
//  Copyright © 2019 LMQ. All rights reserved.
//

import UIKit

class TriangleView: UIView{
    override func draw(_ rect: CGRect) {
        let path = UIBezierPath()
        
        path.move(to: CGPoint(x: rect.origin.x, y: 20))
        path.addLine(to: CGPoint(x:290, y:300))
        path.addLine(to: CGPoint(x: 10, y: 300))
        
        UIColor.green.setFill()
        UIColor.green.setStroke()
        path.fill()
        path.stroke()
    }
}

class DrawCircl: UIView{
    override func draw(_ rect: CGRect) {
        let path = UIBezierPath(ovalIn: rect)
        UIColor.blue.setStroke()
        UIColor.red.setFill()
        
        path.stroke()
        path.fill()
    }
}

class ViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    
    lazy var animator = UIDynamicAnimator(referenceView: self.view)
    
    let gravity = UIGravityBehavior()
    let collision = UICollisionBehavior()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        view.backgroundColor = .red
        let tri1 = TriangleView(frame: CGRect(x: 0, y: 0, width: 200, height: 300))
        tri1.backgroundColor = UIColor.gray
        scrollView.addSubview(tri1)
        
        let cir1 = DrawCircl(frame: CGRect(x: 50, y: 150, width: 100, height: 100))
        cir1.backgroundColor = UIColor.black
        scrollView.addSubview(cir1)
        
        let cir2 = DrawCircl(frame: CGRect(x: 50, y: 420, width: 150, height: 150))
        cir2.backgroundColor = UIColor.black
        scrollView.addSubview(cir2)
        //scrollView.contentSize = tri.bounds.size
        let cir3 = DrawCircl(frame: CGRect(x: 50, y: 620, width: 150, height: 150))
        cir3.backgroundColor = UIColor.black
        scrollView.addSubview(cir2)
        
        let tri2 = TriangleView(frame: CGRect(x: 50, y: 800, width: 400, height: 700))
        tri2.backgroundColor = UIColor.clear
        scrollView.addSubview(tri2)
        scrollView.backgroundColor = UIColor.yellow
        
        scrollView.contentSize.height += tri1.frame.size.height + tri2.frame.size.height + cir1.frame.size.height + cir2.frame.height + cir3.frame.height
        
        
        
//        let layer = CAShapeLayer()
//        layer.path = UIBezierPath(rect: scrollView.bounds).cgPath
//        layer.fillColor = UIColor.clear.cgColor
//        layer.strokeColor = UIColor.black.cgColor
//        view.layer.addSublayer(layer)
        
        //view.addSubview(scrollView)
        
        
    }
    
    //UIScrollViewDelegate方法，每次滚动结束后调用
//    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
//        //let currentPage = scrollView2.contentOffset.x / scrollView2.bounds.width
//
//        //pageControl.currentPage = Int(currentPage)
//    }
    
    
    
    //self.view添加子视图时调用
    func addSubView(subview: UIView){
        view.addSubview(subview)
        
//        let imageView = UIImageView(image: UIImage(named: "\(i)"))
//        imageView.contentMode = .scaleAspectFit
//        imageView.frame = CGRect(x: Int(scrollView2.bounds.width) * (i-1), y: 0, width: Int(scrollView2.bounds.width), height: Int(scrollView2.bounds.height))
//        scrollView2.addSubview(imageView)
        
//        subview.contentMode = .scaleAspectFill
//        subview.frame = CGRect(x: 0, y: Int(scrollView.bounds.height), width: subview.bounds.width, height: subview.bounds.height)
//
//        scrollView.contentSize = CGSize(width: Int(scrollView.bounds.width), height: Int(scrollView.bounds.width) + subview.bounds.height)
        
        
        print("add Triangle")
        gravity.gravityDirection = CGVector(dx: 0, dy: -1)
        
        let width = Int(view.bounds.width) / 10
        let randx = Int((arc4random() % 10)) * width
        let rect = CGRect(x: randx, y: 50, width: width, height: width)
        
        let v = UILabel(frame: rect)
        //v.backgroundColor = UIColor(red: randColor(), green: randColor(), blue: randColor(), alpha: 1)
        v.backgroundColor = .green
        view.insertSubview(v, at: 0)
        
        gravity.addItem(v)

        scrollView.isPagingEnabled = true
        //scrollView.showsHorizontalScrollIndicator = false
        scrollView.showsVerticalScrollIndicator = false
        
        
        
    }
    @IBAction func clear(_ sender: Any) {
        let subviews = scrollView.subviews
        
        for v in subviews {
            v.removeFromSuperview()
            
        }
    }
    
    @IBAction func addTriangle(_ sender: Any) {
        print("addTriangle")
        scrollView.scrollRectToVisible(CGRect(x: 50, y: 1000, width: 500, height: 500), animated: true)
        //scrollView.scrollsToTop
        //animation：向上掉
        gravity.gravityDirection = CGVector(dx: 0, dy: -1)
        
        let width = Int(view.bounds.width) - 30
        //let randx = Int((arc4random() % 10)) * width
        let rect = CGRect(x: 30/2, y: Int(scrollView.bounds.height), width: width, height: width)
        
        //let v = UILabel(frame: rect)
        let v = TriangleView(frame: rect)
        //v.backgroundColor = UIColor(red: randColor(), green: randColor(), blue: randColor(), alpha: 1)
        
        scrollView.insertSubview(v, at: 0)
        scrollView.contentSize.height += rect.height
        
        gravity.addItem(v)
        
        scrollView.isPagingEnabled = true
        //scrollView.showsHorizontalScrollIndicator = false
        scrollView.showsVerticalScrollIndicator = false
        
    }
    

}

