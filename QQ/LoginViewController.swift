//
//  LoginViewController.swift
//  QQ
//
//  Created by ChingHoi on 2018/4/20.
//  Copyright © 2018年 ChingHoi. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    //隐藏状态栏
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    @IBOutlet var background: UIImageView!

    override func viewDidLoad() {
        //为X适配背景图
        if UIDevice.current.isX() {
            background.image = #imageLiteral(resourceName: "login_backgroundImageX")
        } else {
            background.image = #imageLiteral(resourceName: "login_backgroundImage")
        }
        //添加半透明遮罩
        let backgroundView = UIView()
        backgroundView.frame = background.frame
        backgroundView.backgroundColor = UIColor(red: CGFloat(40 / 255.0), green: CGFloat(40 / 255.0), blue: CGFloat(40 / 255.0), alpha: 1.0)
        backgroundView.alpha = 0.4
        background.addSubview(backgroundView)
        
        let userName = UITextField()
        userName.alpha = 1
        userName.placeholder = "密码"
        
    }
}

//判断是否是 iPhone X
extension UIDevice {
    public func isX() -> Bool {
        if UIScreen.main.bounds.height == 812 {
            return true
        }
        return false
    }
}


