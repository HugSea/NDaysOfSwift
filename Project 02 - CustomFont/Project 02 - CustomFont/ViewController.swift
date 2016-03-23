//
//  ViewController.swift
//  Project 02 - CustomFont
//
//  Created by 张庆杰 on 16/3/19.
//  Copyright © 2016年 ZhangQingjie. All rights reserved.
//

import UIKit

enum FontType {
    case MFZhiHei
    case MFTongXin
    case MFJinHei
};

class ViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    var fontType = FontType.MFZhiHei
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        for fontNames in UIFont.familyNames() {
            print(fontNames)
        }
        textView.font = UIFont(name: "MF ZhiHei (Noncommercial)", size: 15)
        fontType = .MFTongXin
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func changeFont(sender: AnyObject) {
        switch fontType {
        case .MFZhiHei:
            textView.font = UIFont(name: "MF TongXin (Noncommercial)", size: 15)
            fontType = .MFTongXin
        case .MFTongXin:
            textView.font = UIFont(name: "MF JinHei (Noncommercial)", size: 15)
            fontType = .MFJinHei
        case .MFJinHei:
            textView.font = UIFont(name: "MF ZhiHei (Noncommercial)", size: 15)
            fontType = .MFZhiHei
        }
    }

}

