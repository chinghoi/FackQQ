//
//  ViewController.swift
//  QQ
//
//  Created by ChingHoi on 2018/4/15.
//  Copyright © 2018年 ChingHoi. All rights reserved.
//

import UIKit


class MainViewController: UITabBarController {
//    var fullSize :CGSize!
//    var myUIView :UIView!
//    var anotherUIView :UIView!
    
    //状态,控制是否已经选中,选中的话点击tabbar不产生动画
    var tabBarSelected: Int = 0
    override func viewDidLoad() {
        
        super.viewDidLoad()

        //设置title字体颜色
        tabBar.tintColor = UIColor(red: CGFloat(71 / 255.0), green: CGFloat(186 / 255.0), blue: CGFloat(254 / 255.0), alpha: 1)
        //初始化tabbar无需使用.alwaysOriginal原图渲染,保持原来的色彩,已经在Asset.xcassets中修改,直接使用即可
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

//        //获得屏幕尺寸
//        fullSize = UIScreen.main.bounds.size
//        // 一个用来移动的 UIView
//        anotherUIView = UIView(frame: CGRect(x: fullSize.width * 0.5, y: fullSize.height * 0.5, width: 100, height: 100))
//        //anotherUIView.backgroundColor = UIColor.orange
//        self.view.addSubview(anotherUIView)
//
//        // 拖曳手势
//        let panRecognizer = UIPanGestureRecognizer(target: self,action: #selector(pan(_:)))
//
//        // 最少可以用几个指头拖曳
//        panRecognizer.minimumNumberOfTouches = 1
//
//        // 最多可以用几个指头拖曳
//        panRecognizer.maximumNumberOfTouches = 1
//
//        // 为这个可以移动的 UIView 加上监听手势
//        anotherUIView.addGestureRecognizer(panRecognizer)
//    }
//    // 触发拖拽手势后执行的动作
//    @objc func pan(_ recognizer: UIPanGestureRecognizer) {
//        // 設置 UIView 新的位置
//        let point = recognizer.location(in: self.view)
//        anotherUIView.center = point
    }

    // 当点击tabBar的时候,自动执行该代理方法(不需要手动设置代理)
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        // 使用枚举遍历,判断选中的tabBarItem等于数组中的第几个
        for (k,v) in (tabBar.items?.enumerated())! {
            if v == item {
                // 打印选中的iteme下标
                print(k)
                // 判断是否第二次点击. 将下标传入动画方法
                if tabBarSelected != k {
                    animation(index: k, tabBar: v)
                    tabBarSelected = k
                }
                //获取tabbar图片位置
                getTabBarButtonImageView(tabBar: item)
//                let tabBarButton = item.value(forKey: "view") as! UIControl
//                let tabBarSwappableImageView = tabBarButton.value(forKey: "info") as? UIImageView
//                print("---------------------------")
//                print(tabBarSwappableImageView as Any)
            }
        }
    }
    
    // 动画方法
    func animation(index: Int, tabBar: UITabBarItem){
        //不知为何,无法设置数组类型为UITabBarButton??????所以设置成了Any
        var tabbarbuttonArray: [Any] = [Any]()
        for tabBarBtn in self.tabBar.subviews {
            if tabBarBtn.isKind(of: NSClassFromString("UITabBarButton")!) {
                tabbarbuttonArray.append(tabBarBtn)
            }
        }
        //缩放参数
        let pulse = CABasicAnimation(keyPath: "transform.scale")
        pulse.timingFunction = CAMediaTimingFunction(name:kCAMediaTimingFunctionEaseInEaseOut)
        pulse.duration = 0.1    //持续时间
        pulse.repeatCount = 1   //重复次数
        pulse.autoreverses = true
        pulse.fromValue = 1.0   //开始时的倍率
        pulse.toValue = 0.8     //结束时的倍率
        // 给tabBarButton添加动画效果
        let tabBarLayer = (tabbarbuttonArray[index] as AnyObject).layer
        tabBarLayer?.add(pulse, forKey: nil)

        //根据所选tab设置动画背景
//        switch index {
//        case 0:
//            tabBar.selectedImage = #imageLiteral(resourceName: "SelectMessagesFace")//.withRenderingMode(.alwaysOriginal)//原图渲染,保持原来的色彩,已经在Asset.xcassets中修改,直接使用即可
//            tabBar.image = #imageLiteral(resourceName: "DidSelectMessagesFace")
//        case 1:
//            tabBar.selectedImage = #imageLiteral(resourceName: "SelectContactsFace")
//            tabBar.image = #imageLiteral(resourceName: "DidSelectContactsFace")
//        case 2:
//            tabBar.selectedImage = #imageLiteral(resourceName: "SelectMoments")
//            tabBar.image = #imageLiteral(resourceName: "DidSelectMoments")
//        default:
//            break
//        }

    }
    //添加tabbar拖动手势
    @IBOutlet var panRecognizer: UIPanGestureRecognizer!
    @IBAction func dragGesture(_ sender: UIPanGestureRecognizer) {
        let startPoint: CGPoint = panRecognizer.location(in: view)
        let panGesOffset = sender.translation(in: view)
        //获取手指位置
        let location = sender.location(in: view)
        //获取屏幕宽度
        let w_1 = UIScreen.main.bounds.size.width/3
        let w_2 = UIScreen.main.bounds.size.width/3*2
        if startPoint.x < w_1 {
            
            print("第一个格子")
        } else if startPoint.x > w_1 && startPoint.x < w_2 {
            print("第二个格子")
        } else if startPoint.x > w_2 {
            print("第三个格子")
        }
    }
    //获取图片view
    //获取图片view
    func getTabBarButtonImageView(tabBar: UITabBarItem) {
        let tabBarButton = tabBar.value(forKey: "view") as! UIControl
        let tabBarSwappableImageView = tabBarButton.value(forKey: "info") as? UIImageView
        print("---------------------------")
        print(tabBarSwappableImageView as Any)
    }
//    func getTabBarButtonImageView(withCurrentVc currentViewController: UITabBarController) -> UIImageView? {
//        let tabBarButton = currentViewController.tabBarItem.value(forKey: "view") as? UIControl
//        if tabBarButton != nil {
//            let tabBarSwappableImageView = tabBarButton?.value(forKey: "info") as? UIImageView
//            if tabBarSwappableImageView != nil {
//                return tabBarSwappableImageView
//            }
//        }
//        return nil
//    }
}
