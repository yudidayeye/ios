//
//  PurpleViewController.swift
//  MMvc
//
//  Created by student on 2019/11/28.
//  Copyright © 2019 2017110517. All rights reserved.
//

import UIKit

class PurpleViewController: UIViewController {

    @IBOutlet weak var firstTF: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    


    //正向传参，改变下一页的title
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showSecond" {
            if let secVC = segue.destination as? YellowViewController{
                secVC.navigationItem.title = firstTF.text
            }
        }
    }
    

}
