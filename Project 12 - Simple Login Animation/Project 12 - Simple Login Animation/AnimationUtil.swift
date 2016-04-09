//
//  AnimationUtil.swift
//  Project 12 - Simple Login Animation
//
//  Created by 张庆杰 on 16/4/9.
//  Copyright © 2016年 ZhangQingjie. All rights reserved.
//

import UIKit

class AnimationUtil: NSObject {
    
    class func moveAnimation(view: UIView, duration: NSTimeInterval, delay: NSTimeInterval) {
        UIView.animateWithDuration(duration, delay: delay, options: .OverrideInheritedOptions, animations: { () -> Void in
            view.transform = CGAffineTransformIdentity
            }, completion: nil)
    }

    class func maskAnimation(view: UIView, length: CGFloat, duration: NSTimeInterval, maskColor: UIColor) {
        struct Layer {
            static var layer: CAShapeLayer?
        }
        if Layer.layer == nil {
            Layer.layer = CAShapeLayer()
            Layer.layer!.path = UIBezierPath(rect: CGRectMake(0, 0, 0, view.bounds.size.height)).CGPath
            Layer.layer!.fillColor = maskColor.CGColor
            view.layer.mask = Layer.layer
        } else {
            let path = UIBezierPath(rect: CGRectMake(0, 0, length * view.bounds.size.width, view.bounds.size
                .height)).CGPath
            let animation = CABasicAnimation(keyPath: "path")
            animation.duration = 0.25
            animation.fromValue = Layer.layer?.path
            animation.toValue = path
            view.layer.addAnimation(animation, forKey: "shapeLayerPath")
            Layer.layer?.path = path
        }
    }
}
