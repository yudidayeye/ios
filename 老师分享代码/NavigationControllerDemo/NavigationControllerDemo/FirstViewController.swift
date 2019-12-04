//
//  ViewController.swift
//  NavigationControllerDemo
//
//  Created by liguiyang on 2019/11/27.
//  Copyright © 2019 20191102. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var nameTF: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
//
//    @IBAction func showSecondVC(_ sender: Any) {
//        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
//        let vc = storyboard.instantiateViewController(identifier: "second")
////        let vc = SecondViewController()
//        present(vc, animated: true, completion: nil)
//    }
//
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowSecond" {
            let vc = segue.destination as! SecondViewController
            vc.name = nameTF.text
        }
    }
}

