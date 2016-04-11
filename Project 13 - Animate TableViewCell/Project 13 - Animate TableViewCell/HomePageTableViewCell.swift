//
//  HomePageTableViewCell.swift
//  Project 13 - Animate TableViewCell
//
//  Created by 张庆杰 on 16/4/11.
//  Copyright © 2016年 ZhangQingjie. All rights reserved.
//

import UIKit

class HomePageTableViewCell: UITableViewCell {
    
    var gradientLayer = CAGradientLayer()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        gradientLayer.frame = self.bounds
        let color1 = UIColor(white: 1.0, alpha: 0.2).CGColor
        let color2 = UIColor(white: 1.0, alpha: 0.1).CGColor
        let color3 = UIColor.clearColor().CGColor
        let color4 = UIColor(white: 0.0, alpha: 0.05).CGColor
        
        gradientLayer.colors = [color1, color2, color3, color4]
        gradientLayer.locations = [0.0, 0.04, 0.95, 1.0]
        self.contentView.layer.addSublayer(gradientLayer)
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
