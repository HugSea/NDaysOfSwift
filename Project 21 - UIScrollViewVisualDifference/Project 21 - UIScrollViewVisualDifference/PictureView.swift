//
//  PictureView.swift
//  Project 21 - UIScrollViewVisualDifference
//
//  Created by 张庆杰 on 16/5/26.
//  Copyright © 2016年 张庆杰. All rights reserved.
//

import UIKit

class PictureView: UIView {

    var imageView: UIImageView?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        // 很关键
        self.clipsToBounds = true
        
        imageView = UIImageView(frame: self.bounds)
        imageView?.contentMode = .ScaleAspectFill
        self.addSubview(imageView!)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
