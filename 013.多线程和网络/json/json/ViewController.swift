//
//  ViewController.swift
//  json
//
//  Created by student on 2019/12/12.
//  Copyright © 2019 2017110517. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,UITableViewDataSource{
    let cityArr:[[String:String]] = [["city":"成都","code":"101270101"],["city":"德阳","code":"101272001"],["city":"自贡","code":"101270301"],["city":"绵阳","code":"101270401"],["city":"遂宁","code":"101270701"],["city":"德阳","code":"101272001"],["city":"泸州","code":"101271001"]]

    @IBOutlet weak var myTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cityArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        cell?.textLabel?.text = cityArr[indexPath.row]["city"]
        cell?.detailTextLabel?.text = cityArr[indexPath.row]["code"]
        return cell!
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showlist"{
            let dvc = segue.destination as! CityViewController
            if let indexPath =  myTableView.indexPath(for: sender as! UITableViewCell){
                
                if let cityURL = URL(string: "http://t.weather.sojson.com/api/weather/city/\(cityArr[indexPath.row]["code"]!)" ){
                    dvc.cityURL = cityURL
                    
                }
                
            }
            
            
            
        }
    }
    

}

