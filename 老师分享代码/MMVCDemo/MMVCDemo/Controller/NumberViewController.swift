//
//  NumberViewController.swift
//  MMVCDemo
//
//  Created by liguiyang on 2019/11/27.
//  Copyright © 2019 20191102. All rights reserved.
//

import UIKit

class NumberViewController: UIViewController {

    @IBOutlet weak var numberLabel: UILabel!
    
    var number: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        numberLabel.text = number

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
