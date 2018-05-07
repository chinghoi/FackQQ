//
//  MessagesView.swift
//  QQ
//
//  Created by ChingHoi on 2018/4/15.
//  Copyright © 2018年 ChingHoi. All rights reserved.
//

import UIKit
import CWLateralSlide

class MessagesView: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let titlesDictionary = ["激活会员", "QQ钱包", "个性装扮", "我的收藏", "我的相册", "我的文件", "免流量特权"]
    let imageDictionary = [#imageLiteral(resourceName: "sidebar_vip_shadow"), #imageLiteral(resourceName: "sidebar_purse"), #imageLiteral(resourceName: "sidebar_decoration"), #imageLiteral(resourceName: "sidebar_favorit"), #imageLiteral(resourceName: "sidebar_album"), #imageLiteral(resourceName: "sidebar_file"), #imageLiteral(resourceName: "sidebar_freetraffic")]
    
    //设置屏幕可偏移距离
    let leftMenuWidth = CWLateralSlideConfiguration()
    
    @IBOutlet weak var messagesNavBar: UINavigationBar!
    @IBOutlet weak var messagesTableView: UITableView!
    
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
        messagesNavBar.setBackgroundImage(UIImage(), for: .default)
        messagesNavBar.shadowImage = UIImage()
        messagesNavBar.isTranslucent = true
        
        //声明tableView的代理和数据源
        messagesTableView.delegate = self
        messagesTableView.dataSource = self
    }
    @IBAction func searchBtn(_ sender: UIButton) {
        print("点击成功")
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
    func headerIsTapEvent() {
        print("点击成功")
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titlesDictionary.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "messagesTableView", for: indexPath)
        cell.textLabel?.text = titlesDictionary[indexPath.row]
        cell.imageView?.image = imageDictionary[indexPath.row]
        
        return cell
    }
    
    @IBAction func menu(_ sender: UIButton) {
        let vc = UIStoryboard(name: "Main", bundle:nil).instantiateViewController(withIdentifier: "MenuViewController")

        //调用显示视图
        self.leftMenuWidth.distance = 0.8 * Float(UIScreen.main.bounds.width)
        self.cw_showDrawerViewController(vc, animationType: .default, configuration: self.leftMenuWidth)
    }
}
//列表菜单
//struct Menu {
//    var ico: UIImage //图标
//    var title: String //功能名称
//}

