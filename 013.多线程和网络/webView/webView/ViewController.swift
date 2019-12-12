//
//  ViewController.swift
//  webView
//
//  Created by student on 2019/12/11.
//  Copyright © 2019 2017110517. All rights reserved.
//



import UIKit
//111111
import WebKit

class ViewController: UIViewController,WKNavigationDelegate {

    @IBOutlet weak var mywebView: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //22222222 访问网络资源一定要设置“App Transport Security Settings-----Allow Arbitary Loads-----YES”
        if let url = URL(string: "http://baidu.com"){
            mywebView.load(URLRequest(url: url))
        }
        
        //设置代理
        mywebView.navigationDelegate = self
        
    }
    //实现代理，装载完成方法
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        self.title = "hello baidu"
    }

}

