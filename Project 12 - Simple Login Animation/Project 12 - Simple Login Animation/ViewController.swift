//
//  ViewController.swift
//  Project 12 - Simple Login Animation
//
//  Created by 张庆杰 on 16/4/9.
//  Copyright © 2016年 ZhangQingjie. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        UIApplication.sharedApplication().statusBarStyle = .LightContent
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func signup(sender: UIButton) {
        let signUpController = SignUpViewController()
        signUpController.modalTransitionStyle = .CrossDissolve
        self.presentViewController(signUpController, animated: true, completion: nil)
    }

    @IBAction func login(sender: UIButton) {
        let loginViewController = LoginViewController()
        loginViewController.modalTransitionStyle = .CrossDissolve
        self.presentViewController(loginViewController, animated: true, completion: nil)
    }

}

