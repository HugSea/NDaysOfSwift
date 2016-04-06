//
//  HomepageCollectionViewCell.swift
//  Project 09 - PhotoAlbumMultiSelect
//
//  Created by 张庆杰 on 16/4/5.
//  Copyright © 2016年 ZhangQingjie. All rights reserved.
//

import UIKit

class HomepageCollectionViewCell: UICollectionViewCell {
    
    var bgImageView: UIImageView?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        bgImageView = UIImageView(frame: CGRectZero)
        bgImageView?.contentMode = .ScaleAspectFill
        bgImageView?.clipsToBounds = true
        self.contentView.addSubview(bgImageView!)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        bgImageView?.frame = self.contentView.bounds
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
