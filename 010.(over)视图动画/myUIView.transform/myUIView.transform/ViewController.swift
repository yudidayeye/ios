//
//  ViewController.swift
//  myUIView.transform
//
//  Created by lijin on 2019/11/14.
//  Copyright © 2019 lijin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myView: UIView!
    
    var newView: UIView? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }
    
    //改变颜色
    @IBAction func changeColor(_ sender: UIButton) {
        if let _ = myView{
            UIView.transition(with: myView, duration: 2, options: .transitionFlipFromBottom, animations: {
                self.myView.backgroundColor = UIColor.green
                }, completion: nil)
        }
    }
    
    
    //改变视图
    @IBAction func changeView(_ sender: UIButton) {
        
        if let _ = myView{
            newView = UIView(frame: myView.frame)
            newView!.backgroundColor = UIColor.blue
            UIView.transition(from: myView, to: newView!, duration: 2, options: .transitionCurlUp, completion: nil)
        }
    }
    
}

