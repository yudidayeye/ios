//
//  MyPresentationController.swift
//  AnimationDemo
//
//  Created by liguiyang on 2016/11/17.
//  Copyright © 2016年 sicnu. All rights reserved.
//

import UIKit

class MyPresentationController: UIPresentationController {
    var dimmingView = UIView()
    
    override func presentationTransitionWillBegin() {
        dimmingView.frame = self.containerView!.bounds
        dimmingView.alpha = 0.4
        dimmingView.backgroundColor = UIColor.red
        self.containerView?.addSubview(dimmingView)
    }
    
    override func presentationTransitionDidEnd(_ completed: Bool) {
        if !completed {
            dimmingView.removeFromSuperview()
        }
        
    }
    
    override func dismissalTransitionWillBegin() {
        dimmingView.alpha = 0
    }
    
    override func dismissalTransitionDidEnd(_ completed: Bool) {
        if completed {
            dimmingView.removeFromSuperview()
        }
        
    }
    override var frameOfPresentedViewInContainerView: CGRect {
        let rect = UIScreen.main.bounds
        return CGRect(x: 50, y: 50 , width: rect.width - 100, height: rect.height - 100)
    }
    
}
