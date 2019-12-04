//
//  ViewController.swift
//  test2_4
//
//  Created by LMQ on 2019/11/19.
//  Copyright © 2019 LMQ. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {
    
    
   
    @IBOutlet weak var tableView1: UITableView!
    @IBOutlet weak var tableView2: UITableView!
    //添加button
    @IBOutlet weak var add1: UIButton!
    @IBOutlet weak var add2: UIButton!
    //添加编辑框
    @IBOutlet weak var textFiled1: UITextField!
    @IBOutlet weak var textFiled2: UITextField!
    //显示选择cell内容
    @IBOutlet weak var selection1: UILabel!
    @IBOutlet weak var selection2: UILabel!
    
    //var list1 = [Int]()
    var list1 = ["1","2"]
    var list2 = [String]()
    
//
//    list1 = {1,2,3}
//    list2 = {"a"}
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        
        
        //notification 通知：实现自适应键盘的界面布局
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDidAppear), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDidDisappear), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardDidAppear(_ notification: Notification) {
        guard let userInfo = notification.userInfo, let rect = userInfo["UIKeyboardBoundsUserInfoKey"] as? CGRect else{
            
            return
            
        }
        
        let height = rect.height
        print("height: \(height)")
        self.view.frame.origin.y = -height
        
    }
    
    @objc func keyboardDidDisappear(_ notifiacation: Notification) {
        print("jianpan did disappear")
        self.view.frame.origin.y = 0
    }
    
    
    @objc func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView.isEqual(tableView1){
            return list1.count
        } else if tableView.isEqual(tableView2){
            return list2.count
        } else{
            print("Loding error!!!")
            return 0
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: UITableViewCell?

        
        if tableView.isEqual(self.tableView1){
            let listItem = list1[indexPath.row]
            let list1Cell = tableView.dequeueReusableCell(withIdentifier: "TableView1Cell") as! TableView1Cell
            list1Cell.Label1.text = listItem
            cell = list1Cell
            
            return cell!
        } else if tableView .isEqual(tableView2){
            let listItem = list2[indexPath.row]
                let list2Cell = tableView.dequeueReusableCell(withIdentifier: "TableView2Cell") as! TableView2Cell
                list2Cell.Label2.text = listItem
                cell = list2Cell
            return cell!
        } else{
            return UITableViewCell()
        }
    }
    
    //MARK: TableViewDelegate
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView.isEqual(tableView1){
            let content = list1[indexPath.row]
            selection1.text = "你选择了表1的\(content)"
        } else if tableView.isEqual(tableView2){
            let content = list2[indexPath.row]
            selection2.text = "你选择了表2的\(content)"
        } else{
            return
        }
        
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            if tableView.isEqual(tableView1){
                list1.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .fade)
            } else if tableView.isEqual(tableView2){
                list2.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
        }
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        if tableView.isEqual(tableView1){
            list1.insert(list1.remove(at: sourceIndexPath.row), at: destinationIndexPath.row)
        } else if tableView.isEqual(tableView2){
            list2.insert(list2.remove(at: sourceIndexPath.row), at: destinationIndexPath.row)
        }
        
    }
    
    
    //MARK: UITextFieldDeletagete
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func addList1(_ sender: Any) {
        if let content = textFiled1.text{
            list1.append(content)
        } else{
            print("list1添加内容为空！")
        }
        tableView1.reloadData()
    }
    
    
    @IBAction func addList2(_ sender: Any) {
        if let content = textFiled2.text{
            list2.append(content)
        } else{
            print("list2添加内容为空！")
        }
        tableView2.reloadData()
    }
    
}

    
    




