//
//  ClearTableViewController.swift
//  Project 11 - ClearTableViewCell
//
//  Created by 张庆杰 on 16/4/8.
//  Copyright © 2016年 ZhangQingjie. All rights reserved.
//

import UIKit

class ClearTableViewController: UITableViewController {
    
    var dataSource = ["Read 3 article on Medium", "Cleanup bedroom", "Go for a run", "Hit the gym", "Build another swift project", "Movement training", "Fix the layout problem of a client project", "Write the experience of #30daysSwift", "Inbox Zero", "Booking the ticket to Chengdu", "Test the Adobe Project Comet", "Hop on a call to mom"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.blackColor()
    }

    // MARK: - UITableViewDataSource/Delegate
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ClearTableViewCell", forIndexPath: indexPath) as? ClearTableViewCell
        cell?.textLabel?.text = dataSource[indexPath.row]
        cell?.textLabel?.backgroundColor = UIColor.clearColor()
        cell?.textLabel?.textColor = UIColor.whiteColor()
        
        return cell!
    }
    
    override func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        cell.backgroundColor = colorWithIndex(indexPath.row)
    }
    
    func colorWithIndex(index: Int) -> UIColor {
        let color = CGFloat(index) / CGFloat(dataSource.count - 1) * 0.8
        return UIColor(red: 1.0, green: color, blue: 0.0, alpha: 1.0)
    }
}
