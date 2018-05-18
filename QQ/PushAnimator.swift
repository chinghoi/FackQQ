//
//  PushAnimator.swift
//  QQ
//
//  Created by chinghoi on 2018/5/16.
//  Copyright © 2018年 ChingHoi. All rights reserved.
//

import UIKit

class PushAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.3
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let formVC = transitionContext.viewController(forKey: .from)
        let toVC = transitionContext.viewController(forKey: .to)
        
        let containerView = transitionContext.containerView
        containerView.addSubview((formVC?.view)!)
        containerView.addSubview((toVC?.view)!)
        print("-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-")
        print(toVC?.view.frame.origin.x as Any)
        
        UIView.animate(withDuration: 0.3,
                       animations: {
        },completion: { (finished) in
            transitionContext.completeTransition(true)
        })
    }
}
