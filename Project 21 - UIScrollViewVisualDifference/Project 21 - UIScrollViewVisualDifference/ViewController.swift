//
//  ViewController.swift
//  Project 21 - UIScrollViewVisualDifference
//
//  Created by 张庆杰 on 16/5/24.
//  Copyright © 2016年 张庆杰. All rights reserved.
//

import UIKit

let viewTag = 0x11
class ViewController: UIViewController, UIScrollViewDelegate {
    
    private var scrollView: UIScrollView?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupScrollView()
    }

// MARK: - Private Methods
    
    func setupScrollView() {
        let width = self.view.frame.size.width
        let height = self.view.frame.size.height
        
        scrollView = UIScrollView(frame: self.view.bounds)
        scrollView?.delegate = self
        scrollView?.bounces = false
        scrollView?.pagingEnabled = true
        scrollView?.contentSize = CGSizeMake(width * 5.0, 0)
        view.addSubview(scrollView!)
        
        for i in 0...4 {
            let pictureView = PictureView(frame: CGRectMake(CGFloat(i) * width, 0, width, height))
            pictureView.imageView!.image = UIImage(named: "\(i + 1)")
            pictureView.tag = viewTag + i
            scrollView?.addSubview(pictureView)
        }
    }
    
// MARK: - UIScrollViewDelegate
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        let X = scrollView.contentOffset.x
        for i in 0...4 {
            let pictureView = scrollView.viewWithTag(i + viewTag) as! PictureView
            pictureView.imageView!.x = 0.8 * (X - CGFloat(i) * pictureView.width)
        }
    }
    
}

