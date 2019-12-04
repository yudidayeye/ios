//
//  ViewController.swift
//  alertController
//
//  Created by lijin on 2019/11/13.
//  Copyright © 2019 lijin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    //MARK:点击按钮显示中间alert
    @IBAction func alertShow(_ sender: UIButton) {
        let alert = UIAlertController(title: "Login Alert", message: "Please input your username and password", preferredStyle: .alert)
        alert.addTextField { (textField) in
            textField.placeholder = "请输入你的用户名"
        }
        alert.addTextField(configurationHandler: {
            (textField) in
            textField.placeholder = "请输入你的密码"
            textField.isSecureTextEntry = true  //设置UItextField为密码格式
        })
        let action1 = UIAlertAction(title: "取消", style: .cancel, handler: nil)
        let action2 = UIAlertAction(title: "确认", style: .default) { (UIAlertAction) in
            //点击确认后执行
            if let username = alert.textFields?.first?.text, let password = alert.textFields?.last?.text{
                print("你的用户名为\(username)")
                print("你的密码为\(password)")
            }
        }
        alert.addAction(action1)
        alert.addAction(action2)
        
        //设置UIAlertController显示
        self.present(alert, animated: true, completion: nil)
    }
    
    
    
    //MARK:点击按钮显示下方actionSheet框
    @IBAction func actionSheetShow(_ sender: UIButton) {
        let actionSheet = UIAlertController(title: "菜单栏", message: "选择你喜欢的选项", preferredStyle: .actionSheet)
        let action1 = UIAlertAction(title: "选项一：吃饭.destructive", style: .destructive, handler: {
            (alertAction) in
            print("吃饭")
        })
        let action2 = UIAlertAction(title: "选项三：吃饭和睡觉.cancel", style: .cancel, handler: {
            (alertAction) in
            print("吃饭和睡觉")
        })
        let action3 = UIAlertAction(title: "选项二：睡觉.default", style: .default, handler: {
            (alertAction) in
            print("睡觉")
        })
        actionSheet.addAction(action1)
        actionSheet.addAction(action2)
        actionSheet.addAction(action3)
        
        present(actionSheet, animated: true, completion: nil)
    }
    

}

