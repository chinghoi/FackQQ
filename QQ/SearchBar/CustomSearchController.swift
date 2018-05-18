//
//  CustomSearchController.swift
//  QQ
//
//  Created by chinghoi on 2018/5/17.
//  Copyright © 2018年 ChingHoi. All rights reserved.
//

import UIKit

//protocol CustomSearchControllerDelegate {
//    func didStartSearching()
//
//    func didTapOnSearchButton()
//
//    func didTapOnCancelButton()
//
//    func didChangeSearchText(searchText: String)
//}

class CustomSearchController: UISearchController {

    var customSearchBar: CustomSearchBar!
    
    //var customDelegate: CustomSearchControllerDelegate!
    
    /// 自定义初始化方法
    ///
    /// - Parameters:
    ///   - searchResultsController: 用于显示搜索结果的视图控制器
    ///   - searchBarFrame: 搜索栏的 frame
    ///   - searchBarFont: 搜索输入框的字体大小
    ///   - searchBarTextColor: 搜索输入框的字体颜色
    ///   - searchBarTintColor: 搜索栏的主题色
    init(searchResultsController: UIViewController!, searchBarFrame: CGRect, searchBarFont: UIFont, searchBarTextColor: UIColor, searchBarTintColor: UIColor) {
        super.init(searchResultsController: searchResultsController)
        
        configureSearchBar(frame: searchBarFrame, font: searchBarFont, textColor: searchBarTextColor, bgColor: searchBarTintColor)
    }
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    /// searchBar的配置
    ///
    /// - Parameters:
    ///   - frame: searchBar的frame
    ///   - font: 字体
    ///   - textColor: 文字颜色
    ///   - bgColor: 背景颜色
    func configureSearchBar(frame: CGRect, font: UIFont, textColor: UIColor, bgColor: UIColor) {
        customSearchBar = CustomSearchBar(frame: frame, font: font , textColor: textColor)
        
        customSearchBar.barTintColor = bgColor
        customSearchBar.tintColor = textColor
        customSearchBar.showsBookmarkButton = false
        customSearchBar.showsCancelButton = true
        
        //customSearchBar.delegate = self
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
//extension CustomSearchController: UISearchBarDelegate {
//
//    // 搜索框开始编辑时
//    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
//        customDelegate.didStartSearching()
//    }
//
//    // 键盘上的搜索按钮点击时
//    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
//        customSearchBar.resignFirstResponder()
//        customDelegate.didTapOnSearchButton()
//    }
//
//    // 搜索栏上的取消按钮点击时
//    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
//        customSearchBar.resignFirstResponder()
//        customDelegate.didTapOnCancelButton()
//    }
//
//    // 搜索关键字变化时
//    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//        customDelegate.didChangeSearchText(searchText: searchText)
//    }
//}
