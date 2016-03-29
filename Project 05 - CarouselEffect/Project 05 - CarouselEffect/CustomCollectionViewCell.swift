//
//  CustomCollectionViewCell.swift
//  Project 05 - CarouselEffect
//
//  Created by 张庆杰 on 16/3/29.
//  Copyright © 2016年 ZhangQingjie. All rights reserved.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var bgImageView: UIImageView!
    @IBOutlet weak var titleLab: UILabel!
    
    var model: Model! {
        didSet {
            updateUI()
        }
    }
    
    func updateUI() {
        self.bgImageView.image = UIImage(named: model.imageName)
        self.titleLab.text = model.title
    }
}
