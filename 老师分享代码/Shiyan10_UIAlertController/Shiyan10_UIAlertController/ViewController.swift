//
//  ViewController.swift
//  Shiyan10_UIAlertController
//
//  Created by student on 2019/11/7.
//  Copyright © 2019年 lmq. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var button:UIButton? = nil
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.view.backgroundColor = UIColor.red
        
    }
    
    //显示ActioSheet并进行交互
    @IBAction func actionSheet(_ sender: Any){
        let actionSheet = UIAlertController(title: "Action Sheet", message: "this is a choose menu", preferredStyle: .actionSheet)

        actionSheet.addAction(UIAlertAction(title: "A option", style: .default , handler: { (_) in
            print("you choose A option")
        }))
        actionSheet.addAction(UIAlertAction(title: "B option", style: .default , handler: { (alertAction) in
            print("you choose B option")
        }))
        actionSheet.addAction(UIAlertAction(title: "C option", style: .default , handler: { (alertAction) in
            print("you choose C option")
        }))
        actionSheet.addAction(UIAlertAction(title: "Destructive", style: .destructive , handler: { (alertAction) in
            print("you choose Destructive")
        }))
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (alertAction) in
            print("you choose Cancel")
            }))

        self.present(actionSheet, animated: true, completion: nil)
    }
    
    
//    显示LoginAlert并进行交互
//    @IBAction func alert(_ sender: Any){
//        let alert = UIAlertController(title: "Login ALert", message: "Please input you username and password", preferredStyle: .alert)
//        alert.addTextField { (textField) in
//            textField.placeholder = "your username?"
//        }
//        alert.addTextField { (textField) in
//            textField.placeholder = "your password?"
//            textField.isSecureTextEntry = true
//        }
//
//        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
//
//        alert.addAction(UIAlertAction(title: "Confirm", style: .default) { (_) in
//            if let userName = alert.textFields?.first?.text, let passWord = alert.textFields?.last?.text {
//                print("userName: \(userName), password:\(passWord)")
//            }
//        })
//
//        self.present(alert, animated: true, completion: nil)
//    }

}

