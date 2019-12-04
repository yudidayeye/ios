//
//  ViewController.swift
//  myScrollView
//
//  Created by lijin on 2019/11/14.
//  Copyright © 2019 lijin. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    @IBOutlet weak var scrollView2: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //scrollView添加图片(使其可以缩放)
        let imageView = UIImageView(frame: CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: 600, height: 400)))
        imageView.image = UIImage(named: "3")
        scrollView.addSubview(imageView)
        scrollView.contentSize = imageView.bounds.size  //重要，设置scrollView内容size，才能拖动
        scrollView.minimumZoomScale = 0.5   //设置缩小最小尺寸
        scrollView.maximumZoomScale = 2.0   //设置放大最大尺寸
        
        
        //scrollView2添加多张图片
        let total = 4
        addAllImage(total: total)
        
        //pageControl设置
        pageControl.numberOfPages = total
        pageControl.currentPage = 0
        
    }
    
    //MARK:UIScrollView代理
    //(缩放的视图)
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return scrollView.subviews.first
    }
    //(减速结束后)--设置圆点改变
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let current = scrollView2.contentOffset.x / scrollView2.bounds.width
        pageControl.currentPage = Int(current)
    }
    
    
    //点击pageControl圆点切换图片
    @IBAction func pageChage(_ sender: UIPageControl) {
        let current = pageControl.currentPage
        scrollView2.scrollRectToVisible(CGRect(x: Int(scrollView2.bounds.width) * current, y: 0, width: Int(scrollView2.bounds.width), height: Int(scrollView2.bounds.height)), animated: true)
    }
    
    //scrollView2添加4张图片
    func addAllImage(total:Int){
        for i in 1...total{
            let imageView = UIImageView(frame: CGRect(x: Int(scrollView2.bounds.width) * (i - 1), y: 0, width: Int(scrollView2.bounds.width), height: Int(scrollView2.bounds.height)))
            imageView.image = UIImage(named: "\(i)")
            scrollView2.addSubview(imageView)
        }
         scrollView2.contentSize = CGSize(width: Int(scrollView2.bounds.width) * total, height: Int(scrollView2.bounds.height))
        scrollView2.isPagingEnabled = true  //设置分页，显示整张图片
        scrollView2.showsHorizontalScrollIndicator = false  //隐藏垂直滚动条
    }
}

