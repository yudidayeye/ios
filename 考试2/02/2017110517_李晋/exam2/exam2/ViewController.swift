//
//  ViewController.swift
//  exam2
//
//  Created by student on 2019/11/20.
//  Copyright © 2019 lijin. All rights reserved.
//

import UIKit

//完成了横竖屏的自适应，添加约束
//登录成功：用户名：lijin ； 密码：lijin

class ViewController: UIViewController,UITextFieldDelegate {
    
    @IBOutlet var bgView: UIView!
    @IBOutlet weak var userTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var planeImage: UIImageView!
    
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var clearButton: UIButton!
    
    
    var actionSheet:UIAlertController?
    var successAlert:UIAlertController?
    var failureAlert:UIAlertController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //将按钮设为圆角
        loginButton.layer.cornerRadius = 10
        clearButton.layer.cornerRadius = 10
        
        //设置密码框格式
        passwordTF.isSecureTextEntry = true
        
        //初始化actionSheet
        actionSheet = UIAlertController(title: "背景颜色设置", message: "请选择你想设置的背景颜色", preferredStyle: .actionSheet)
        
        let action1 = UIAlertAction(title: "粉红色", style: .default) { (UIAlertAction) in
            self.bgView.backgroundColor = UIColor.init(red: 0.861, green: 0.716, blue: 0.855, alpha: 1)
        }
        let action2 = UIAlertAction(title: "绿色", style: .default) { (UIAlertAction) in
            self.bgView.backgroundColor = UIColor.init(red: 0.385, green: 0.861, blue: 0.539, alpha: 1)
        }
        let action3 = UIAlertAction(title: "蓝色", style: .default) { (UIAlertAction) in
            self.bgView.backgroundColor = UIColor.init(red: 0.640, green: 0.870, blue: 0.891, alpha: 1)
        }
        let action4 = UIAlertAction(title: "白色", style: .default) { (UIAlertAction) in
            self.bgView.backgroundColor = UIColor.white
        }
        let action5 = UIAlertAction(title: "取消", style: .cancel, handler: nil)
        actionSheet!.addAction(action1)
        actionSheet!.addAction(action2)
        actionSheet!.addAction(action3)
        actionSheet!.addAction(action4)
        actionSheet!.addAction(action5)
        
        //初始化successAlert
        successAlert = UIAlertController(title: "登陆", message: "警告：你的用户名和密码将会通过网络明文传输，可能存在安全隐患，你确定要登录吗？", preferredStyle: .alert)
        let action6 = UIAlertAction(title: "确定", style: .default, handler: nil)
        let action7 = UIAlertAction(title: "取消", style: .default, handler: nil)
        successAlert?.addAction(action6)
        successAlert?.addAction(action7)
        
        //初始化failureAlert
        failureAlert = UIAlertController(title: "登陆", message: "错误：用户名或密码错误！", preferredStyle: .alert)
        let action8 = UIAlertAction(title: "确定", style: .default, handler: nil)
        failureAlert?.addAction(action8)
        
        //NotificationCenter,设置键盘通知事件
        NotificationCenter.default.addObserver(self, selector: #selector(viewUp), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(viewDown), name: UIResponder.keyboardWillHideNotification, object: nil)
        
    }
    //键盘出现 视图上移
    @objc func viewUp(notification:Notification){
        guard let userInfo = notification.userInfo, let rect = userInfo["UIKeyboardBoundsUserInfoKey"] as? CGRect else {
            return
        }
        let height = rect.height
        self.view.frame.origin.y = -height
    }
    //键盘出现 视图下移
    @objc func viewDown(notification:Notification){
        self.view.frame.origin.y = 0
        print(self.view.frame.origin.y)
    }
    //UITextField代理 按retrn键盘消失
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    //改变背景颜色
    @IBAction func changeColor(_ sender: UIButton) {
        present(actionSheet!, animated: true, completion: nil)
    }
    
    //登录
    @IBAction func login(_ sender: UIButton) {
        let username = userTF.text
        let password = passwordTF.text
        if(username == "lijin" && password == "lijin"){    //登录成功,显示successAlert
            present(successAlert!, animated: true, completion: nil)
            //飞机飞出屏幕的动画
            UIView.animate(withDuration: 4, delay: 0, options: [.curveEaseOut], animations: {
                let x = self.planeImage.frame.origin.x + 350
                let y = self.planeImage.frame.origin.y - 350
                self.planeImage.frame.origin = CGPoint(x: x, y: y)
            }, completion: nil)
        }else{  //登录失败，显示failureAlert
            present(failureAlert!, animated: true, completion: nil)
        }
    }
    
    //清空
    @IBAction func clear(_ sender: UIButton) {
        userTF.text = nil
        passwordTF.text = nil
    }
    
    
    
    
}

