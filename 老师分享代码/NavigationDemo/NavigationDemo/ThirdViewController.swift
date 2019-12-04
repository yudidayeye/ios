//
//  ThirdViewController.swift
//  NavigationDemo
//
//  Created by liguiyang on 2019/11/27.
//  Copyright © 2019 20191102. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {

    @IBOutlet weak var nameTF: UITextField!
    
//    var delegate: changeNameDelegate?
    
//    var person: Person?
    var name: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
//    @IBAction func changeName(_ sender: Any) {
////        let appDG = UIApplication.shared.delegate as! AppDelegate
//////        appDG.name = nameTF.text]
////        if let delegate = delegate, let name = nameTF.text {
////            delegate.change(name: name)
////        }
////
////        self.navigationController?.popViewController(animated: true)
//    }
    
    
    
//
//    override func viewWillDisappear(_ animated: Bool) {
//        person!.name = nameTF.text!
////        if let delegate = delegate, let name = nameTF.text {
////            delegate.change(name: name)
////        }
//
//    }
//
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        name = nameTF.text
    }
    

}
