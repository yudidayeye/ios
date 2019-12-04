//
//  ViewController.swift
//  02.AlertActionSheet_textField_animation
//
//  Created by lijin on 2019/11/19.
//  Copyright © 2019 lijin. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet var myView: UIView!
    @IBOutlet weak var usernameTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var image: UIImageView!
    
    var actionSheet:UIAlertController?
    var alert:UIAlertController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //设置为密码格式
        passwordTF.isSecureTextEntry = true
        
        //初始化actiionSheet
        actionSheet = UIAlertController(title: "颜色", message: "请选择你想设置的背景颜色", preferredStyle: .actionSheet)
        
        let action1 = UIAlertAction(title: "红色", style: .default) { (UIAlertAction) in
            self.myView.backgroundColor = UIColor.red
        }
        let action2 = UIAlertAction(title: "绿色", style: .default) { (UIAlertAction) in
            self.myView.backgroundColor = UIColor.green
        }
        let action3 = UIAlertAction(title: "蓝色", style: .default) { (UIAlertAction) in
            self.myView.backgroundColor = UIColor.blue
        }
        let action4 = UIAlertAction(title: "白色", style: .default) { (UIAlertAction) in
            self.myView.backgroundColor = UIColor.white
        }
        let action5 = UIAlertAction(title: "取消", style: .cancel, handler: nil)
        actionSheet!.addAction(action1)
        actionSheet!.addAction(action2)
        actionSheet!.addAction(action3)
        actionSheet!.addAction(action4)
        actionSheet!.addAction(action5)
        
        //alert初始化
        alert = UIAlertController(title: "登陆", message: "恭喜你登陆成功", preferredStyle: .alert)
        let action6 = UIAlertAction(title: "确定", style: .default, handler: nil)
        alert?.addAction(action6)
        
        //键盘
        NotificationCenter.default.addObserver(self, selector: #selector(windowMoveUp), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(windowMoveDown), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    //视图上移
    @objc func windowMoveUp(notification:Notification){
        guard let userInfo = notification.userInfo, let rect = userInfo["UIKeyboardBoundsUserInfoKey"] as? CGRect else {
            return
        }
        let height = rect.height
        self.view.frame.origin.y = -height
    }
    //视图下移
    @objc func windowMoveDown(notification:Notification){
        self.view.frame.origin.y = 0
        print(self.view.frame.origin.y)
    }
    
    //textField代理
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    //改背景颜色
    @IBAction func changeColor(_ sender: UIButton) {
        present(actionSheet!, animated: true, completion: nil)
    }
    
    //清空
    @IBAction func clear(_ sender: UIButton) {
        usernameTF.text = nil
        passwordTF.text = nil
    }
    
    //登陆
    @IBAction func log(_ sender: UIButton) {
        let username = usernameTF.text
        let password = passwordTF.text
        if(username == "root" && password == "root"){
            alert?.message = "登陆成功"
            present(alert!, animated: true, completion: nil)
            UIView.animate(withDuration: 4, delay: 0, options: [.autoreverse,.repeat], animations: {
                let x = self.image.frame.origin.x + 200
                let y = self.image.frame.origin.y - 200
                self.image.frame.origin = CGPoint(x: x, y: y)
            }, completion: nil)
        }else{
            alert?.message = "用户名或密码错误"
            present(alert!, animated: true, completion: nil)
        }
    }
    
}

