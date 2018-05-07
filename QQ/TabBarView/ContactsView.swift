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
    
    //设置屏幕可偏移距离
    let leftMenuWidth = CWLateralSlideConfiguration()
    
    @IBOutlet weak var contactsNavBar: UINavigationBar!
    
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
        contactsNavBar.setBackgroundImage(UIImage(), for: .default)
        contactsNavBar.shadowImage = UIImage()
        contactsNavBar.isTranslucent = true
    }
    //设置 grouped 风格的 header 高度
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return CGFloat(45)
        }
        return tableView.sectionHeaderHeight
    }
    //设置 header 图片
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        var vw = UIView()
        
        vw = UIImageView(image: #imageLiteral(resourceName: "headerImage"))
        //添加点击事件
        
        return vw
    }
    @IBAction func menu(_ sender: UIButton) {
        let vc = UIStoryboard(name: "Main", bundle:nil).instantiateViewController(withIdentifier: "MenuViewController")
        
        //调用显示视图
        self.leftMenuWidth.distance = 0.8 * Float(UIScreen.main.bounds.width)
        self.cw_showDrawerViewController(vc, animationType: .default, configuration: self.leftMenuWidth)
    }
}
