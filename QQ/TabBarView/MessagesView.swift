//
//  MessagesView.swift
//  QQ
//
//  Created by ChingHoi on 2018/4/15.
//  Copyright © 2018年 ChingHoi. All rights reserved.
//

import UIKit
import CWLateralSlide

class MessagesView: UIViewController {
    
    override func viewDidLoad() {
        cw_registerShowIntractive(withEdgeGesture: true) { (_ direction: CWDrawerTransitionDirection) in
            if direction == CWDrawerTransitionDirection.fromLeft {
                let vc = UIStoryboard(name: "Main", bundle:nil).instantiateViewController(withIdentifier: "MenuViewController")
                
                // 调用这个方法
                self.cw_showDefaultDrawerViewController(vc)
            } else if direction == CWDrawerTransitionDirection.fromRight {
                print("youhua")
            }
        }
    }
    @IBAction func menu(_ sender: UIButton) {
        let vc = UIStoryboard(name: "Main", bundle:nil).instantiateViewController(withIdentifier: "MenuViewController")

        // 调用这个方法
        cw_showDefaultDrawerViewController(vc)
    }
}

