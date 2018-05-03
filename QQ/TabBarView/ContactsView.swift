//
//  contacts.swift
//  QQ
//
//  Created by ChingHoi on 2018/4/15.
//  Copyright © 2018年 ChingHoi. All rights reserved.
//

import UIKit
import CWLateralSlide

class ContactsView: UIViewController {
    
    @IBOutlet weak var contactsNavBar: UINavigationBar!
    
    override func viewDidLoad() {
        //添加右滑菜单
        cw_registerShowIntractive(withEdgeGesture: true) { (_ direction: CWDrawerTransitionDirection) in
            if direction == CWDrawerTransitionDirection.fromLeft {
                let vc = UIStoryboard(name: "Main", bundle:nil).instantiateViewController(withIdentifier: "MenuViewController")
                // 调用这个方法
                self.cw_showDefaultDrawerViewController(vc)
            } else if direction == CWDrawerTransitionDirection.fromRight {
                print("youhua")
            }
        }
        //设置状态栏透明
        contactsNavBar.setBackgroundImage(UIImage(), for: .default)
        contactsNavBar.shadowImage = UIImage()
        contactsNavBar.isTranslucent = true
    }
    @IBAction func menu(_ sender: UIButton) {
        let vc = UIStoryboard(name: "Main", bundle:nil).instantiateViewController(withIdentifier: "MenuViewController")
        
        // 调用这个方法
        cw_showDefaultDrawerViewController(vc)
    }
}
