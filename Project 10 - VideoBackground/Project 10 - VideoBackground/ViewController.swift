//
//  ViewController.swift
//  Project 10 - VideoBackground
//
//  Created by 张庆杰 on 16/4/7.
//  Copyright © 2016年 ZhangQingjie. All rights reserved.
//

import UIKit

class ViewController: VideoBackgroundViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        UIApplication.sharedApplication().statusBarHidden = true
        
        videoURL = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("spotifyVideo", ofType: "mp4")!)
    }
}

