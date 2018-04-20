//
//  ViewController.swift
//  QQ
//
//  Created by ChingHoi on 2018/4/15.
//  Copyright © 2018年 ChingHoi. All rights reserved.
//

import UIKit


class MainViewController: UITabBarController {
    
    //状态,控制是否已经选中,选中的话点击tabbar不产生动画
    var tabBarSelected: Int = 0
    
    //初始化手指在tabBar触摸的坐标
    var startTabBarLocation: CGPoint = CGPoint(x: 0, y: 0)
    
    //初始化tabbarimage坐标
    var imageViewLocation: CGPoint = CGPoint(x: 0, y: 0)
    
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
            }
        }
    }
    
    // 动画方法
    func animation(index: Int, tabBar: UITabBarItem){

        //缩放参数
        let pulse = CABasicAnimation(keyPath: "transform.scale")
        pulse.timingFunction = CAMediaTimingFunction(name:kCAMediaTimingFunctionEaseInEaseOut)
        pulse.duration = 0.1    //持续时间
        pulse.repeatCount = 1   //重复次数
        pulse.autoreverses = true
        pulse.fromValue = 1.0   //开始时的倍率
        pulse.toValue = 0.8     //结束时的倍率
        
        //获取tabbar上的imageView
        let tabBarButton = tabBar.value(forKey: "view") as! UIControl
        let tabBarSwappableImageView = tabBarButton.value(forKey: "info") as? UIImageView
        
        // 给tabBarButton上的image添加动画效果
        tabBarSwappableImageView?.layer.add(pulse, forKey: nil)
        
        //下面被注释的两行代码表示文字和图片一起动画
//        let tabBarLayer = (tabbarbuttonArray[index] as AnyObject).layer
//        tabBarLayer?.add(pulse, forKey: nil)

    }
    
    //添加tabbar拖动手势
    @IBAction func dragGesture(_ sender: UIPanGestureRecognizer) {
        //手指偏移量
        let panGesOffset = sender.translation(in: view)
        
        let a: CGFloat = 0.1
        let b: CGFloat = 0.05
        
        //获取手指触摸位置
        //let location = sender.location(in: view)
        //获取屏幕宽度
        let w_1 = UIScreen.main.bounds.size.width/3
        let w_2 = UIScreen.main.bounds.size.width/3*2
        
        //将取得图片的CGPoint记录到全局变量 imageViewLocation 中
        imageViewLocation = getTabBarImageView(tabBar: tabBar, item: tabBar.items![0]).center
        //触摸状态检测
        switch sender.state {
        case .began:
            startTabBarLocation  = sender.location(in: view)
            print("开始触摸")
        case .changed:
            if startTabBarLocation.x < w_1 {
                //这里可能是个玄学代码,没有弄懂为什么 上面的 imageViewLocation 不能和要移动的tabBar.items![x]相同
                getTabBarImageView(tabBar: tabBar, item: tabBar.items![0]).center = CGPoint(
                    //总之这里要这么写,其他的写法就不能实现功能
                    x: getTabBarImageView(tabBar: tabBar, item: tabBar.items![1]).center.x + panGesOffset.x * a,
                    y: getTabBarImageView(tabBar: tabBar, item: tabBar.items![1]).center.y + panGesOffset.y * b)
            } else if startTabBarLocation.x > w_1 && startTabBarLocation.x < w_2 {
                getTabBarImageView(tabBar: tabBar, item: tabBar.items![1]).center = CGPoint(
                    x: imageViewLocation.x + panGesOffset.x * a,
                    y: imageViewLocation.y + panGesOffset.y * b)
            } else if startTabBarLocation.x > w_2 {
                getTabBarImageView(tabBar: tabBar, item: tabBar.items![2]).center = CGPoint(
                    x: imageViewLocation.x + panGesOffset.x * a,
                    y: imageViewLocation.y + panGesOffset.y * b)
            }
            print("正在触摸")
            //fallthrough
        //不同于其它语言的switch case，fallthrough表示这个case完成了，它还可以继续下个case，而不是break
        case .ended:
            //imageView回到原位
            if startTabBarLocation.x < w_1 {
                //这里可能是个玄学代码,没有弄懂为什么 上面的 imageViewLocation 不能和要移动的tabBar.items![x]相同
                getTabBarImageView(tabBar: tabBar, item: tabBar.items![0]).center = CGPoint(
                    //总之这里要这么写,其他的写法就不能实现功能
                    x: getTabBarImageView(tabBar: tabBar, item: tabBar.items![1]).center.x,
                    y: getTabBarImageView(tabBar: tabBar, item: tabBar.items![1]).center.y)
            } else if startTabBarLocation.x > w_1 && startTabBarLocation.x < w_2 {
                getTabBarImageView(tabBar: tabBar, item: tabBar.items![1]).center = imageViewLocation
            } else if startTabBarLocation.x > w_2 {
                getTabBarImageView(tabBar: tabBar, item: tabBar.items![2]).center = imageViewLocation
            }
            print("触摸结束")
            break
        default: break
        }
    }
    //返回一个 UIImageView 类型的 TabBarImageView
    func getTabBarImageView(tabBar: UITabBar, item: UITabBarItem) -> UIImageView {
        var tabBarSwappableImageView: UIImageView!
        // 使用枚举遍历,判断选中的tabBarItem等于数组中的第几个
        for (_,v) in (tabBar.items?.enumerated())! {
            if v == item {
                //获取tabbar上的imageView
                let tabBarButton = v.value(forKey: "view") as! UIControl
                tabBarSwappableImageView = tabBarButton.value(forKey: "info") as! UIImageView
            }
        }
        return tabBarSwappableImageView
    }
}
