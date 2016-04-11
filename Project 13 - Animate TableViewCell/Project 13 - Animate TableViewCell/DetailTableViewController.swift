//
//  DetailTableViewController.swift
//  Project 13 - Animate TableViewCell
//
//  Created by 张庆杰 on 16/4/11.
//  Copyright © 2016年 ZhangQingjie. All rights reserved.
//

import UIKit

class DetailTableViewController: UITableViewController {
    
    var dataSource = [
        "Project 01 - SimpleStopWatch", "Project 02 - CustomFont", "Project 03 - PlayLocalVideo", "Project 04 - SnapChatMenu", "Project 05 - CarouselEffect", "Project 06 - FindMyLocation"
    ]
        
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Detail"
        tableView.registerClass(HomePageTableViewCell.self, forCellReuseIdentifier: identifier)
        tableView.backgroundColor = UIColor.blackColor()
        tableView.tableFooterView = UIView(frame: CGRectZero)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        tableViewCellAnimation()
    }

    // MARK: - Table view data source

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(identifier, forIndexPath: indexPath)
        cell.textLabel?.text = dataSource[indexPath.row]
        cell.textLabel?.textColor = UIColor.whiteColor()
        
        return cell
    }
    
    override func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        cell.backgroundColor = colorWithIndex(indexPath.row)
    }
    
    // MARK: - Private Methods
    
    func colorWithIndex(index: Int) -> UIColor {
        let color = CGFloat(index) / CGFloat(dataSource.count) * 0.8
        return UIColor(red: 0.0, green: color, blue: 1.0, alpha: 1.0)
    }
    
    func tableViewCellAnimation() {
        tableView.reloadData()
        
        let cells = tableView.visibleCells
        let width = UIScreen.mainScreen().bounds.size.width
        
        for cell in cells {
            cell.transform = CGAffineTransformMakeTranslation(width, 0)
        }
        
        var index = 0.0
        for cell in cells {
            UIView.animateWithDuration(1.5, delay: index * 0.05, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: [], animations: { () -> Void in
                cell.transform = CGAffineTransformIdentity
                }, completion: nil)
            index += 1.0
        }
    }
}
