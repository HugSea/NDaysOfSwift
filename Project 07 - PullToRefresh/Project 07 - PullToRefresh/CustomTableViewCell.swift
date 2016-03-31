//
//  CustomTableViewCell.swift
//  Project 07 - PullToRefresh
//
//  Created by 张庆杰 on 16/3/31.
//  Copyright © 2016年 ZhangQingjie. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    @IBOutlet weak var bgImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    var imageName: String? {
        didSet {
            bgImageView.image = UIImage(named: imageName!)
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
