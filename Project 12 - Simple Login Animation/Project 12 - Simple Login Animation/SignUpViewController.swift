//
//  SignUpViewController.swift
//  Project 12 - Simple Login Animation
//
//  Created by 张庆杰 on 16/4/9.
//  Copyright © 2016年 ZhangQingjie. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var topTitleLabel: UILabel!
    @IBOutlet weak var bottomTitleLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var signupBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // AnimationInit
        topTitleLabel.transform = CGAffineTransformMakeTranslation(0, -300)
        bottomTitleLabel.transform = CGAffineTransformMakeTranslation(0, -300)
        textField.alpha = 0.0
        signupBtn.transform = CGAffineTransformMakeTranslation(-UIScreen.mainScreen().bounds.size.width, 0)
        AnimationUtil.maskAnimation(signupBtn, length: 0, duration: 1.0, maskColor: view.backgroundColor!)
        textField.addTarget(self, action: "textFieldDidChangeContext", forControlEvents: UIControlEvents.EditingChanged)
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        // AnimationRealize
        AnimationUtil.moveAnimation(topTitleLabel, duration: 1.0, delay: 0.25)
        AnimationUtil.moveAnimation(bottomTitleLabel, duration: 1.0, delay: 0)
        UIView.animateWithDuration(1.5) { () -> Void in
            self.textField.alpha = 1.0
        }
        AnimationUtil.moveAnimation(signupBtn, duration: 1.0, delay: 0)
    }

    @IBAction func back(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    // MARK: - Private Methods
    
    func textFieldDidChangeContext() {
        var length = self.textField.text?.lengthOfBytesUsingEncoding(NSUTF8StringEncoding)
        self.signupBtn.enabled = length == 11 ? true : false
        length = length > 11 ? 11 : length
        AnimationUtil.maskAnimation(self.signupBtn, length: CGFloat(length!) / 11.0, duration: 0.25, maskColor: self.view.backgroundColor!)
    }
}
