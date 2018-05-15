////
////  MessagesView.swift
////  QQ
////
////  Created by ChingHoi on 2018/4/15.
////  Copyright © 2018年 ChingHoi. All rights reserved.
////
//
//import UIKit
//import CWLateralSlide
//
//class MessagesView: UIViewController {
//    
//    var searchController = UISearchController()
//    
//    let titlesDictionary = ["激活会员", "QQ钱包", "个性装扮", "我的收藏", "我的相册", "我的文件", "免流量特权", "激活会员", "QQ钱包", "个性装扮", "我的收藏", "我的相册", "我的文件", "免流量特权"]
//    let imageDictionary = [#imageLiteral(resourceName: "sidebar_vip_shadow"), #imageLiteral(resourceName: "sidebar_purse"), #imageLiteral(resourceName: "sidebar_decoration"), #imageLiteral(resourceName: "sidebar_favorit"), #imageLiteral(resourceName: "sidebar_album"), #imageLiteral(resourceName: "sidebar_file"), #imageLiteral(resourceName: "sidebar_freetraffic"), #imageLiteral(resourceName: "sidebar_vip_shadow"), #imageLiteral(resourceName: "sidebar_purse"), #imageLiteral(resourceName: "sidebar_decoration"), #imageLiteral(resourceName: "sidebar_favorit"), #imageLiteral(resourceName: "sidebar_album"), #imageLiteral(resourceName: "sidebar_file"), #imageLiteral(resourceName: "sidebar_freetraffic")]
//    
//    //初始化searchBar选定状态变量
//    //var searchBarStatus = SearchIsSelected.select
//    
//    //let searchBar = UISearchBar()
//   
//    
//    //定义屏幕可偏移距离
//    let leftMenuWidth = CWLateralSlideConfiguration()
//    
//    @IBOutlet weak var headerBackgroundImg: UIImageView!
//    @IBOutlet weak var messagesNavBar: UINavigationBar!
//    @IBOutlet weak var messagesTableView: UITableView!
//    
//    override func viewDidLoad() {
//        
//        super.viewDidLoad()
//        
//        configureSearchController()
//        
//        configMenu()
//        
//        configNavBar()
//        
//        //声明tableView的代理和数据源
//        messagesTableView.delegate = self
//        messagesTableView.dataSource = self
//        
//    }
//    func configNavBar() {
//        //设置状态栏透明
//        messagesNavBar.setBackgroundImage(UIImage(), for: .default)
//        messagesNavBar.shadowImage = UIImage()
//        messagesNavBar.isTranslucent = true
//    }
//    func configMenu() {
//        //添加右滑菜单
//        cw_registerShowIntractive(withEdgeGesture: true) { (_ direction: CWDrawerTransitionDirection) in
//            if direction == CWDrawerTransitionDirection.fromLeft {
//                let vc = UIStoryboard(name: "Main", bundle:nil).instantiateViewController(withIdentifier: "MenuViewController")
//                
//                //调用显示视图
//                self.leftMenuWidth.distance = 0.8 * Float(UIScreen.main.bounds.width)
//                self.cw_showDrawerViewController(vc, animationType: .default, configuration: self.leftMenuWidth)
//            } else if direction == CWDrawerTransitionDirection.fromRight {
//                print("youhua")
//            }
//        }
//    }
//    func configureSearchController() {
//        
//        // 初始化搜索控制器，并且进行最小化的配置
//        searchController = UISearchController(searchResultsController: nil)
//        searchController.searchResultsUpdater = self
//
//        searchController.searchBar.placeholder = "Search..."
//        
//        searchController.dimsBackgroundDuringPresentation = false
//        searchController.hidesNavigationBarDuringPresentation = true
//        searchController.searchBar.sizeToFit()
//        searchController.loadViewIfNeeded()
//        definesPresentationContext = true
//
//        messagesTableView.tableHeaderView = searchController.searchBar
//    }
//    @IBAction func menu(_ sender: UIButton) {
//        let vc = UIStoryboard(name: "Main", bundle:nil).instantiateViewController(withIdentifier: "MenuViewController")
//
//        //调用显示视图
//        self.leftMenuWidth.distance = 0.8 * Float(UIScreen.main.bounds.width)
//        self.cw_showDrawerViewController(vc, animationType: .default, configuration: self.leftMenuWidth)
//    }
//}
//////消息界面 searchBar 选取状态
////enum SearchIsSelected {
////    case select //可选定状态
////    case unSelect //不可选定状态
////}
//
//// MARK:----表视图代理
//extension MessagesView: UITableViewDelegate {
//    
////    //设置 grouped 风格的 header 高度
////    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
////        if section == 0 {
////            return CGFloat(44)
////        }
////        return tableView.sectionHeaderHeight
////    }
//}
//// MARK:----表视图数据
//extension MessagesView: UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return titlesDictionary.count
//    }
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        
//        let cell = tableView.dequeueReusableCell(withIdentifier: "messagesTableView", for: indexPath)
//        cell.textLabel?.text = titlesDictionary[indexPath.row]
//        cell.imageView?.image = imageDictionary[indexPath.row]
//        
//        return cell
//    }
//}
//// MARK:----滚动视图代理
//extension MessagesView: UIScrollViewDelegate {
//    
//    //设置 搜索按钮到 header
////    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
////        // && (searchBarStatus == .select)
////        if section == 0 {
////
////            searchBar.frame = tableView.frame
////            return searchBar
////        }
////        return tableView
////    }
//    
//    //判断用户拖动完成后搜索框是否显示
//    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
//        
////        //判断是否显示搜索header
////        if scrollView.contentOffset.y < CGFloat(22) {
////
////            targetContentOffset.pointee.y = CGFloat(0)
////
////        } else if scrollView.contentOffset.y >= CGFloat(22) && scrollView.contentOffset.y < CGFloat(44) {
////
////            targetContentOffset.pointee.y = CGFloat(44)
////        }
//    }
//}
//// MARK:----搜索按钮代理
//extension MessagesView: UISearchBarDelegate {
//    
////    //用户点击searchBar时的动作
////    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
////        searchBar.showsCancelButton = true
////        print("-----------------------------")
//////        UIView.animate(withDuration: 0.5) {
//////            //上移 导航栏
//////            self.messagesNavBar.transform = CGAffineTransform(translationX: 0, y: 100)
//////            //隐藏image
//////            self.headerBackgroundImg.isHidden = true
//////            //设置顶栏字体颜色为黑色
//////            UIApplication.shared.statusBarStyle = UIStatusBarStyle.default
//////            //上移searchBar
//////            searchBar.frame.origin = CGPoint(x: 0, y: -44)
//////            print(UIApplication.shared.statusBarFrame.height)
//////            searchBar.showsCancelButton = true
//////        }
////    }
////
////    //searchBar点击取消时的动作
////    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
////        //恢复导航栏
////        //messagesNavBar.transform = CGAffineTransform(translationX: 0, y: 0)
////        //改变状态栏字体颜色
////        UIApplication.shared.statusBarStyle = UIStatusBarStyle.lightContent
////        //显示image
////        headerBackgroundImg.isHidden = false
////    }
//}
////MARK:----实现UISearchControllerDelegate协议
//extension MessagesView: UISearchControllerDelegate {
//    
//}
////MARK:----实现UISearchResultsUpdating协议
//extension MessagesView: UISearchResultsUpdating {
//    func updateSearchResults(for searchController: UISearchController) {
//        
//    }
//}
//
