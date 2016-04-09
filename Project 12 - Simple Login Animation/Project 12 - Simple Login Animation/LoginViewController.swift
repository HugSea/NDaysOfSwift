//
//  LoginViewController.swift
//  Project 12 - Simple Login Animation
//
//  Created by 张庆杰 on 16/4/9.
//  Copyright © 2016年 ZhangQingjie. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "Login"
        UIApplication.sharedApplication().statusBarHidden = false
        UIApplication.sharedApplication().statusBarStyle = .LightContent
        
        // AnimationInit
        let width = UIScreen.mainScreen().bounds.size.width
        usernameTextField.transform = CGAffineTransformMakeTranslation(-width, 0)
        passwordTextField.transform = CGAffineTransformMakeTranslation(-width, 0)
        loginBtn.transform = CGAffineTransformMakeTranslation(-width, 0)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        // Animation
        AnimationUtil.moveAnimation(self.usernameTextField, duration: 0.5, delay: 0)
        AnimationUtil.moveAnimation(self.passwordTextField, duration: 0.5, delay: 0.1)
        AnimationUtil.moveAnimation(self.loginBtn, duration: 0.5, delay: 0.2)
    }

    @IBAction func back(sender: UIButton) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }

    @IBAction func login(sender: UIButton) {
        var bounds = sender.bounds
        UIView.animateWithDuration(0.75, delay: 0, usingSpringWithDamping: 0.2, initialSpringVelocity: 10, options: .OverrideInheritedCurve, animations: { () -> Void in
            bounds.size.width += 60
            sender.bounds = bounds
            }, completion: nil)
    }
    
}
