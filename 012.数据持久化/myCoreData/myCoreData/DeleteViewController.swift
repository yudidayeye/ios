//
//  DeleteViewController.swift
//  myCoreData
//
//  Created by student on 2019/12/5.
//  Copyright © 2019年 lijin. All rights reserved.
//

import UIKit
//0000
import CoreData

class DeleteViewController: UIViewController {

    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var detailTF: UILabel!
    
    //1111
    var appDelegate:AppDelegate!
    
    //3333
    var viewContext:NSManagedObjectContext!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //2222
        appDelegate = UIApplication.shared.delegate as? AppDelegate
        //4444
        viewContext = appDelegate.persistentContainer.viewContext
        
    }
    
    @IBAction func deleteStudent(_ sender: UIButton) {
        let name = nameTF.text
        //5555 设置要取的对象
        let fetch = NSFetchRequest<Person>(entityName: "Person")
        //6666 设置查询条件
        fetch.predicate = NSPredicate(format: "name = %@", name!)
        //7777 取出对象
        if let persons = try? viewContext.fetch(fetch){
            if persons.count == 0{
                detailTF.textColor = UIColor.red
                detailTF.text = "删除失败"
            }
            for p in persons{
                //8888 删除对象
                viewContext.delete(p)
                
                detailTF.textColor = UIColor.black
                detailTF.text = "删除成功"
            }
            //9999 保存修改
            appDelegate.saveContext()
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
