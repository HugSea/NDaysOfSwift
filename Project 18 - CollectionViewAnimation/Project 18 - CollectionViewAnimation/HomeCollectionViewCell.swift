//
//  HomeCollectionViewCell.swift
//  Project 18 - CollectionViewAnimation
//
//  Created by 张庆杰 on 16/4/28.
//  Copyright © 2016年 ZhangQingjie. All rights reserved.
//

import UIKit

class HomeCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var picImageView: UIImageView!
    @IBOutlet weak var descLabel: UILabel!
    
    var backBlock: (() -> Void)?
    
    @IBAction func backAction(sender: AnyObject) {
        backBlock?()
    }
}
