//
//  ViewController.swift
//  Project 04 - SnapChatMenu
//
//  Created by 张庆杰 on 16/3/24.
//  Copyright © 2016年 ZhangQingjie. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UIApplication.sharedApplication().statusBarHidden = true
        // Do any additional setup after loading the view, typically from a nib.
        let leftVC: LeftViewController = LeftViewController(nibName: String(LeftViewController), bundle: nil)
        let rightVC: RightViewController = RightViewController(nibName: String(RightViewController), bundle: nil)
        let cameraVC: CameraViewController = CameraViewController(nibName: String(CameraViewController), bundle: nil)
        
        self.addChildViewController(leftVC)
        self.addChildViewController(rightVC)
        self.addChildViewController(cameraVC)
        
        leftVC.didMoveToParentViewController(self)
        rightVC.didMoveToParentViewController(self)
        cameraVC.didMoveToParentViewController(self)
        
        self.scrollView.addSubview(leftVC.view)
        self.scrollView.addSubview(rightVC.view)
        self.scrollView.addSubview(cameraVC.view)
        
        var centerFrame: CGRect = cameraVC.view.frame
        centerFrame.origin.x = self.view.frame.width
        cameraVC.view.frame = centerFrame
        var rightFrame: CGRect = rightVC.view.frame
        rightFrame.origin.x = 2 * self.view.frame.size.width
        rightVC.view.frame = rightFrame
        
        self.scrollView.contentSize = CGSizeMake(self.view.frame.width * 3, 0)
    }

}

