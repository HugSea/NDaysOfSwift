//
//  TimeTableViewController.swift
//  Project 16 - UITableViewCountdown
//
//  Created by 张庆杰 on 16/4/17.
//  Copyright © 2016年 ZhangQingjie. All rights reserved.
//

import UIKit

class TimeTableViewController: UITableViewController {
    
    var dataSource = [
        TimeModel.timeModelWithTitleAndTime("🍉", time: 300),
        TimeModel.timeModelWithTitleAndTime("🍎", time: 3000),
        TimeModel.timeModelWithTitleAndTime("🍊", time: 432432),
        TimeModel.timeModelWithTitleAndTime("🍌", time: 32432),
        TimeModel.timeModelWithTitleAndTime("🍍", time: 83),
        TimeModel.timeModelWithTitleAndTime("🍈", time: 908),
        TimeModel.timeModelWithTitleAndTime("🍇", time: 789),
        TimeModel.timeModelWithTitleAndTime("🍑", time: 1234567),
        TimeModel.timeModelWithTitleAndTime("🍒", time: 2000000),
        TimeModel.timeModelWithTitleAndTime("🍓", time: 2016),
        TimeModel.timeModelWithTitleAndTime("🍟", time: 999)
    ]
    var timer: NSTimer?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.registerNib(UINib(nibName: String(TimeTableViewCell), bundle: nil), forCellReuseIdentifier: "TimeCell")
        
        setupTimer()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        tableView.tableFooterView = UIView(frame: CGRectZero)
    }

    // MARK: - UITableViewDataSource/Delegate
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("TimeCell") as! TimeTableViewCell
        
        let model = dataSource[indexPath.row] 
        cell.loadData(model, forIndexPath: indexPath)
        
        return cell
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 100
    }
    
    // MARK: - Private Methods
    
    func setupTimer() {
        timer = NSTimer(timeInterval: 1.0, target: self, selector: "timerEvent", userInfo: nil, repeats: true)
        NSRunLoop.currentRunLoop().addTimer(timer!, forMode: NSRunLoopCommonModes)
    }
    
    func timerEvent() {
        for model in dataSource {
            model.countdown()
        }
        NSNotificationCenter.defaultCenter().postNotificationName(NOTIFICATION_TIME_CELL, object: nil)
    }
}
