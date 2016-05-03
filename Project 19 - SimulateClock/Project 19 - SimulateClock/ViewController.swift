//
//  ViewController.swift
//  Project 19 - SimulateClock
//
//  Created by 张庆杰 on 16/4/29.
//  Copyright © 2016年 ZhangQingjie. All rights reserved.
//

import UIKit

let ONE_SEC = M_PI * 2 / 60.0
let ONE_MIN = M_PI * 2 / 3600.0
let ONE_HOUR = M_PI * 2 / 3600.0 / 12.0

class ViewController: UIViewController {
    
    private lazy var bgView: UIView = {
        let bgView = UIView(frame: CGRectMake(0, 0, 300, 300))
        bgView.center = self.view.center
        bgView.layer.cornerRadius = 150
        bgView.clipsToBounds = true
        bgView.layer.borderColor = UIColor.blackColor().CGColor
        bgView.layer.borderWidth = 1
        return bgView
    }()
    
    private lazy var timeLabel: UILabel = {
        let timeLabel = UILabel(frame: CGRectMake(0, CGRectGetMaxY(self.bgView.frame) + 15, self.view.frame.size.width, 50))
        timeLabel.textAlignment = .Center
        timeLabel.font = UIFont(name: "Avenir Next", size: 30)
        return timeLabel
    }()
    
    private lazy var secHand: UIImageView = {
        let width = self.bgView.bounds.size.width
        let secWidth: CGFloat = 250
        let secHandView = UIImageView(frame: CGRectMake((width - secWidth) * 0.5, (width - secWidth) * 0.5, secWidth, secWidth))
        secHandView.image = UIImage(named: "sec")
        return secHandView
    }()
    
    private lazy var minHand: UIImageView = {
        let width = self.bgView.bounds.size.width
        let minWidth: CGFloat = 250
        let minHandView = UIImageView(frame: CGRectMake((width - minWidth) * 0.5, (width - minWidth) * 0.5, minWidth, minWidth))
        minHandView.image = UIImage(named: "min")
        return minHandView
    }()
    
    private lazy var hourHand: UIImageView = {
        let width = self.bgView.bounds.size.width
        let hourWidth: CGFloat = 250
        let hourHandView = UIImageView(frame: CGRectMake((width - hourWidth) * 0.5, (width - hourWidth) * 0.5, hourWidth, hourWidth))
        hourHandView.image = UIImage(named: "hour")
        return hourHandView
    }()
    
    private var timer: NSTimer?
    
    var currentSec: CGFloat?
    var currentMin: CGFloat?
    var currentHour: CGFloat?
    
    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(self.bgView)
        self.view.addSubview(self.timeLabel)
        self.bgView.addSubview(self.hourHand)
        self.bgView.addSubview(self.minHand)
        self.bgView.addSubview(self.secHand)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        // Timer
        self.timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: #selector(ViewController.timeRunningAction), userInfo: nil, repeats: true)
        NSRunLoop.currentRunLoop().addTimer(self.timer!, forMode: NSDefaultRunLoopMode)
        
        setupCurrentTime()
        setupClockHand()
    }

    // MARK: - Private Methods
    
    func setupCurrentTime() {
        let dfm = NSDateFormatter()
        dfm.dateFormat = "hh:mm:ss"
        let timeStr = dfm.stringFromDate(NSDate())
        let timeArr = timeStr.componentsSeparatedByString(":")
        // 获取时分秒
        self.currentHour = CGFloat((timeArr[0] as NSString).floatValue)
        self.currentMin = CGFloat((timeArr[1] as NSString).floatValue)
        self.currentSec = CGFloat((timeArr[2] as NSString).floatValue)
        
        self.secHand.layer.transform = CATransform3DRotate(self.secHand.layer.transform, CGFloat(ONE_SEC) * self.currentSec!, 0, 0, 1)
        self.minHand.layer.transform = CATransform3DRotate(self.minHand.layer.transform, CGFloat(ONE_MIN) * (self.currentMin! * 60.0 + self.currentSec!), 0, 0, 1)
        self.hourHand.layer.transform = CATransform3DRotate(self.hourHand.layer.transform, CGFloat(ONE_HOUR) * (self.currentHour! * 60.0 * 60.0 + self.currentMin! * 60.0 + self.currentSec!), 0, 0, 1)
    }
    
    func timeRunningAction() {
        // 绕z轴旋转
        self.secHand.layer.transform = CATransform3DRotate(self.secHand.layer.transform, CGFloat(ONE_SEC), 0, 0, 1)
        self.minHand.layer.transform = CATransform3DRotate(self.minHand.layer.transform, CGFloat(ONE_MIN), 0, 0, 1)
        self.hourHand.layer.transform = CATransform3DRotate(self.hourHand.layer.transform, CGFloat(ONE_HOUR), 0, 0, 1)
        
        let dfm = NSDateFormatter()
        dfm.dateFormat = "hh:mm:ss"
        self.timeLabel.text = dfm.stringFromDate(NSDate())
    }
    
    private func setupClockHand() {
        
    }
}

