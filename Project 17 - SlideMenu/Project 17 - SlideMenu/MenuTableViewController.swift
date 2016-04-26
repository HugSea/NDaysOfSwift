//
//  MenuTableViewController.swift
//  Project 17 - SlideMenu
//
//  Created by 张庆杰 on 16/4/25.
//  Copyright © 2016年 ZhangQingjie. All rights reserved.
//

import UIKit

class MenuTableViewController: UITableViewController {
    
    var titles = ["One", "Two", "Three", "Four", "Five", "Six", "Seven"]
    var currentTitle = "One"
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.tableFooterView = UIView(frame: CGRectZero)
        view.backgroundColor = UIColor(red:0.109, green:0.114, blue:0.128, alpha:1)
    }

    // MARK: - Table view data source

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titles.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("MenuCell") as! MenuTableViewCell
        cell.titleLabel.text = titles[indexPath.row]
        cell.titleLabel.textColor = titles[indexPath.row] == currentTitle ? UIColor.whiteColor() : UIColor.grayColor()
        cell.backgroundColor = UIColor.clearColor()
        
        return cell
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let indexPath = tableView.indexPathForSelectedRow
        currentTitle = titles[(indexPath?.row)!]
    }
    
}
