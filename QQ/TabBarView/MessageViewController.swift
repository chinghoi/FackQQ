//
//  MessageViewController.swift
//  QQ
//
//  Created by chinghoi on 2018/5/10.
//  Copyright © 2018年 ChingHoi. All rights reserved.
//

import UIKit

class MessagesViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    //搜索控制器
    var searchController: UISearchController!
    
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
        
        initializeSearchController()
        
        //添加一个观察者
        NotificationCenter.default.addObserver(self, selector: #selector(qRInfoView), name: NSNotification.Name(rawValue: "QRInfoView"), object: nil)
        
    }
    
    func initializeSearchController() {
        
        let searchResultVC = SearchResultVC()
        
        searchController = UISearchController(searchResultsController: searchResultVC)
        
        searchController.searchBar.placeholder = "搜索"
        
        searchController.hidesNavigationBarDuringPresentation = true
        //调整高度
        searchController.searchBar.frame.size = CGSize(width: UIScreen.main.bounds.size.width, height: 44)
        searchController.loadViewIfNeeded()
        definesPresentationContext = true
        
        tableView.tableHeaderView = searchController.searchBar
        //searchBar代理
        searchController.searchBar.delegate = self
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
// MARK:----表视图代理
extension MessagesViewController: UITableViewDelegate {
}
// MARK:----表视图数据
extension MessagesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titlesDictionary.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "messageTableView", for: indexPath)
        cell.textLabel?.text = titlesDictionary[indexPath.row]
        cell.imageView?.image = imageDictionary[indexPath.row]
        
        return cell
    }
}
// MARK:---- searchBar
extension MessagesViewController: UISearchBarDelegate {
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        print("-beain editing-")
        //调整高度
        searchController.searchBar.frame.size = CGSize(width: UIScreen.main.bounds.size.width, height: 44)
    }
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        print("-end editing-")
        //调整高度
        searchController.searchBar.frame.size = CGSize(width: UIScreen.main.bounds.size.width, height: 44)
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        print("-cancel-")
    }
}
