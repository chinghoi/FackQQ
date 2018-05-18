//
//  SettingViewController.swift
//  QQ
//
//  Created by chinghoi on 2018/5/18.
//  Copyright © 2018年 ChingHoi. All rights reserved.
//

import UIKit
import LeanCloud

class SettingViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        //设置顶栏字体颜色为黑色
        UIApplication.shared.statusBarStyle = UIStatusBarStyle.default
        
    }
    @IBAction func logOut(_ sender: UIButton) {
        LCUser.logOut()
        navigationController?.popViewController(animated: true)
    }
    @IBAction func back(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
}
