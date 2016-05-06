//
//  ViewController.swift
//  Project 20 - TopTagRollView
//
//  Created by 张庆杰 on 16/5/6.
//  Copyright © 2016年 张庆杰. All rights reserved.
//

import UIKit

let kWidth = UIScreen.mainScreen().bounds.size.width
let kHeight = UIScreen.mainScreen().bounds.size.height

class ViewController: UIViewController, UIScrollViewDelegate {

    // MARK: --------------------------- Life Cycle ---------------------------
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupBottomTagView()
        self.setupTopTagView()
        self.setupScrollView()
    }
    
    // MARK: --------------------------- UIScrollViweDelegate ---------------------------
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        let width = kWidth / 3.0
        var frame = self.maskView.frame
        frame.origin.x = scrollView.contentOffset.x / kWidth * width
        self.maskView.frame = frame
    }
    
    // MARK: --------------------------- Private Methods ---------------------------
    
    private func setupBottomTagView() {
        let bgView = UIView(frame: CGRectMake(0, 64, kWidth, 40))
        self.view.addSubview(bgView)
        bgView.backgroundColor = UIColor(red: 0.922, green: 0.922, blue: 0.922, alpha: 1.0)
        
        let width = CGRectGetWidth(bgView.frame) / 3.0
        let height = CGRectGetHeight(bgView.frame)
        // 标题一
        let labelOne = UILabel(frame: CGRectMake(0, 0, width, height))
        bgView.addSubview(labelOne)
        labelOne.text = "One"
        labelOne.textAlignment = .Center
        labelOne.textColor = UIColor(red: 0.443, green: 0.439, blue: 0.439, alpha: 1.0)
        
        // 标题二
        let labelTwo = UILabel(frame: CGRectMake(width, 0, width, height))
        bgView.addSubview(labelTwo)
        labelTwo.text = "Two"
        labelTwo.textAlignment = .Center
        labelTwo.textColor = UIColor(red: 0.443, green: 0.439, blue: 0.439, alpha: 1.0)
        
        // 标题三
        let labelThree = UILabel(frame: CGRectMake(width * 2, 0, width, height))
        bgView.addSubview(labelThree)
        labelThree.text = "Three"
        labelThree.textAlignment = .Center
        labelThree.textColor = UIColor(red: 0.443, green: 0.439, blue: 0.439, alpha: 1.0)
    }
    
    private func setupTopTagView() {
        let bgView = UIView(frame: CGRectMake(0, 64, kWidth, 40))
        self.view.addSubview(bgView)
        bgView.backgroundColor = UIColor(red: 0.808, green: 0.208, blue: 0.212, alpha: 1.0)
        
        let width = CGRectGetWidth(bgView.frame) / 3.0
        let height = CGRectGetHeight(bgView.frame)
        // 标题一
        let labelOne = UILabel(frame: CGRectMake(0, 0, width, height))
        bgView.addSubview(labelOne)
        labelOne.text = "One"
        labelOne.textAlignment = .Center
        labelOne.textColor = UIColor(red: 0.945, green: 0.827, blue: 0.827, alpha: 1.0)
        
        // 标题二
        let labelTwo = UILabel(frame: CGRectMake(width, 0, width, height))
        bgView.addSubview(labelTwo)
        labelTwo.text = "Two"
        labelTwo.textAlignment = .Center
        labelTwo.textColor = UIColor(red: 0.945, green: 0.827, blue: 0.827, alpha: 1.0)
        
        // 标题三
        let labelThree = UILabel(frame: CGRectMake(width * 2, 0, width, height))
        bgView.addSubview(labelThree)
        labelThree.text = "Three"
        labelThree.textAlignment = .Center
        labelThree.textColor = UIColor(red: 0.945, green: 0.827, blue: 0.827, alpha: 1.0)
        
        self.maskView = UIView(frame: CGRectMake(0, 4, width, height - 8))
        self.maskView.layer.cornerRadius = 16
        self.maskView.clipsToBounds = true
        self.maskView.backgroundColor = UIColor.blackColor()
        bgView.maskView = self.maskView
    }
    
    private func setupScrollView() {
        self.scrollView.delegate = self
        self.scrollView.contentSize = CGSizeMake(kWidth * 3.0, 0)
        self.scrollView.pagingEnabled = true
        self.view.addSubview(self.scrollView)
        
        let size = self.scrollView.bounds.size
        
        // 图片一
        let imageViewOne = UIImageView(frame: CGRectMake(0, 0, size.width, size.height))
        self.scrollView.addSubview(imageViewOne)
        imageViewOne.image = UIImage(named: "1")
        imageViewOne.contentMode = .ScaleAspectFill
        imageViewOne.clipsToBounds = true
        
        // 图片二
        let imageViewTwo = UIImageView(frame: CGRectMake(size.width, 0, size.width, size.height))
        self.scrollView.addSubview(imageViewTwo)
        imageViewTwo.image = UIImage(named: "2")
        imageViewTwo.contentMode = .ScaleAspectFill
        imageViewTwo.clipsToBounds = true
        
        // 图片三
        let imageViewThree = UIImageView(frame: CGRectMake(size.width * 2, 0, size.width, size.height))
        self.scrollView.addSubview(imageViewThree)
        imageViewThree.image = UIImage(named: "3")
        imageViewThree.contentMode = .ScaleAspectFill
        imageViewThree.clipsToBounds = true
    }

    // MARK: --------------------------- Getter and Setter ---------------------------
    
    // 内容滚动视图
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView(frame: CGRectMake(0, 104, kWidth, kHeight - 104))
        return scrollView
    }()
    // 顶部标签栏
    private var topTagView: UIView!
    
    private var maskView: UIView!
}

