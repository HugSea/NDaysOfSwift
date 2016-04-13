//
//  ViewController.swift
//  Project 15 - AnimationTwitter
//
//  Created by 张庆杰 on 16/4/13.
//  Copyright © 2016年 ZhangQingjie. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var imageView: UIImageView?

    override func viewDidLoad() {
        super.viewDidLoad()

        imageView = UIImageView(frame: (self.view?.bounds)!)
        imageView!.image = UIImage(named: "twitterscreen")
        self.view?.addSubview(imageView!)
        // mask and animation
        maskAndAnimation()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func maskAndAnimation() {
        // mask
        let mask = CALayer()
        mask.contents = UIImage(named: "TwitterLogo_white")?.CGImage
        mask.anchorPoint = CGPointMake(0.5, 0.5)
        mask.bounds = CGRectMake(0, 0, 100, 100)
        mask.position = CGPointMake(imageView!.frame.size.width / 2.0, imageView!.frame.size.height / 2.0)
        imageView!.layer.mask = mask
        
        // animation
        let keyAnimation = CAKeyframeAnimation(keyPath: "bounds")
        keyAnimation.duration = 1.2
        keyAnimation.beginTime = CACurrentMediaTime() + 0.5
        keyAnimation.values = [NSValue(CGRect: mask.bounds), NSValue(CGRect: CGRectMake(0, 0, 90, 90)), NSValue(CGRect: CGRectMake(0, 0, 3000, 3000))]
        keyAnimation.keyTimes = [0, 0.3, 1.0]
        keyAnimation.timingFunctions = [CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut), CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)]
        keyAnimation.removedOnCompletion = true
        keyAnimation.fillMode = kCAFillModeRemoved
        keyAnimation.delegate = self
        mask.addAnimation(keyAnimation, forKey: "bounds")
    }
    
    override func animationDidStart(anim: CAAnimation) {
        let delayTime = dispatch_time(DISPATCH_TIME_NOW, Int64(1 * NSEC_PER_SEC))
        dispatch_after(delayTime, dispatch_get_main_queue()) { () -> Void in
            self.imageView?.layer.mask = nil
        }
    }
    
    override func animationDidStop(anim: CAAnimation, finished flag: Bool) {
//        有闪屏现象
//        imageView!.layer.mask = nil
    }
}

