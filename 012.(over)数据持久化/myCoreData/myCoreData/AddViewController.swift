//
//  AddViewController.swift
//  myCoreData
//
//  Created by student on 2019/12/5.
//  Copyright © 2019年 lijin. All rights reserved.
//

import UIKit

//000.引入CoreData类
import CoreData

class AddViewController: UIViewController {

    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var ageTF: UITextField!
    @IBOutlet weak var messageTF: UILabel!
    
    //111.上下文
    var appDelegate: AppDelegate!
    
    var viewContext: NSManagedObjectContext!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //222.获取上下文
        appDelegate = UIApplication.shared.delegate as? AppDelegate
        viewContext = appDelegate.persistentContainer.viewContext
        
    }
    
    
    //添加
    @IBAction func add(_ sender: UIButton) {
        if let name = nameTF.text,let age = ageTF?.text{
            
            //333.创建对象
            let person = Person(context: viewContext)
           
            //444.属性赋值
            person.name = name
            if let ageint = Int16(age){
                person.age = ageint
            
                //555.保存修改
                appDelegate.saveContext()
                
            }else{
                messageTF.textColor = UIColor.red
                messageTF.text = "年龄输入不正确"
            }
            messageTF.textColor = UIColor.black
            messageTF.text = "添加成功"
        }else{
            messageTF.textColor = UIColor.red
            messageTF.text = "添加失败"
        }
        
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
