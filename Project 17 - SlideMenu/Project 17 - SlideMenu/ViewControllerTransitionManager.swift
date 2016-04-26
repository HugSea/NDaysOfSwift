//
//  ViewControllerTransitionManager.swift
//  Project 17 - SlideMenu
//
//  Created by 张庆杰 on 16/4/26.
//  Copyright © 2016年 ZhangQingjie. All rights reserved.
//

import UIKit

@objc protocol ViewControllerTransitionManagerDelegate {
    func dismiss()
}

class ViewControllerTransitionManager: NSObject, UIViewControllerAnimatedTransitioning, UIViewControllerTransitioningDelegate {
    
    var duration = 0.5
    var presenting = false
    var snapshotView: UIView? {
        didSet {
            if let _delegate = delegate {
                let tap = UITapGestureRecognizer(target: _delegate, action: "dismiss")
                snapshotView?.addGestureRecognizer(tap)
            }
        }
    }
    var delegate: ViewControllerTransitionManagerDelegate?

    // MARK: - UIViewControllerAnimatedTransitioning
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return self.duration;
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        let fromView = transitionContext.viewForKey(UITransitionContextFromViewKey)!
        let toView = transitionContext.viewForKey(UITransitionContextToViewKey)!
        // 进行View动画的容器
        let container = transitionContext.containerView()
        
        let moveUp = CGAffineTransformMakeTranslation(0, -50)
        let moveDown = CGAffineTransformMakeTranslation(0, UIScreen.mainScreen().bounds.size.height - 150)
        
        if self.presenting {
            toView.transform = moveUp
            snapshotView = fromView.snapshotViewAfterScreenUpdates(true)
            // 此处要注意添加的顺序
            container?.addSubview(toView)
            container?.addSubview(snapshotView!)
        }
        
        UIView.animateWithDuration(self.duration, delay: 0.0, usingSpringWithDamping: 0.9, initialSpringVelocity: 0.3, options: [], animations: { () -> Void in
            if self.presenting {
                toView.transform = CGAffineTransformIdentity
                self.snapshotView?.transform = moveDown
            } else {
                toView.transform = CGAffineTransformIdentity;
                self.snapshotView!.transform = CGAffineTransformIdentity;
            }
            
            }, completion: { finished in
                transitionContext.completeTransition(true)
                if !self.presenting {
                    container?.subviews.forEach{$0.removeFromSuperview()}
                }
            })
    }
    
    // MARK: - UIViewControllerTransitioningDelegate
    
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        self.presenting = true
        return self
    }
    
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        self.presenting = false
        return self
    }
}
