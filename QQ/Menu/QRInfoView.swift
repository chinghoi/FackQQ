//
//  QRInfoView.swift
//  QQ
//
//  Created by chinghoi on 2018/5/4.
//  Copyright © 2018年 ChingHoi. All rights reserved.
//

import UIKit

class QRInfoView: UIViewController {
    
    @IBOutlet weak var myQRInfoNavBar: UINavigationBar!
    
    override func viewDidAppear(_ animated: Bool) {
        
        super.viewDidAppear(animated)
        
        //设置顶栏字体颜色为黑色
        UIApplication.shared.statusBarStyle = UIStatusBarStyle.default
        
        //设置状态栏透明
        myQRInfoNavBar.setBackgroundImage(UIImage(), for: .default)
        myQRInfoNavBar.shadowImage = UIImage()
        myQRInfoNavBar.isTranslucent = true
    }
    @IBAction func backBtn(_ sender: UIButton) {
        //跳转到主页面
        //dismiss(animated: true, completion: nil)
        //view.window?.rootViewController?.dismiss(animated: false, completion: nil)
    }
}
