//
//  BlueViewController.swift
//  myNavigationController
//
//  Created by student on 2019/11/28.
//  Copyright © 2019 2017110517. All rights reserved.
//

import UIKit

//33333.定义协议（自定协议反向传参）
protocol ParamTransDelegate {
    func trans(mess:String)
}

//333333.继承协议（自定协议反向传参）
class BlueViewController: UIViewController,ParamTransDelegate {
    
    
    //1111.自定义一个变量，接收上一个页面的参数
    var mytitle:String?
    
    //3333.自定义一个变量，接收后一个页面的参数（自定协议反向传参）
    var tranMess:String?
    
    //44444.自定义一个类保存参数，接收后一个页面的参数（自定类反向传参）
    var secondParam:SecondParam = SecondParam(param: "")
    
    
    @IBOutlet weak var tranTF: UITextField!
    
    @IBOutlet weak var tran2TF: UITextField!
    //33333.实现协议方法（自定协议反向传参）
    func trans(mess: String) {
        self.tranMess = mess
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("second view DidLoad!")
        
        
        //1111.修改title
        self.title = mytitle
    }
    
    //viewWillAppear页面将要显示时调用
    override func viewWillAppear(_ animated: Bool) {
        //22222.获取参数，使用参数(全局反向传参)
        let appDG = UIApplication.shared.delegate as! AppDelegate
        self.title = appDG.secondTitle
        
        //33333.使用得到的参数（自定协议反向传参）
        self.tranTF.text = tranMess
        
        //44444.使用得到的参数（自定类反向传参）
        self.tran2TF.text = secondParam.param
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "showThird"{
            let vc = segue.destination as! PurpleViewController
            //33333.将代理传给下个页面（自定协议反向传参）
            vc.delegate = self
            
            //44444.将类的对象传给下一页面【传的是引用】（自定类反向传参）
            vc.secondParam = self.secondParam
        }
    }
    
    


}
