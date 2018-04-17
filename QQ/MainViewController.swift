//
//  ViewController.swift
//  QQ
//
//  Created by ChingHoi on 2018/4/15.
//  Copyright © 2018年 ChingHoi. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //初始化tabbar
        let item0: UITabBarItem = tabBar.items![0]
        item0.image = #imageLiteral(resourceName: "DidSelectMessagesFace")
        item0.selectedImage = #imageLiteral(resourceName: "SelectMessagesFace")
        item0.title = "消息"
        let item1: UITabBarItem = tabBar.items![1]
        item1.image = #imageLiteral(resourceName: "DidSelectContactsFace")
        item1.selectedImage = #imageLiteral(resourceName: "SelectContactsFace")
        item1.title = "联系人"
        let item2: UITabBarItem = tabBar.items![2]
        item2.image = #imageLiteral(resourceName: "DidSelectMoments")
        item2.selectedImage = #imageLiteral(resourceName: "SelectMoments")
        item2.title = "动态"
    }
    //----------------------------------------------------
    // 当点击tabBar的时候,自动执行该代理方法(不需要手动设置代理)
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        // 使用枚举遍历,判断选中的tabBarItem等于数组中的第几个
        for (k,v) in (tabBar.items?.enumerated())! {
            if v == item {
                // 打印选中的iteme下标
                print(k)
                print(v)
                // 将下标传入动画方法
                animation(index: k, tabBar: v)
            }
        }
    }
    //----------------------------------------------------
    // 动画方法
    func animation(index: Int, tabBar: UITabBarItem){
        // 不知为何,无法设置数组类型为UITabBarButton??????所以设置成了Any
//        var tabbarbuttonArray: [Any] = [Any]()
//
//        for tabBarBtn in self.tabBar.subviews {
//            if tabBarBtn.isKind(of: NSClassFromString("UITabBarButton")!) {
//                tabbarbuttonArray.append(tabBarBtn)
//
//            }
//        }
        //----------------------------------------------------
        let pulse = CABasicAnimation(keyPath: "transform.scale")
        pulse.timingFunction = CAMediaTimingFunction(name:kCAMediaTimingFunctionEaseInEaseOut)
        pulse.duration = 0.08
        pulse.repeatCount = 1
        pulse.autoreverses = true
        pulse.fromValue = 0.7
        pulse.toValue = 1.3

        // 给tabBarButton添加动画效果
        let tabBarLayer = (tabBar as AnyObject).layer
        tabBarLayer?.add(pulse, forKey: nil)
        //根据所选tab设置动画背景
        switch index {
        case 0:
            tabBar.selectedImage = #imageLiteral(resourceName: "SelectMessagesFace")//.withRenderingMode(.alwaysOriginal)//原图渲染,保持原来的色彩,已经在Asset.xcassets中修改,直接使用即可
            tabBar.image = #imageLiteral(resourceName: "DidSelectMessagesFace")
        case 1:
            tabBar.selectedImage = #imageLiteral(resourceName: "SelectContactsFace")
            tabBar.image = #imageLiteral(resourceName: "DidSelectContactsFace")
        case 2:
            tabBar.selectedImage = #imageLiteral(resourceName: "SelectMoments")
            tabBar.image = #imageLiteral(resourceName: "DidSelectMoments")
        default:
            break
        }

    }
}

