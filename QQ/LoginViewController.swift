//
//  LoginViewController.swift
//  QQ
//
//  Created by ChingHoi on 2018/4/20.
//  Copyright © 2018年 ChingHoi. All rights reserved.
//

import UIKit
import LeanCloud

class LoginViewController: UIViewController {
    //隐藏状态栏
    override var prefersStatusBarHidden: Bool {
        return true
    }
    //点击空白处隐藏键盘(全局)
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //此处 ! 其他界面点击空白处会产生崩溃的bug,故修改接口为 ? (可选),见下方接口处
        userName.resignFirstResponder()
        password.resignFirstResponder()
    }
    //背景图片
    @IBOutlet var background: UIImageView!
    
    //用户名 密码 登录 控件所在的 Vertical Stack View
    @IBOutlet weak var childView: UIStackView!
    //用户名 密码 登录
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var loginBtn: UIButton!
    
    override func viewDidLoad() {
        //为X适配背景图
        if UIDevice.current.isX() {
            background.image = #imageLiteral(resourceName: "login_backgroundImageX")
        } else {
            background.image = #imageLiteral(resourceName: "login_backgroundImage")
        }
        //添加半透明遮罩
        let backgroundShade = UIView()
        backgroundShade.frame = background.frame
        backgroundShade.backgroundColor = UIColor(red: CGFloat(40 / 255.0), green: CGFloat(40 / 255.0), blue: CGFloat(40 / 255.0), alpha: 1.0)
        backgroundShade.alpha = 0.4
        //将遮罩视图添加到背景图片视图上
        background.addSubview(backgroundShade)
        //将 用户名 密码 登录 控件所在的 Vertical Stack View 添加到背景图层上
        background.addSubview(childView)
        
        //设置占位符颜色和字体大小
        let userPlaceholser = [NSAttributedStringKey.foregroundColor : UIColor(red: CGFloat(190 / 255.0), green: CGFloat(190 / 255.0), blue: CGFloat(190 / 255.0), alpha: 1.0),
                                     NSAttributedStringKey.font : UIFont.systemFont(ofSize: 22)] as [NSAttributedStringKey : Any]
        userName.attributedPlaceholder = NSAttributedString(string: "QQ号/手机号/邮箱",attributes: userPlaceholser)
        userName.font = UIFont.systemFont(ofSize: 20)
        userName.textColor = UIColor.white
        userName.backgroundColor = UIColor.clear
        userName.borderStyle = .none
        userName.keyboardType = UIKeyboardType.numbersAndPunctuation
        userName.clearButtonMode = .whileEditing  //编辑时出现清除按钮
        //添加下划线
        addBorderLine(X: 0, Y: userName.frame.maxY, width: userName.frame.width, height: 0.3, coloer: UIColor.white, layer: userName.layer)

        
        //设置占位符颜色和字体大小
        let pswPlaceholser = [NSAttributedStringKey.foregroundColor : UIColor(red: CGFloat(190 / 255.0), green: CGFloat(190 / 255.0), blue: CGFloat(190 / 255.0), alpha: 1.0),
                                     NSAttributedStringKey.font : UIFont.systemFont(ofSize: 22)] as [NSAttributedStringKey : Any]
        password.attributedPlaceholder = NSAttributedString(string: "密码",attributes: pswPlaceholser)
        password.font = UIFont.systemFont(ofSize: 22)
        password.textColor = UIColor.white
        password.backgroundColor = UIColor.clear
        password.borderStyle = .none
        password.clearButtonMode = .whileEditing  //编辑时出现清除按钮
        password.isSecureTextEntry = true         //不显示密码
        password.returnKeyType = UIReturnKeyType.join //登录
        //添加下划线
        addBorderLine(X: 0, Y: password.frame.maxY, width: password.frame.width, height: 0.3, coloer: UIColor.white, layer: userName.layer)
        
        loginBtn.setTitle("登录", for: .normal)
        loginBtn.tintColor = UIColor.white
        loginBtn.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        loginBtn.setBackgroundImage(#imageLiteral(resourceName: "armap_wg_button_blue"), for: .normal)
        loginBtn.showsTouchWhenHighlighted = false
        loginBtn.alpha = 0.8

        
    }

    @IBAction func loginBtn(_ sender: UIButton) {
        userName.resignFirstResponder()
        password.resignFirstResponder()

        if (userName.text != nil) && (password.text != nil) {
            LCUser.logIn(username: "1234", password: "1234") { result in
                switch result {
                case .success(let user):
                    self.performSegue(withIdentifier: "mainView", sender: nil)
                    break
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
    /**
     UIView 扩展画线
     
     - parameter X:      X 线的X
     - parameter Y:      Y 线的X
     - parameter width:  width 线的width
     - parameter height: height 线的height
     - parameter coloer: coloer 线的颜色
     */
    func addBorderLine(X: CGFloat, Y: CGFloat, width: CGFloat, height: CGFloat, coloer: UIColor, layer: CALayer)  {
        let border = CALayer()
        border.backgroundColor = coloer.cgColor
        border.frame = CGRect(x: X, y: Y + 8, width: width, height: height)
        layer.addSublayer(border)
    }
}

//判断是否是 iPhone X
extension UIDevice {
    public func isX() -> Bool {
        if UIScreen.main.bounds.height == 812 {
            return true
        }
        return false
    }
}


