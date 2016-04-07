//
//  VideoBackgroundViewController.swift
//  Project 10 - VideoBackground
//
//  Created by 张庆杰 on 16/4/7.
//  Copyright © 2016年 ZhangQingjie. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

public enum VideoScaleModel {
    case Resize
    case ResizeAspect
    case ResizeAspectFill
}

public class VideoBackgroundViewController: UIViewController {
    
    // 视频播放控制器
    public var videoPlayer: AVPlayerViewController? = AVPlayerViewController()
    
    // 声音等级
    public var soundLevel: CGFloat = CGFloat(1.0)
    
    // 是否播放声音
    public var playSound: Bool = false {
        didSet {
            if playSound {
                soundLevel = 1.0
            } else {
                soundLevel = 0.0
            }
        }
    }
    
    // 播放URL
    public var videoURL: NSURL? {
        didSet {
            videoPlayer?.player = AVPlayer(URL: videoURL!)
            videoPlayer?.player?.volume = Float(soundLevel)
            videoPlayer?.player?.play()
        }
    }
    
    // 视频的透明度
    public var alpha: CGFloat = CGFloat(1.0) {
        didSet {
            videoPlayer!.view.alpha = alpha
            view.backgroundColor = UIColor.blackColor()
        }
    }
    
    // 是否循环播放视频
    public var videoShouldLoop: Bool = true {
        didSet {
            if videoShouldLoop == true {
                NSNotificationCenter.defaultCenter().addObserver(self, selector: "fromStartPlayVideo", name: AVPlayerItemDidPlayToEndTimeNotification, object: videoPlayer?.player?.currentItem)
            }
        }
    }
    
    // 从头播放视频
    func fromStartPlayVideo() {
        videoPlayer!.player?.seekToTime(kCMTimeZero)
        videoPlayer?.player?.play()
    }
    
    // 视频缩放模式
    public var videoScaleModel: VideoScaleModel = .ResizeAspectFill {
        didSet {
            switch videoScaleModel {
            case .Resize:
                videoPlayer?.videoGravity = AVLayerVideoGravityResize
            case .ResizeAspect:
                videoPlayer?.videoGravity = AVLayerVideoGravityResizeAspect
            case .ResizeAspectFill:
                videoPlayer?.videoGravity = AVLayerVideoGravityResizeAspectFill
            }
        }
    }
    
    // 视频大小
    public var videoFrame: CGRect = CGRect()

    override public func viewDidLoad() {
        super.viewDidLoad()

        videoFrame = view.bounds
        playSound = true
        alpha = 0.8
        videoShouldLoop = true
        videoScaleModel = .ResizeAspectFill
    }

    override public func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        videoPlayer?.view.frame = videoFrame
        videoPlayer?.showsPlaybackControls = false
        self.view.addSubview((videoPlayer?.view)!)
        self.view.sendSubviewToBack((videoPlayer?.view)!)
    }
    
    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
}
