//
//  ViewController.swift
//  bezierPath
//
//  Created by student on 2019/11/20.
//  Copyright © 2019 lijin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var myView: UIView!
    
    var myCircle:MyCircle? = nil
    override func viewDidLoad() {
        super.viewDidLoad()
        myCircle = MyCircle(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        myCircle?.center = myView.center
        myCircle?.backgroundColor = UIColor.clear
        self.myView.addSubview(myCircle!)
        
    }


}
