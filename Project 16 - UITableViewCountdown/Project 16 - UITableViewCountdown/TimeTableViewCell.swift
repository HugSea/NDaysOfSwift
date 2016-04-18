//
//  TimeTableViewCell.swift
//  Project 16 - UITableViewCountdown
//
//  Created by 张庆杰 on 16/4/17.
//  Copyright © 2016年 ZhangQingjie. All rights reserved.
//

import UIKit

let NOTIFICATION_TIME_CELL = "notification_timer"

class TimeTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var countdownLabel: UILabel!
    
    var timeModel: TimeModel?
    var indexPath: NSIndexPath?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        titleLabel.font = UIFont(name: "Apple Color Emoji", size: 50)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "notificationEvent", name: NOTIFICATION_TIME_CELL, object: nil)
    }
    
    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(self, name: NOTIFICATION_TIME_CELL, object: nil)
    }
    
    func notificationEvent() {
        loadData(self.timeModel!, forIndexPath: self.indexPath!)
    }
  
    func loadData(data: TimeModel, forIndexPath indexPath:NSIndexPath) {
        self.timeModel = data
        self.indexPath = indexPath
        
        titleLabel.text = data.title
        countdownLabel.text = data.timeTransformToString(data.time!)
    }
}
