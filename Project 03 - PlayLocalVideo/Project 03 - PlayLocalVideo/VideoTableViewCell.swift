//
//  VideoTableViewCell.swift
//  Project 03 - PlayLocalVideo
//
//  Created by 张庆杰 on 16/3/21.
//  Copyright © 2016年 ZhangQingjie. All rights reserved.
//

import UIKit

class VideoTableViewCell: UITableViewCell {

    @IBOutlet weak var backgroundImageView: UIImageView!
    
    // 逃逸背包
    var closurse: (String -> Void)?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
