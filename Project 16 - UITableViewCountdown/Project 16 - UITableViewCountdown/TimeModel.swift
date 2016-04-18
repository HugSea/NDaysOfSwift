//
//  TimeModel.swift
//  Project 16 - UITableViewCountdown
//
//  Created by 张庆杰 on 16/4/17.
//  Copyright © 2016年 ZhangQingjie. All rights reserved.
//

import UIKit

class TimeModel: NSObject {
    
    var title: String?
    var time: NSInteger?
    
    class func timeModelWithTitleAndTime(title: String, time: NSInteger) -> TimeModel {
        let model = TimeModel()
        model.title = title
        model.time = time
        return model
    }
    
    func timeTransformToString(time: NSInteger) -> String {
        if time <= 0 {
            return "00:00:00"
        } else {
            return String(format: "%02d:%02d:%02d", time % (3600 * 24) / 3600, time % 3600 / 60, time % 60)
        }
    }
    
    func countdown() {
        time = time! - 1
    }
}
