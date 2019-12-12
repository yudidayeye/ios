//
//  ViewController.swift
//  multiThreading
//
//  Created by student on 2019/12/11.
//  Copyright © 2019 2017110517. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var testLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func add(_ sender: UIButton) {
        //方法一：DispatchQueue
        DispatchQueue.global().async { //创建子线程，在子线程中执行
            var result = 0
            for i in 1...9999999{
                result = result + i
            }
            DispatchQueue.main.async {  //回到主线程，界面操作必须在主线程中执行
                self.resultLabel.text = "\(result)"
            }
        }
    }
    
    
    @IBAction func test(_ sender: UIButton) {
        testLabel.text = "I am testing multithreading!"
    }
}

