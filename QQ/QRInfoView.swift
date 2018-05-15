//
//  QRInfoView.swift
//  QQ
//
//  Created by chinghoi on 2018/5/4.
//  Copyright © 2018年 ChingHoi. All rights reserved.
//

import UIKit

class QRInfoView: UIViewController {
    
    override func viewDidLoad() {     
        print("我的二维码页面viewDidLoad")
    }
    override func viewDidAppear(_ animated: Bool) {
        
        super.viewDidAppear(animated)
        
        //设置顶栏字体颜色为黑色
        UIApplication.shared.statusBarStyle = UIStatusBarStyle.default
        print("我的二维码页面viewDidAppear")
        
    }
    @IBAction func backBtn(_ sender: UIButton) {
        dismiss(animated: false, completion: nil)
    }
}
