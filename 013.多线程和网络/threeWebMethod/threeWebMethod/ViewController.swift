//
//  ViewController.swift
//  threeWebMethod
//
//  Created by student on 2019/12/12.
//  Copyright © 2019 2017110517. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    @IBOutlet weak var dispatchIV: UIImageView!
    @IBOutlet weak var urlsessionIV: UIImageView!
    @IBOutlet weak var alamofireIV: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    //访问网络之前一定要设置 -- App Transport Security Setting
    
    
    //01.DispatchQueue方式访问网络
    @IBAction func loadWithDispatchQueue(_ sender: UIButton) {
        let url = URL(string: "http://h.hiphotos.baidu.com/image/pic/item/b3b7d0a20cf431ad7427dfad4136acaf2fdd98a9.jpg")
        DispatchQueue.global().async {
            let data = try? Data(contentsOf: url!)
            DispatchQueue.main.async {
                self.dispatchIV.image = UIImage(data: data!)
            }
        }
    }
    
    //02.URLSession访问网络
    @IBAction func loadWithURLSession(_ sender: UIButton) {
        let url = URL(string: "http://e.hiphotos.baidu.com/image/pic/item/359b033b5bb5c9eac1754f45df39b6003bf3b396.jpg")
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            DispatchQueue.main.async {
                self.urlsessionIV.image = UIImage(data:data!)
            }
        }.resume()
    }
    
    //03.Alamofire访问网络
    //导入Alamofire相关文件：文件夹拷贝进项目finder，将工程文件拖到xcode中，添加framework配置
    //import Alamofire
    @IBAction func loadWithAlamofire(_ sender: UIButton) {
        let url = URL(string: "http://img4.imgtn.bdimg.com/it/u=1876583250,2930334260&fm=26&gp=0.jpg")
        AF.request(url!).response { (response) in
            self.alamofireIV.image = UIImage(data: response.data!)
        }
        
    }
    
}

