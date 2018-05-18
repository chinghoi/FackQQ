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
        
        navigationController?.isNavigationBarHidden = true
        //将侧栏菜单放到主页面下面
        view.insertSubview(sideMenuView, belowSubview: mainView)
        
        //配置遮罩层
        shadeView.frame = mainView.frame
        shadeView.backgroundColor = UIColor.clear
        shadeView.alpha = 0
        
        //打开或关闭侧滑菜单
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(isSideMenuOpen),
                                               name: NSNotification.Name("IsSideMenuOpen"),
                                               object: nil)
        //跳转我的二维码
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(qRInfoView),
                                               name: NSNotification.Name(rawValue: "QRInfoView"),
                                               object: nil)
        //跳转 激活会员
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(vipView),
                                               name: NSNotification.Name(rawValue: "VIPView"),
                                               object: nil)
        //跳转 QQ钱包
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(qqWalletView),
                                               name: NSNotification.Name(rawValue: "QQWalletView"),
                                               object: nil)
        //跳转 个性装扮
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(themeView),
                                               name: NSNotification.Name(rawValue: "ThemeView"),
                                               object: nil)
        //跳转 我的收藏
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(collectView),
                                               name: NSNotification.Name(rawValue: "CollectView"),
                                               object: nil)
        //跳转 我的相册
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(photoView),
                                               name: NSNotification.Name(rawValue: "PhotoView"),
                                               object: nil)
        //跳转 我的文件
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(fileView),
                                               name: NSNotification.Name(rawValue: "FileView"),
                                               object: nil)
        //跳转 免流量特权
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(specialView),
                                               name: NSNotification.Name(rawValue: "SpecialView"),
                                               object: nil)
        //跳转 设置
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(settingView),
                                               name: NSNotification.Name(rawValue: "SettingView"),
                                               object: nil)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(false)
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(false)
        //在显示界面以后取消隐藏导航栏,不然会导致之后左右设置导航栏的界面都要重新设置取消隐藏
        navigationController?.isNavigationBarHidden = false
        //设置导航栏透明
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        
    }
    //通知处理方法
    @objc func qRInfoView() {
        let qRInfoViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "QRInfoView")
        navigationController?.pushViewController(qRInfoViewController, animated: true)
    }
    @objc func vipView() {
        let vipViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "VIPView")
        navigationController?.pushViewController(vipViewController, animated: true)
    }
    @objc func qqWalletView() {
        let qqWalletViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "QQWalletView")
        navigationController?.pushViewController(qqWalletViewController, animated: true)
    }
    @objc func themeView() {
        let themeViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ThemeView")
        navigationController?.pushViewController(themeViewController, animated: true)
    }
    @objc func collectView() {
        let collectViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "CollectView")
        navigationController?.pushViewController(collectViewController, animated: true)
    }
    @objc func photoView() {
        let photoViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "PhotoView")
        navigationController?.pushViewController(photoViewController, animated: true)
    }
    @objc func fileView() {
        let fileViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "FileView")
        navigationController?.pushViewController(fileViewController, animated: true)
    }
    @objc func specialView() {
        let specialViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SpecialView")
        navigationController?.pushViewController(specialViewController, animated: true)
    }
    @objc func settingView() {
        let settingViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SettingView")
        navigationController?.pushViewController(settingViewController, animated: true)
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
