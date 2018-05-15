//
//  SearchResultVC.swift
//  QQ
//
//  Created by chinghoi on 2018/5/10.
//  Copyright © 2018年 ChingHoi. All rights reserved.
//

import UIKit

class SearchResultVC: UIViewController {
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        view.backgroundColor = UIColor.red
        print("---------------++++++++++-------------")
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        view.backgroundColor = UIColor.white
        print("----------------------------")
    }
}
