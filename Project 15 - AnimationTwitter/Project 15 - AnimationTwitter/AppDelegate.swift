//
//  AppDelegate.swift
//  Project 15 - AnimationTwitter
//
//  Created by 张庆杰 on 16/4/13.
//  Copyright © 2016年 ZhangQingjie. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
        self.window!.backgroundColor = UIColor(red:0.117, green:0.631, blue:0.949, alpha:1)
        
        self.window?.rootViewController = ViewController()
        self.window?.makeKeyAndVisible()
        application.statusBarHidden = true
        
        return true
    }

}

