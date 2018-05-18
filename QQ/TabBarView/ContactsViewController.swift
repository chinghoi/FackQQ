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
    
    //var searchController: UISearchController!
    
    var searchBtn = UIButton(type: UIButtonType.custom)
    
    let titlesDictionary = ["激活会员", "QQ钱包", "个性装扮", "我的收藏", "我的相册", "我的文件", "免流量特权", "激活会员", "QQ钱包", "个性装扮", "我的收藏", "我的相册", "我的文件", "免流量特权"]
    let imageDictionary = [#imageLiteral(resourceName: "sidebar_vip_shadow"), #imageLiteral(resourceName: "sidebar_purse"), #imageLiteral(resourceName: "sidebar_decoration"), #imageLiteral(resourceName: "sidebar_favorit"), #imageLiteral(resourceName: "sidebar_album"), #imageLiteral(resourceName: "sidebar_file"), #imageLiteral(resourceName: "sidebar_freetraffic"), #imageLiteral(resourceName: "sidebar_vip_shadow"), #imageLiteral(resourceName: "sidebar_purse"), #imageLiteral(resourceName: "sidebar_decoration"), #imageLiteral(resourceName: "sidebar_favorit"), #imageLiteral(resourceName: "sidebar_album"), #imageLiteral(resourceName: "sidebar_file"), #imageLiteral(resourceName: "sidebar_freetraffic")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //设置图片填充显示
        let backgroundImage = #imageLiteral(resourceName: "header_bg_message").resizableImage(withCapInsets: UIEdgeInsets.zero, resizingMode: .stretch)
        //设置导航栏背景图片
        navigationController?.navigationBar.setBackgroundImage(backgroundImage, for: .default)
        
        //表视图数据及代理
        tableView.dataSource = self
        tableView.delegate = self
        
        searchBtn.setBackgroundImage(#imageLiteral(resourceName: "headerImage"), for: .normal)
        searchBtn.frame.size = CGSize(width: tableView.bounds.width, height: 44)
        searchBtn.addTarget(self, action: #selector(searchBtn(_:)), for: .touchUpInside)
        tableView.tableHeaderView = searchBtn

    }
    @objc func searchBtn(_ sender: UIButton) {
        let searchResultVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SearchResultVC")
        present(searchResultVC, animated: false, completion: nil)
    }
//    func configurationSearchController() {
//        let searchResultVC = SearchResultVC()
//        searchController = UISearchController(searchResultsController: searchResultVC)
//
//        searchController.hidesNavigationBarDuringPresentation = true
//        searchController.dimsBackgroundDuringPresentation = true
//
//        //searchController.searchResultsUpdater = searchResultVC
//        searchController.delegate = self
//        searchController.searchBar.delegate = self
//    }
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
        let qRInfoViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "QRInfoView")
        navigationController?.pushViewController(qRInfoViewController, animated: true)
    }
}
extension ContactsViewController: UITableViewDelegate {
    
}
extension ContactsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titlesDictionary.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "contactsTableView", for: indexPath)
        cell.textLabel?.text = titlesDictionary[indexPath.row]
        cell.imageView?.image = imageDictionary[indexPath.row]
        
        return cell
    }
}
