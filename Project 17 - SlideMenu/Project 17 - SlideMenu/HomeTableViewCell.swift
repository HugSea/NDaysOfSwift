//
//  HomeTableViewCell.swift
//  Project 17 - SlideMenu
//
//  Created by 张庆杰 on 16/4/25.
//  Copyright © 2016年 ZhangQingjie. All rights reserved.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    @IBOutlet weak var bgImageView: UIImageView!
    @IBOutlet weak var iconImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
