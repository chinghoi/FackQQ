//
//  DongtaiView.swift
//  QQ
//
//  Created by ChingHoi on 2018/4/15.
//  Copyright © 2018年 ChingHoi. All rights reserved.
//

import UIKit
import CWLateralSlide

class MomentsView: UIViewController {
    
    //设置屏幕可偏移距离
    let leftMenuWidth = CWLateralSlideConfiguration()
    
    @IBOutlet weak var momentsNavBar: UINavigationBar!
    
    override func viewDidLoad() {
        //添加右滑菜单
        cw_registerShowIntractive(withEdgeGesture: true) { (_ direction: CWDrawerTransitionDirection) in
            if direction == CWDrawerTransitionDirection.fromLeft {
                let vc = UIStoryboard(name: "Main", bundle:nil).instantiateViewController(withIdentifier: "MenuViewController")
                //调用显示视图
                self.leftMenuWidth.distance = 0.8 * Float(UIScreen.main.bounds.width)
                self.cw_showDrawerViewController(vc, animationType: .default, configuration: self.leftMenuWidth)
            } else if direction == CWDrawerTransitionDirection.fromRight {
                print("youhua")
            }
        }
        //设置状态栏透明
        momentsNavBar.setBackgroundImage(UIImage(), for: .default)
        momentsNavBar.shadowImage = UIImage()
        momentsNavBar.isTranslucent = true
    }
    @IBAction func menu(_ sender: UIButton) {
        let vc = UIStoryboard(name: "Main", bundle:nil).instantiateViewController(withIdentifier: "MenuViewController")
        
        //调用显示视图
        self.leftMenuWidth.distance = 0.8 * Float(UIScreen.main.bounds.width)
        self.cw_showDrawerViewController(vc, animationType: .default, configuration: self.leftMenuWidth)
    }
}
