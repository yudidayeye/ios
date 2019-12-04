//
//  SecondViewController.swift
//  NavigationDemo
//
//  Created by liguiyang on 2019/11/27.
//  Copyright © 2019 20191102. All rights reserved.
//

import UIKit
//
//protocol changeNameDelegate {
//    func change(name: String)
//}


class SecondViewController: UIViewController {
//    func change(name: String) {
//        self.name = name
//    }
//

    var name:String?
    
//    var person = Person(name: "")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func changeName(segue: UIStoryboardSegue) {
        let vc = segue.source as! ThirdViewController
        self.title = vc.name
    }
    
//    
//    override func viewWillAppear(_ animated: Bool) {
//        self.title = person.name
//
//
//    }
//    
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "ShowThird" {
//            let vc = segue.destination as! ThirdViewController
////            vc.delegate = self
//            vc.person = person
//        }
//    }
//    
    
}
