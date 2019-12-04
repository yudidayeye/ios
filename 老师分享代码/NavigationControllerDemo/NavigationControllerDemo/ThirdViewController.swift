//
//  ThirdViewController.swift
//  NavigationControllerDemo
//
//  Created by liguiyang on 2019/11/27.
//  Copyright © 2019 20191102. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {

    @IBOutlet weak var nameTF: UITextField!
    
    
    var delegate: ChangeNameDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Third"

        // Do any additional setup after loading the view.
    }
    
    @IBAction func ok(_ sender: Any) {
        delegate?.changeName(name: nameTF.text!)
        self.navigationController?.popViewController(animated: true)
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
