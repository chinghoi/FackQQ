//
//  CustomSearchBar.swift
//  QQ
//
//  Created by chinghoi on 2018/5/17.
//  Copyright © 2018年 ChingHoi. All rights reserved.
//

import UIKit

class CustomSearchBar: UISearchBar {
    
    var preferredFont: UIFont!
    var preferredTextColor: UIColor!
    
    override func draw(_ rect: CGRect) {
        // 获取搜索栏子视图中搜索输入框的下标
        if let index = indexOfSearchFieldInSubviews() {
            // 获取搜索输入框
            let searchField: UITextField = subviews[0].subviews[index] as! UITextField
            
            // 设置 frame
            searchField.frame = CGRect(x: 5.0, y: 5.0, width: frame.size.width - 10.0, height: frame.size.height - 10.0)

            // 设置字体和文字颜色
            searchField.font = preferredFont
            searchField.textColor = preferredTextColor
            
            // 设置背景颜色
            searchField.backgroundColor = barTintColor
        }
        
        super.draw(rect)
    }
    
    init(frame: CGRect, font: UIFont, textColor: UIColor) {
        super.init(frame: frame)
        
        self.frame = frame
        preferredFont = font
        preferredTextColor = textColor
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        //fatalError("init(coder:) has not been implemented")
    }
    
    /// 获取搜索框中的输入框
    ///
    /// - Returns: 搜索栏子视图中输入框的下标
    func indexOfSearchFieldInSubviews() -> Int! {
        var index: Int!
        let searchBarView = subviews[0]
        
        for i in (0...searchBarView.subviews.count) {
            if searchBarView.subviews[i].isKind(of: UITextField.self) {
                index = i
                break
            }
        }
        return index
    }
}


