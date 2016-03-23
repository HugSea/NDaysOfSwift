//
//  ViewController.swift
//  Project 01 - SimpleStopWatch
//
//  Created by 张庆杰 on 16/3/19.
//  Copyright © 2016年 ZhangQingjie. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var pauseBtn: UIButton!
    @IBOutlet weak var playBtn: UIButton!
    @IBOutlet weak var timeLabel: UILabel!
    var timer:NSTimer?
    var time:Float = 0.0
    var isPlaying = false

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        timeLabel.text = String(time)
    }
    
    func timingStart() {
        time += 0.1
        timeLabel.text = String(format: "%.1f", time)
    }
    
    func timingEnd() {
        timer?.invalidate()
        isPlaying = false
        playBtn.enabled = true
        pauseBtn.enabled = false
    }
    
    @IBAction func startTiming(sender: UIButton) {
        if isPlaying {
            return
        }
        timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: Selector("timingStart"), userInfo: nil, repeats: true)
        NSRunLoop.currentRunLoop().addTimer(timer!, forMode: NSDefaultRunLoopMode)
        
        isPlaying = true
        playBtn.enabled = false
        pauseBtn.enabled = true
        self.timingStart()
    }
    
    @IBAction func pauseTiming(sender: UIButton) {
        self.timingEnd()
    }
    
    @IBAction func resetTiming(sender: UIButton) {
        time = 0.0
        timeLabel.text = "0.0"
        self.timingEnd()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

