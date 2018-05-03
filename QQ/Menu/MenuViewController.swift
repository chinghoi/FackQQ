//
//  MenuViewController.swift
//  QQ
//
//  Created by ChingHoi on 2018/4/23.
//  Copyright © 2018年 ChingHoi. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let titlesDictionary = ["激活会员", "QQ钱包", "个性装扮", "我的收藏", "我的相册", "我的文件", "免流量特权"]
    let imageDictionary = [#imageLiteral(resourceName: "sidebar_vip_shadow"), #imageLiteral(resourceName: "sidebar_purse"), #imageLiteral(resourceName: "sidebar_decoration"), #imageLiteral(resourceName: "sidebar_favorit"), #imageLiteral(resourceName: "sidebar_album"), #imageLiteral(resourceName: "sidebar_file"), #imageLiteral(resourceName: "sidebar_freetraffic")]
    
    
    @IBOutlet weak var leftTableView: UITableView!
    
    override func viewDidLoad() {
        
        //声明tableView的代理和数据源
        leftTableView.delegate = self
        leftTableView.dataSource = self
        
        leftTableView.tableFooterView = UIView()
    }
    //表格视图中的cell个数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titlesDictionary.count
    }
    //设置每个 cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //从tableview的重用池里通过cellID取一个cell(单元格复用)
        let cell = tableView.dequeueReusableCell(withIdentifier: "menuViewCell", for: indexPath)
        cell.textLabel?.text = titlesDictionary[indexPath.row]
        cell.imageView?.image = imageDictionary[indexPath.row]
        return cell
    }
}
