//
//  SelectViewController.swift
//  myCoreData
//
//  Created by student on 2019/12/5.
//  Copyright © 2019年 lijin. All rights reserved.
//

import UIKit
//111
import CoreData

class SelectViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var choseLabel: UILabel!
    @IBOutlet weak var ageLabel: UITextField!
    
    //222
    var appDelegate:AppDelegate!
    var viewContext:NSManagedObjectContext!
    
    //444
    var persons:[Person]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //333
        appDelegate = UIApplication.shared.delegate as? AppDelegate
        viewContext = appDelegate.persistentContainer.viewContext
        
        //555.取对象们
        let fetch = NSFetchRequest<Person>(entityName: "Person")
        persons = try? self.viewContext.fetch(fetch)
        
    }
    
    //-----修改-------
    @IBAction func update(_ sender: UIButton) {
        if let name = choseLabel.text,let age = Int16(ageLabel.text!) {
            let fetch = NSFetchRequest<Person>(entityName: "Person")
            fetch.predicate = NSPredicate(format: "name = %@", name)
            let persons = try? viewContext.fetch(fetch)
            for p in persons!{
                p.age = age
            }
        }
        appDelegate.saveContext()
        tableView.reloadData()
    }
    
    //数据源
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return persons!.count
    }
    //数据源
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        //666.显示对象
        cell?.textLabel?.text = persons![indexPath.row].name
        cell?.detailTextLabel?.text = "\(persons![indexPath.row].age)"
        return cell!
    }
    
    //代理：选中时触发
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        choseLabel.text = cell?.textLabel?.text
        ageLabel.text = cell?.detailTextLabel?.text
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
