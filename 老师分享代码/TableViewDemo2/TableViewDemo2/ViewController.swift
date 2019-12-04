//
//  ViewController.swift
//  TableViewDemo2
//
//  Created by liguiyang on 2019/11/6.
//  Copyright © 2019 20191102. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UITableViewDelegate, UITableViewDataSource {
 
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var nameLabel: UITextField!
    var persons = [Person]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)

        // Do any additional setup after loading the view.
        
        let p1 = Student()
        let p2 = Student(name: "gyx", age: 18, gender: true, grade: "大二")
        let p3 = Teacher(name: "fxk", age: 44, gender: true, major: "计算机")
        let p4 = Teacher(name: "yuanding", age: 45, gender: true, major: "网络")
        persons.append(p1)
        persons.append(p2)
        persons.append(p3)
        persons.append(p4)
    }
    @IBAction func add(_ sender: Any) {
        let s = Student()
        s.name = nameLabel.text!
        persons.append(s)
        
        tableView.reloadData()
        
    }
    
    @IBAction func edit(_ sender: UIButton) {
        tableView.isEditing = !tableView.isEditing
    }
    
    
    @objc func keyboardWillShow(notification: Notification) {
        guard let userInfo = notification.userInfo, let rect = userInfo["UIKeyboardBoundsUserInfoKey"] as? CGRect else {
            return
        }
        let height = rect.height
        view.frame.origin.y = -height
    }
    @objc func keyboardWillHide(notification: Notification) {
        view.frame.origin.y = 0
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return persons.count
     }
     
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: UITableViewCell?
        let person = persons[indexPath.row]
        if let student = person as? Student {
            let studentCell = tableView.dequeueReusableCell(withIdentifier: "StudentCell") as! StudentTableViewCell
            studentCell.nameLabel.text = student.name
            studentCell.gradeLabel.text = student.grade
            cell = studentCell
        } else if let teacher = person as? Teacher {
            let teacherCell = tableView.dequeueReusableCell(withIdentifier: "TeacherCell") as! TeacherTableViewCell
            teacherCell.nameLabel.text = teacher.name
            teacherCell.majorLabel.text = teacher.major
            cell = teacherCell
        }
        return cell!
     }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        switch editingStyle {
        case .delete:
            persons.remove(at: indexPath.row)
            tableView.reloadData()
        default:
            break
        }
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        persons.insert(persons.remove(at: sourceIndexPath.row), at: destinationIndexPath.row)
    }
    
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

