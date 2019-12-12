//
//  CityViewController.swift
//  json
//
//  Created by student on 2019/12/12.
//  Copyright © 2019 2017110517. All rights reserved.
//

import UIKit
import Alamofire

class CityViewController: UIViewController {

    var cityURL:URL?
    var jsonDic:[String:Any]!
    var jsonArr: [[String:Any]]!
    @IBOutlet weak var datadetail: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = URL(string: "http://ip.taobao.com/service/getIpInfo.php?ip=63.223.108.42")!
       URLSession.shared.dataTask(with: url) { (data, response, error) in
        self.jsonDic = try? (JSONSerialization.jsonObject(with: data!, options: .fragmentsAllowed) as! [String:Any])
           DispatchQueue.main.async {
            for dic in self.jsonDic {
                   print(dic)
               }
           }
       }.resume()
        // Do any additional setup after loading the view.
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
