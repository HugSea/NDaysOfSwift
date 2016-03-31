//
//  ViewController.swift
//  Project 07 - PullToRefresh
//
//  Created by 张庆杰 on 16/3/31.
//  Copyright © 2016年 ZhangQingjie. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let dataSource = ["p1.jpg", "p2.jpg", "p3.jpg", "p4.jpg", "p5.jpg"]
    let newDataSource = ["p1.jpg", "p2.jpg", "p3.jpg", "p4.jpg", "p5.jpg", "p6.jpg", "p7.jpg", "p8.jpg", "p9.jpg", "p10.jpg"]
    var models: [String]?
    
    var tableView: UITableView?
    var tableViewController = UITableViewController(style: .Plain)
    var refreshControl = UIRefreshControl()
    
    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        models = dataSource
        
        refreshControl.addTarget(self, action: "refreshTableView", forControlEvents: .ValueChanged)
        refreshControl.attributedTitle = NSAttributedString(string: "Last update on \(NSDate())", attributes: [NSForegroundColorAttributeName : UIColor.blackColor()])
        
        tableView = tableViewController.tableView
        tableView?.delegate = self
        tableView?.dataSource = self
        tableView?.rowHeight = 220
        tableView?.separatorStyle = .None
        tableView?.tableFooterView = UIView(frame: CGRectZero)
        tableViewController.refreshControl = refreshControl
        tableView?.registerNib(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: "CustomCell")
        
        tableView?.contentInset = UIEdgeInsetsMake(44, 0, 0, 0)
        tableView?.setContentOffset(CGPointMake(0, -44), animated: true)
        self.view.addSubview(tableView!)
    }

    // MARK: - UITableViewDataSource/Delegate

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models!.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("CustomCell") as! CustomTableViewCell
        cell.imageName = models![indexPath.row]
        cell.titleLabel.text = "Number: " + String(format: "%02d", indexPath.row)
        
        return cell
    }
    
    // MARK: - Private Methods
    
    func refreshTableView() {
        models = newDataSource
        tableView?.reloadData()
        refreshControl.endRefreshing()
    }
}

