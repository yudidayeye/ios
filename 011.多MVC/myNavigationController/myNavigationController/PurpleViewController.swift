//
//  PurpleViewController.swift
//  myNavigationController
//
//  Created by student on 2019/11/28.
//  Copyright © 2019 2017110517. All rights reserved.
//

import UIKit


class PurpleViewController: UIViewController {
    
    @IBOutlet weak var titleTF: UITextField!
    
    @IBOutlet weak var messTF: UITextField!
    
    @IBOutlet weak var mess2TF: UITextField!
    
    //44444.声明类----由上一页面赋值，类传引用（自定类反向传参）
    var secondParam:SecondParam?
    
    //33333.声明协议----由上一页面赋值（自定协议反向传参）
    var delegate:ParamTransDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("third view DidLoad!")
        
    }
    
    @IBAction func changeName(_ sender: UIButton) {
        //2222.通过全局变量反向传参（在AppDelegate中设置）
        let appDG = UIApplication.shared.delegate as! AppDelegate
        appDG.secondTitle = titleTF.text!
        
        //01.按button后返回上一页面
        self.navigationController?.popViewController(animated: true)
    }

    @IBAction func transParam(_ sender: UIButton) {
        //33333.调用代理方法传参（自定协议反向传参）
        if let delegate = delegate{
            let mess = messTF.text
            delegate.trans(mess: mess!)
        }
        self.navigationController?.popViewController(animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        //4444.传递参数（自定类反向传参）
        secondParam?.param = mess2TF.text!
    }
    
}
