//
//  ViewController.swift
//  Project 08 - RandomGradientColorMusic
//
//  Created by 张庆杰 on 16/3/31.
//  Copyright © 2016年 ZhangQingjie. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var gradientLayer: CAGradientLayer?
    var timer: NSTimer?
    var playBtn: UIButton?
    var player: AVAudioPlayer?

    override func viewDidLoad() {
        super.viewDidLoad()

        setupGradientLayer()
        
        setupPlayBtn()
    }
    
    override func viewDidAppear(animated: Bool) {
        self.view.backgroundColor = UIColor.blueColor()
        UIApplication.sharedApplication().statusBarHidden = true
    }

    // MARK: - Private Methods

    func randomColor() -> CGColorRef {
        return UIColor(red: CGFloat(drand48()), green: CGFloat(drand48()), blue: CGFloat(drand48()), alpha: 1.0).CGColor
    }
    
    func setupGradientLayer() {
        gradientLayer = CAGradientLayer()
        gradientLayer?.frame = self.view.bounds
        gradientLayer?.startPoint = CGPointMake(0.0, 0.0)
        gradientLayer?.endPoint = CGPointMake(1.0, 1.0)
        self.view.layer.addSublayer(gradientLayer!)
    }
    
    func changeColor() {
        gradientLayer?.colors = [randomColor(), randomColor(), randomColor(), randomColor(), randomColor()]
        gradientLayer?.locations = [0.0, 0.25, 0.5, 0.75, 1.0]
    }
    
    func setupPlayBtn() {
        playBtn = UIButton(type: .Custom)
        playBtn?.frame = CGRectMake(0, 0, 150, 150)
        playBtn?.center = self.view.center
        self.view.addSubview(playBtn!)
        playBtn?.setImage(UIImage(named: "music play"), forState: .Normal)
        playBtn?.addTarget(self, action: "playMusic", forControlEvents: .TouchUpInside)
    }
    
    func playMusic() {
        if timer == nil {
            timer = NSTimer(timeInterval: 0.25, target: self, selector: "changeColor", userInfo: nil, repeats: true)
            NSRunLoop.currentRunLoop().addTimer(timer!, forMode: NSDefaultRunLoopMode)
        }
        do {
            try player = AVAudioPlayer(contentsOfURL: NSURL.fileURLWithPath(NSBundle.mainBundle().pathForResource("Ecstasy", ofType: "mp3")!))
            player?.prepareToPlay()
            player?.play()
        }
        catch let error as NSError {
            print(error)
        }
        
    }
}

