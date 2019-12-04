//
//  YellowViewController.swift
//  myNavigationController
//
//  Created by student on 2019/11/28.
//  Copyright © 2019 2017110517. All rights reserved.
//

import UIKit

class YellowViewController: UIViewController {

    @IBOutlet weak var firstTF: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("first view DidLoad!")
    }
    //prepare函数在viewContrller切换之前执行
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //11111.正向传参
        if segue.identifier == "showSecond"{
            if let secondVC = segue.destination as? BlueViewController{
                secondVC.mytitle = firstTF.text
            }
        }
    }

}
