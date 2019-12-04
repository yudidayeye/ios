//
//  ViewController.swift
//  NavigationDemo
//
//  Created by liguiyang on 2019/11/27.
//  Copyright © 2019 20191102. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var nameTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

//    @IBAction func showSecond(_ sender: Any) {
//        let secVC = SecondViewController()
////        self.present(secVC, animated: true, completion: nil)
//        self.navigationController?.pushViewController(secVC, animated: true)
//    }
//
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowSecond" {
            if let secVC = segue.destination as? SecondViewController {
                secVC.name = nameTF.text
            }
        }
    }
}

