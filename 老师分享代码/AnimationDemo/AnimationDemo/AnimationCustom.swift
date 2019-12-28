//
//  AnimationCustom.swift
//  AnimationDemo
//
//  Created by liguiyang on 2016/11/17.
//  Copyright © 2016年 sicnu. All rights reserved.
//

import UIKit

class AnimationCustom:NSObject, UIViewControllerAnimatedTransitioning {
    var isPresenting = false
    init(isPresenting: Bool) {
        super.init()
        self.isPresenting = isPresenting
    }
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 1.0
    }
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let container = transitionContext.containerView

        if isPresenting {
            let presenetedVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to)!
            let presentedView = transitionContext.view(forKey: UITransitionContextViewKey.to)!

            presentedView.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
            presentedView.backgroundColor = UIColor.green

            
//            presentedView.frame.origin.y = container.bounds.height
            
            container.addSubview(presentedView)
            
            UIView.animate(withDuration: transitionDuration(using: transitionContext), delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0, options: .allowUserInteraction, animations: { 
                presentedView.frame = transitionContext.finalFrame(for: presenetedVC)
                }, completion: { (completed: Bool) in
                    transitionContext.completeTransition(completed)
                    
            })
        } else {
            let presentedView = transitionContext.view(forKey: UITransitionContextViewKey.from)!

            UIView.animate(withDuration: 0.2, animations: {
                presentedView.frame = CGRect(x: container.bounds.width, y: container.bounds.height, width: 0, height: 0)

                }, completion:  { (completed: Bool) in
                    transitionContext.completeTransition(completed)
                })
//            UIView.animate(withDuration: transitionDuration(using: transitionContext), delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0, options: .allowUserInteraction, animations: {
//                presentedView.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
//                }, completion: { (completed: Bool) in
//                    transitionContext.completeTransition(completed)
//            })
 
            
            
        }
    }
}
