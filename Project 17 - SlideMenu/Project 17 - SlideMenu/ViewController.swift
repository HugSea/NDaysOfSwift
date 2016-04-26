//
//  ViewController.swift
//  Project 17 - SlideMenu
//
//  Created by 张庆杰 on 16/4/25.
//  Copyright © 2016年 ZhangQingjie. All rights reserved.
//

import UIKit

class ViewController: UITableViewController, ViewControllerTransitionManagerDelegate {
    
    var icons = ["a", "b", "c", "d", "e", "f"]
    let transitionManager = ViewControllerTransitionManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.title = "One";
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("HomeCell") as! HomeTableViewCell
        cell.bgImageView.image = UIImage(named: String(format: "%d", indexPath.row % 5 + 1))
        cell.iconImageView.image = UIImage(named: icons[indexPath.row % 6])
        return cell
    }
    
    func dismiss() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func unwindToHomeViewController(segue: UIStoryboardSegue) {
        let menuVc = segue.sourceViewController as! MenuTableViewController
        self.title = menuVc.currentTitle
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let menuVc = segue.destinationViewController as! MenuTableViewController
        menuVc.currentTitle = self.title!
        menuVc.transitioningDelegate = transitionManager
        transitionManager.delegate = self
    }
}

