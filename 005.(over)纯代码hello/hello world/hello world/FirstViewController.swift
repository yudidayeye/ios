//
//  FirstViewController.swift
//  hello world
//
//  Created by student on 2019/10/19.
//  Copyright © 2019年 lijin. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    var label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        //颜色设置
        view.backgroundColor = UIColor.yellow
        
        //label
        label = UILabel(frame: CGRect(x: 150, y: 100, width: 200, height: 20))
        label.text = "hello world"
        view.addSubview(label)
        
        //button
        let button = UIButton(frame: CGRect(x: 150, y: 200, width: 100, height: 20))
        button.setTitleColor(UIColor.black, for: .normal)
        button.setTitle("点击", for: .normal)
        view.addSubview(button)
        
        button.addTarget(self, action: #selector(FirstViewController.btnClicked), for: .touchUpInside)
        
        //picture
        let imageView = UIImageView(frame: CGRect(x: 0, y: 300, width: 400, height: 400))
        Bundle.main.url(forResource: "abc", withExtension: ".jpg")
        imageView.image = UIImage(named: "abc.jpg")
        view.addSubview(imageView)
    }
    
    @objc func btnClicked(){
        label.text = "I am clicked!!!"
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
