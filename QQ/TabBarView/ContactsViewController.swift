//
//  MessageViewController.swift
//  QQ
//
//  Created by chinghoi on 2018/5/10.
//  Copyright © 2018年 ChingHoi. All rights reserved.
//

import UIKit

class ContactsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    //屏幕可偏移距离
    //let leftMenuWidth = CWLateralSlideConfiguration()
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        //设置图片填充显示
        let backgroundImage = #imageLiteral(resourceName: "header_bg_message").resizableImage(withCapInsets: UIEdgeInsets.zero, resizingMode: .stretch)
        //设置导航栏背景图片
        navigationController?.navigationBar.setBackgroundImage(backgroundImage, for: .default)
        
        //添加一个观察者
        NotificationCenter.default.addObserver(self, selector: #selector(qRInfoView), name: NSNotification.Name(rawValue: "QRInfoView"), object: nil)
        
    }
    @IBAction func sideMenuBtn(_ sender: UIButton) {
        print("侧滑菜单点击成功")
        NotificationCenter.default.post(name: NSNotification.Name("IsSideMenuOpen"), object: nil)
    }
    
    
    @IBAction func sideMenu(_ sender: UIScreenEdgePanGestureRecognizer) {
        let translation = sender.translation(in: self.view)
        sender.edges = .left
        if sender.state == .recognized {
            print("cehua-----------1----------")
            
        }
    }
    //通知处理方法
    @objc func qRInfoView() {
        performSegue(withIdentifier: "QRInfoView", sender: nil)
    }
}
