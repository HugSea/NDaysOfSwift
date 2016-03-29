//
//  Model.swift
//  Project 05 - CarouselEffect
//
//  Created by 张庆杰 on 16/3/29.
//  Copyright © 2016年 ZhangQingjie. All rights reserved.
//

import UIKit

class Model: NSObject {
    var imageName = ""
    var title = ""
    
    init(imageName: String, title: String) {
        self.imageName = imageName
        self.title = title
    }
    
    static func createModel() -> [Model] {
        return [
            Model(imageName: "p1", title: "我是大山^_^"),
            Model(imageName: "p2", title: "乌云密布~~~☁️☁️☁️"),
            Model(imageName: "p3", title: "我是一家飞机~~~✈️✈️✈️"),
            Model(imageName: "p4", title: "美丽的风景~~~"),
            Model(imageName: "p5", title: "呼伦贝尔大草原"),
            Model(imageName: "p6", title: "秋水共长天一色"),
            Model(imageName: "p7", title: "牵着马，走天涯")
        ]
    }
}
