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
    
    func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
    
    override func viewDidLoad() {
        //设置顶栏字体颜色
        setNeedsStatusBarAppearanceUpdate()
        //设置状态栏透明
        myQRInfoNavBar.setBackgroundImage(UIImage(), for: .default)
        myQRInfoNavBar.shadowImage = UIImage()
        myQRInfoNavBar.isTranslucent = true
    }
}
