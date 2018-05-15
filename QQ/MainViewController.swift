//
//  MainViewController.swift
//  QQ
//
//  Created by chinghoi on 2018/5/15.
//  Copyright © 2018年 ChingHoi. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    //主页面左右移动约束
    @IBOutlet weak var mainConstraint: NSLayoutConstraint!
    @IBOutlet weak var mainView: UIView!
    
    //侧滑菜单左右移动约束
    @IBOutlet weak var sideMenuConstraint: NSLayoutConstraint!
    @IBOutlet weak var sideMenuView: UIView!
    
    //给MainView设置遮罩层
    var shadeView = UIView()
    
    var sideMenuOpen = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //将侧栏菜单放到主页面下面
        view.insertSubview(sideMenuView, belowSubview: mainView)
        
        //配置遮罩层
        shadeView.frame = mainView.frame
        shadeView.backgroundColor = UIColor.clear
        shadeView.alpha = 0
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(isSideMenuOpen),
                                               name: NSNotification.Name("IsSideMenuOpen"),
                                               object: nil)
        
    }
    
    @objc func isSideMenuOpen() {
        if sideMenuOpen {
            sideMenuOpen = false

            sideMenuConstraint.constant = 200
            mainConstraint.constant = 0

            UIView.animate(withDuration: 0.1) {
                self.shadeView.backgroundColor = UIColor.clear
                self.shadeView.alpha = 0

                self.view.layoutIfNeeded()
            }
            print("关闭侧栏")
        } else {
            sideMenuOpen = true

            sideMenuConstraint.constant = 0
            mainConstraint.constant = 300

            let tap = UITapGestureRecognizer(target: self, action: #selector(shadeViewTap))
            shadeView.isUserInteractionEnabled = true
            shadeView.addGestureRecognizer(tap)
            mainView.addSubview(shadeView)
            UIView.animate(withDuration: 0.3) {
                self.shadeView.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
                self.shadeView.alpha = 0.4

                self.view.layoutIfNeeded()

            }
            print("打开侧栏")
        }
    }
    @objc func shadeViewTap() {

        sideMenuOpen = false
        
        UIView.animate(withDuration: 0.2) {
            self.shadeView.backgroundColor = UIColor.clear
            self.shadeView.alpha = 0
            
            self.sideMenuConstraint.constant = 200
            self.mainConstraint.constant = 0
            self.view.layoutIfNeeded()
            
        }
        print("点击遮罩关闭侧栏")
    }
    
}
