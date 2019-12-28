//
//  ViewController.swift
//  myTableView
//
//  Created by lijin on 2019/11/12.
//  Copyright © 2019 lijin. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate {
    @IBOutlet weak var myTV: UITableView!
    @IBOutlet weak var messageLabel: UILabel!
    
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var ageTF: UITextField!
    @IBOutlet weak var classTF: UITextField!
    @IBOutlet weak var genderSC: UISegmentedControl!
    
    
    
    var persons:[Person] = [Person]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        //设置label可以换行
        messageLabel.numberOfLines = 4
        messageLabel.lineBreakMode = .byWordWrapping
        
        let s1 = Student(name: "礼金", age: 10, gender: false, stuClass: "1班")
        let s2 = Student(name: "刘山", age: 22, gender: false, stuClass: "2班")
        let s3 = Student(name: "张样都", age: 20, gender: true, stuClass: "12班")
        
        let t1 = Teacher(name: "王库度", age: 42, gender: true, major: "数学")
        let t2 = Teacher(name: "秦二等", age: 19, gender: true, major: "语文")
        let t3 = Teacher(name: "广午餐", age: 43, gender: true, major: "英语")
        let t4 = Teacher(name: "柳牡丹", age: 21, gender: true, major: "历史")
        let t5 = Teacher(name: "钧欧德", age: 54, gender: true, major: "政治")
        
        persons = [s1,s2,s3,t1,t2,t3,t4,t5]
        
        //按照age排序
        persons.sort(by:{
            $0.age < $1.age
        })
        
        
        
        //MARK:通知(键盘出现，消失遮挡)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardShouldAppear), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardShouldDisappear), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    //键盘出现，视图上移
    @objc func keyboardShouldAppear(_ notification:Notification){
        let rect = notification.userInfo!["UIKeyboardBoundsUserInfoKey"] as! CGRect
        let height = rect.size.height
        self.view.frame.origin.y = -height
    }
    //键盘消失，视图下移
    @objc func keyboardShouldDisappear(){
        self.view.frame.origin.y = 0
    }
    
    
    
    //MARK:UITableViewDataSource数据源
    //行数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return persons.count
    }
    //cell的内容
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell?
        let person = persons[indexPath.row]
        if let student = person as? Student{
            let studentCell = tableView.dequeueReusableCell(withIdentifier: "green") as! StudentTableViewCell
            studentCell.nameLabel.text = student.name
            studentCell.ageLabel.text = String(student.age)
            studentCell.classLabel.text = student.stuClass
            if student.gender{
                studentCell.genderImageView.image = UIImage(named: "xingbienan")
            }else{
                studentCell.genderImageView.image = UIImage(named: "xingbienv")
            }
            cell = studentCell
        }else {
            let teacher = person as? Teacher
            let teacherCell = tableView.dequeueReusableCell(withIdentifier: "pink") as! TeacherTableViewCell
            teacherCell.nameLabel.text = teacher!.name
            teacherCell.ageLabel.text = String(teacher!.age)
            teacherCell.majorLabel.text = teacher?.major
            if teacher!.gender{
                teacherCell.genderImageView.image = UIImage(named: "xingbienan")
            }else{
                teacherCell.genderImageView.image = UIImage(named: "xingbienv")
            }
            cell = teacherCell
        }
        return cell!
    }
    
    
    
    //MARK:UITableViewDelegate代理
    //设置行高
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    //选中时：显示选中的信息
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var message:String = " "
        if let stucell = tableView.cellForRow(at: indexPath) as? StudentTableViewCell{
            let name = stucell.nameLabel.text
            let age = stucell.ageLabel.text
            let stuClass = stucell.classLabel.text
            message = "学生\n姓名：\(name!)\n年龄：\(age!)\n班级：\(stuClass!)"
            
        }else{
            let teacell = tableView.cellForRow(at: indexPath) as? TeacherTableViewCell
            let name = teacell!.nameLabel.text
            let age = teacell!.ageLabel.text
            let major = teacell!.majorLabel.text
            message = "老师\n姓名：\(name!)\n年龄：\(age!)\n教学科目：\(major!)"
        }
        messageLabel.text = message
    }
    //设置cell的编辑模式
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    //设置可以编辑的行
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    //设置删除操作
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            persons.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    //设置可以移动的行
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    //设置移动操作
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        persons.insert(persons.remove(at: sourceIndexPath.row), at: destinationIndexPath.row)
    }
    
    
    
    
    //MARK:UITextField代理
    //按return键盘消失
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
    
    
    //MARK:按钮触发事件
    //添加学生
    @IBAction func addStudent(_ sender: Any) {
        guard let name = nameTF.text,let ageString = ageTF.text,let age = Int(ageString),let stuClass = classTF.text else{
            return
        }
        let gender = genderSC.selectedSegmentIndex
        let theStudent = Student(name: name, age: age, gender: gender == 0 ? true : false, stuClass: stuClass
        )
        persons.append(theStudent)
        myTV.reloadData()
    }
    //编辑学生
    @IBAction func editStudent(_ sender: UIButton) {
        //将UITableView设置为编辑模式
        //myTV.isEditing = true
        myTV.setEditing(!myTV.isEditing, animated: true)
        sender.setTitle(myTV.isEditing ? "正在编辑" : "编辑学生", for: .normal)
        
    }
    
    
}

