//
//  UIView+Frame.swift
//  Project 21 - UIScrollViewVisualDifference
//
//  Created by 张庆杰 on 16/5/24.
//  Copyright © 2016年 张庆杰. All rights reserved.
//

import UIKit

extension UIView {
    /**
     添加点击事件
     
     - parameter target: 对象
     - parameter action: 动作
     */
    public func viewAddTarget(target : AnyObject,action : Selector) {
        
        let tap = UITapGestureRecognizer(target: target, action: action)
        self.userInteractionEnabled = true
        self.addGestureRecognizer(tap)
    }
    
    public var x : CGFloat {
        get {
            return self.frame.origin.x
        }
        set {
            var frame = self.frame
            frame.origin.x = newValue
            self.frame = frame
        }
    }
    
    public var y : CGFloat {
        get {
            return self.frame.origin.y
        }
        
        set {
            var frame = self.frame
            frame.origin.y = newValue
            self.frame = frame
        }
    }
    
    public var width : CGFloat {
        get {
            return self.frame.size.width
        }
        
        set {
            var frame = self.frame
            frame.size.width = newValue
            self.frame = frame
        }
    }
    
    public var height : CGFloat {
        get {
            return self.frame.size.height
        }
        
        set {
            var frame = self.frame
            frame.size.height = newValue
            self.frame = frame
        }
    }
    
    public var size : CGSize {
        get {
            return self.frame.size
        }
        
        set {
            var frame = self.frame
            frame.size = newValue
            self.frame = frame
        }
    }
    
    public var origin : CGPoint {
        get {
            return self.frame.origin
        }
        
        set {
            var frame = self.frame
            frame.origin = newValue
            self.frame = frame
        }
    }
}