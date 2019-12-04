//
//  ViewController.swift
//  SQLiteDemo
//
//  Created by liguiyang on 2019/12/4.
//  Copyright © 2019 20191102. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    
    
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var ageTF: UITextField!
    
    @IBOutlet weak var tableView: UITableView!
    
    var db: SQLiteDB!
    var users: [[String:Any]]! =  [[String:Any]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        db = SQLiteDB.shared
        if db.open() {
            let result = db.execute(sql: "create table if not exists user(uid integer primary key AUTOINCREMENT,name string,age int)")
            print("result:\(result)")
        }
        
        print(NSHomeDirectory())
        // Do any additional setup after loading the view.
    }

    @IBAction func add(_ sender: Any) {
        if let name = nameTF.text, let age = ageTF.text {
            //1. 写到sqlite数据库
            db?.execute(sql: "insert into user(name,age) values('\(name)','\(age)')")
        }
        
    }
    @IBAction func udpate(_ sender: Any) {
        if let name = nameTF.text, let age = ageTF.text {
            //2. 修改sqlite数据库
            db?.execute(sql: "update user set age = '\(age)' where name ='\(name)'")
        }

    }
    @IBAction func deleteUser(_ sender: Any) {
        if let name = nameTF.text, let age = ageTF.text {
            //2. 修改sqlite数据库
            db?.execute(sql: "delete from user where name ='\(name)'")
        }
    }
    
    @IBAction func searchUser(_ sender: Any) {
        users = db?.query(sql: "select * from user")
        for user in users {
            print("name:\(user["name"])")
            print("age:\(user["age"])")
        }
        tableView.reloadData()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        let name = users[indexPath.row]["name"] as! String
        let age = users[indexPath.row]["age"] as! Int
        cell?.textLabel?.text = name
        cell?.detailTextLabel?.text = "\(age)"
        return cell!
    }
}

