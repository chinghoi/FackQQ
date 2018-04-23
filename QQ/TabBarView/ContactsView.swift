//
//  contacts.swift
//  QQ
//
//  Created by ChingHoi on 2018/4/15.
//  Copyright © 2018年 ChingHoi. All rights reserved.
//

import UIKit

class ContactsView: UIViewController {
    
    @IBOutlet var leftSlideGesture: UIScreenEdgePanGestureRecognizer!
    
    override func viewDidLoad() {
        //设置从屏幕哪个边开始滑动
        leftSlideGesture.edges = .left
    }
    @IBAction func leftSGAction(_ sender: UIScreenEdgePanGestureRecognizer) {
        print("左滑")
    }
}
