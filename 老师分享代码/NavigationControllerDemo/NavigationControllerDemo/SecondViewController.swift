//
//  SecondViewController.swift
//  NavigationControllerDemo
//
//  Created by liguiyang on 2019/11/27.
//  Copyright © 2019 20191102. All rights reserved.
//

import UIKit

protocol ChangeNameDelegate {
    func changeName(name:String)
}

class SecondViewController: UIViewController, ChangeNameDelegate {

    var name:String?
    
    func changeName(name: String) {
        self.title = name
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    //    @IBAction func showThird(_ sender: Any) {
    //        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
    //        let vc = storyboard.instantiateViewController(identifier: "third")
    //        //        let vc = SecondViewController()
    //        present(vc, animated: true, completion: nil)
    //    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        let vc = segue.destination as! ThirdViewController
        vc.delegate = self
    }
    

}
