//
//  ViewController.swift
//  CoreDataDemo
//
//  Created by liguiyang on 2019/12/4.
//  Copyright © 2019 20191102. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var ageTF: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    var appDelegate: AppDelegate?
    var viewContext: NSManagedObjectContext!
    
    var persons: [Person]! = [Person]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        appDelegate = UIApplication.shared.delegate as? AppDelegate
        viewContext = appDelegate?.persistentContainer.viewContext
        // Do any additional setup after loading the view.
        print(NSHomeDirectory())
    }

    @IBAction func addPerson(_ sender: Any) {
        if let name = nameTF.text, let age = Int16(ageTF.text!) {
            let p = Person(context: viewContext)
            p.name = name
            p.age = age
            appDelegate?.saveContext()
        }
    }
    
    @IBAction func updatePerson(_ sender: Any) {
        if let name = nameTF.text, let age = Int16(ageTF.text!) {
            let fetch = NSFetchRequest<Person>(entityName: "Person")
            fetch.predicate = NSPredicate(format: "name = %@", name)
            if let persons = try? viewContext.fetch(fetch) {
                for p in persons {
                    p.age = age
                }
            }
            appDelegate?.saveContext()

        }
        
    }
    @IBAction func deletePerson(_ sender: Any) {
        if let name = nameTF.text {
            let fetch = NSFetchRequest<Person>(entityName: "Person")
            fetch.predicate = NSPredicate(format: "name = %@", name)
            if let persons = try? viewContext.fetch(fetch) {
                for p in persons {
                    viewContext.delete(p)
                }
            }
            appDelegate?.saveContext()
        }
    }
    
    @IBAction func searchPerson(_ sender: Any) {
        let fetch = NSFetchRequest<Person>(entityName: "Person")
        persons = try? viewContext.fetch(fetch)
        for p in persons {
            print("name:\(p.name!) age:\(p.age)")
        }
        
        tableView.reloadData()
    }
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return persons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        cell?.textLabel?.text = persons[indexPath.row].name
        cell?.detailTextLabel?.text = "\(persons[indexPath.row].age)"
        return cell!
    }
}

