//
//  ViewController.swift
//  textField
//
//  Created by lijin on 2019/11/10.
//  Copyright © 2019 lijin. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate {

    
    @IBOutlet weak var usernameTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //-------------MARK:代码实现一个UITextField----------
        /*
        let tField = UITextField(frame: CGRect(x: 50, y: 100, width: 300, height: 40))
        tField.borderStyle = .bezel
        tField.placeholder = "请输入你的账号"
        tField.textAlignment = .center
        tField.textColor = UIColor.black
        tField.font = UIFont.systemFont(ofSize: 18)
        //设置左视图
        let imageView = UIImageView(image: UIImage(named: "Icon-Small-40"))
        tField.leftView = imageView
        tField.leftViewMode = .always
        self.view.addSubview(tField)
        */
        
        //MARK:NotificationCenter(通知)  键盘挡住问题
        //(self监听name:～，selector收到通知后执行）
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardShouldAppear), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardShouldDisappear), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    //键盘出现通知
    @objc func keyboardShouldAppear(_ notification:Notification){
        guard let userInfo = notification.userInfo, let rect = userInfo["UIKeyboardBoundsUserInfoKey"] as? CGRect else {
            return
        }
        let height = rect.height
        self.view.frame.origin.y = -height
    }
    //键盘消失通知
    @objc func keyboardShouldDisappear(_ notification:Notification){
        self.view.frame.origin.y = 0
    }
    
    
    //MARK:UITextField 按return代理（按return键盘消失）
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    //MARK:UITextField 内容改变代理（实现输入内容的验证）
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if string.count > 0{
            //是否为数字
            let chars:[Character] = ["0","1","2","3","4","5","6","7","8","9"]
            let char = string.first!
            if !chars.contains(char){
                print("请输入数字")
                return false
            }
            //是否超过11位
            if textField.text!.count + string.count > 11{
                print("不能超过11位")
                return false
            }
        }
        return true
    }
    
}

