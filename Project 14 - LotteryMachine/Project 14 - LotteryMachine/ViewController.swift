//
//  ViewController.swift
//  Project 14 - LotteryMachine
//
//  Created by 张庆杰 on 16/4/12.
//  Copyright © 2016年 ZhangQingjie. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var result: UILabel!
    @IBOutlet weak var pickView: UIPickerView!
    var dataSource = ["🍉", "🍒", "🍎", "🍌", "🍊", "🍋", "🍓", "🍍", "🍇", "🍑"]
    var one = [Int]()
    var two = [Int]()
    var three = [Int]()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for var i = 0; i < 100; i++ {
            one.append(Int(arc4random() % 10))
            two.append(Int(arc4random() % 10))
            three.append(Int(arc4random() % 10))
        }
    }

    // MARK: - UIPickerViewDelegate/DataSource
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 100
    }

    func pickerView(pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 150
    }
    
    func pickerView(pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusingView view: UIView?) -> UIView {
        let emoji = UILabel()
        
        emoji.font = UIFont(name: "Apple Color Emoji", size: 80)
        emoji.textAlignment = NSTextAlignment.Center
        
        if component == 0 {
            emoji.text = dataSource[one[row]]
        } else if component == 1 {
            emoji.text = dataSource[two[row]]
        } else {
            emoji.text = dataSource[three[row]]
        }
        
        pickerView.subviews[1].hidden = true
        pickerView.subviews[2].hidden = true
        
        return emoji
    }
    
    // MARK: - Private Methods
    
    @IBAction func go(sender: AnyObject) {
        self.pickView.selectRow(Int(arc4random() % 100), inComponent: 0, animated: true)
        self.pickView.selectRow(Int(arc4random() % 100), inComponent: 1, animated: true)
        self.pickView.selectRow(Int(arc4random() % 100), inComponent: 2, animated: true)
        
        if dataSource[one[pickView.selectedRowInComponent(0)]] == dataSource[two[pickView.selectedRowInComponent(1)]] && dataSource[two[pickView.selectedRowInComponent(1)]] == dataSource[three[pickView.selectedRowInComponent(2)]] {
            result.text = "Accepted"
            result.textColor = UIColor.redColor()
        } else {
            result.text = "Wrong"
            result.textColor = UIColor(red: 0.11, green: 0.60, blue: 0.02, alpha: 1.0)
        }
    }
    
}

