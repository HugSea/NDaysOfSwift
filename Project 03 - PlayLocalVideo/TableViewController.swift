//
//  TableViewController.swift
//  Project 03 - PlayLocalVideo
//
//  Created by 张庆杰 on 16/3/21.
//  Copyright © 2016年 ZhangQingjie. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit

class TableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // 播放视频
    func playVideo() {
        let player = AVPlayer(URL: NSURL.fileURLWithPath(NSBundle.mainBundle().pathForResource("emoji zone", ofType: "mp4")!))
        let playerViewController = AVPlayerViewController()
        playerViewController.player = player
        presentViewController(playerViewController, animated: true) { () -> Void in
            player.play()
        }
        
    }

    @IBAction func playBtnClick(sender: UIButton) {
        playVideo()
    }
    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 6
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let videoCell = tableView.dequeueReusableCellWithIdentifier("VideoTableViewCell") as! VideoTableViewCell
        videoCell.backgroundImageView?.image = UIImage(named: "videoScreenshot" + String(format: "%.2d", indexPath.row + 1))
        videoCell.closurse = {(name:String) in
            print(name)
        }
        
        return videoCell
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 220
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        playVideo()
    }
}
