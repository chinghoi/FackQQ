//
//  SearchResultVC.swift
//  QQ
//
//  Created by chinghoi on 2018/5/10.
//  Copyright © 2018年 ChingHoi. All rights reserved.
//

import UIKit

class SearchResultVC: UIViewController {
    
    //搜索控制器
    var customSearchBar: CustomSearchBar!
    
    @IBOutlet weak var searchViewBackground: UIView!
    
    @IBOutlet weak var searchBarTxt: UITextField!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        //设置顶栏字体颜色为黑色
        UIApplication.shared.statusBarStyle = UIStatusBarStyle.default
        //searchBar设置圆角
        searchViewBackground.layer.cornerRadius = 3
        
        //进入界面打开键盘
        searchBarTxt.becomeFirstResponder()
        
        searchBarTxt.clearButtonMode = .whileEditing
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //view.backgroundColor = UIColor.white
        print("----------------------------")
    }
//    /// searchBar的配置
//    ///
//    /// - Parameters:
//    ///   - frame: searchBar的frame
//    ///   - font: 字体大小
//    ///   - textColor: 文字颜色
//    ///   - bgColor: 背景颜色
//    func configureSearchBar(frame: CGRect, font: UIFont, textColor: UIColor, bgColor: UIColor) {
//        customSearchBar = CustomSearchBar(frame: frame, font: font , textColor: textColor)
//
//        customSearchBar.barTintColor = bgColor
//        customSearchBar.tintColor = textColor
//        customSearchBar.placeholder = "搜索"
//        //设置图片填充显示
//        let backgroundImage = #imageLiteral(resourceName: "headerImage").resizableImage(withCapInsets: UIEdgeInsets.zero, resizingMode: .stretch)
//        customSearchBar.setBackgroundImage(backgroundImage, for: .top, barMetrics: .default)
//        customSearchBar.showsCancelButton = true
//
//        customSearchBar.delegate = self
//    }
    @IBAction func cancelBtn(_ sender: UIButton) {
        sender.resignFirstResponder()
        dismiss(animated: false, completion: nil)
    }
}
extension SearchResultVC: UISearchBarDelegate {
    
}
