//
//  MenuViewController.swift
//  QQ
//
//  Created by ChingHoi on 2018/4/23.
//  Copyright © 2018年 ChingHoi. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {
    
    let titlesDictionary = ["激活会员", "QQ钱包", "个性装扮", "我的收藏", "我的相册", "我的文件", "免流量特权"]
    let imageDictionary = [#imageLiteral(resourceName: "sidebar_vip_shadow"), #imageLiteral(resourceName: "sidebar_purse"), #imageLiteral(resourceName: "sidebar_decoration"), #imageLiteral(resourceName: "sidebar_favorit"), #imageLiteral(resourceName: "sidebar_album"), #imageLiteral(resourceName: "sidebar_file"), #imageLiteral(resourceName: "sidebar_freetraffic")]
    
    
    @IBOutlet weak var leftTableView: UITableView!
    @IBOutlet weak var settingsBtn: UIButton!
    @IBOutlet weak var neightBtn: UIButton!
    @IBOutlet weak var weatherBtn: UIButton!
    
    override func viewDidLoad() {
        
        //隐藏tableViewcell之间的横线
        leftTableView.separatorStyle = .none
        
        //声明tableView的代理和数据源
        leftTableView.delegate = self
        leftTableView.dataSource = self
        
        leftTableView.tableFooterView = UIView()
        
        //设置侧滑视图地下三个按钮
        //systemFont(ofSize: 12,weight: UIFont.Weight.regular) 其中weight表示字体粗细,枚举类型
        settingsBtn.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: UIFont.Weight.regular)
        //初始化tabbar无需使用.alwaysOriginal原图渲染,保持原来的色彩,已经在Asset.xcassets中修改,直接使用即可
        settingsBtn.set(image: #imageLiteral(resourceName: "sidebar_setting"), title: "设置", titlePosition: .bottom, additionalSpacing: 10.0, state: .normal)
        
        neightBtn.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: UIFont.Weight.regular)
        neightBtn.set(image: #imageLiteral(resourceName: "sidebar_nightmode_off"), title: "夜间", titlePosition: .bottom, additionalSpacing: 10.0, state: .normal)
        
        weatherBtn.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: UIFont.Weight.regular)
        weatherBtn.set(image: #imageLiteral(resourceName: "sidebar_setting"), title: "乐山", titlePosition: .bottom, additionalSpacing: 10.0, state: .normal)
    }
    
    @IBAction func qrInfo(_ sender: UIButton) {
        //关闭侧边菜单后push
        NotificationCenter.default.post(name: NSNotification.Name("IsSideMenuOpen"), object: nil)
        NotificationCenter.default.post(name: NSNotification.Name("QRInfoView"), object: nil)
    }
    @IBAction func setting(_ sender: UIButton) {
        NotificationCenter.default.post(name: NSNotification.Name("IsSideMenuOpen"), object: nil)
        NotificationCenter.default.post(name: NSNotification.Name("SettingView"), object: nil)
    }
    
}
extension MenuViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        NotificationCenter.default.post(name: NSNotification.Name("IsSideMenuOpen"), object: nil)
        
        switch indexPath.row {
        case 0: NotificationCenter.default.post(name: NSNotification.Name("VIPView"), object: nil)
        case 1: NotificationCenter.default.post(name: NSNotification.Name("QQWalletView"), object: nil)
        case 2: NotificationCenter.default.post(name: NSNotification.Name("ThemeView"), object: nil)
        case 3: NotificationCenter.default.post(name: NSNotification.Name("CollectView"), object: nil)
        case 4: NotificationCenter.default.post(name: NSNotification.Name("PhotoView"), object: nil)
        case 5: NotificationCenter.default.post(name: NSNotification.Name("FileView"), object: nil)
        case 6: NotificationCenter.default.post(name: NSNotification.Name("SpecialView"), object: nil)
        default: break
        }
    }
}
extension MenuViewController: UITableViewDataSource {
    //表格视图中的cell个数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titlesDictionary.count
    }
    //设置每个 cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //从tableview的重用池里通过cellID取一个cell(单元格复用)
        let cell = tableView.dequeueReusableCell(withIdentifier: "menuViewCell", for: indexPath)
        cell.textLabel?.text = titlesDictionary[indexPath.row]
        cell.imageView?.image = imageDictionary[indexPath.row]
        return cell
        
    }
    
}

//图标在上文字在下按钮扩展
extension UIButton {
    
    /// 根据输入的参数设置按钮上图标与文字的位置
    ///
    /// - Parameters:
    ///   - anImage: 设置的图标
    ///   - title: 按钮上的标题
    ///   - titlePosition: 标题相对图标位置
    ///   - additionalSpacing: 图标和按钮间距
    ///   - state: 使用指定标题的状态。 这些值在UIControlState中进行了描述
    @objc func set(image anImage: UIImage?, title: String,
                   titlePosition: UIViewContentMode, additionalSpacing: CGFloat, state: UIControlState){
        self.imageView?.contentMode = .center
        self.setImage(anImage, for: state)
        
        positionLabelRespectToImage(title: title, position: titlePosition, spacing: additionalSpacing)
        
        self.titleLabel?.contentMode = .center
        self.setTitle(title, for: state)
    }
    
    private func positionLabelRespectToImage(title: String, position: UIViewContentMode,
                                             spacing: CGFloat) {
        let imageSize = imageRect(forContentRect: self.frame)
        let titleFont = titleLabel?.font
        let titleSize = title.size(withAttributes: [.font: titleFont!])
        
        var titleInsets: UIEdgeInsets
        var imageInsets: UIEdgeInsets
        
        switch (position){
        case .top:
            titleInsets = UIEdgeInsets(top: -(imageSize.height + titleSize.height + spacing),
                                       left: -(imageSize.width), bottom: 0, right: 0)
            imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: -titleSize.width)
        case .bottom:
            titleInsets = UIEdgeInsets(top: (imageSize.height + titleSize.height + spacing),
                                       left: -(imageSize.width), bottom: 0, right: 0)
            imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: -titleSize.width)
        case .left:
            titleInsets = UIEdgeInsets(top: 0, left: -(imageSize.width * 2), bottom: 0, right: 0)
            imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0,
                                       right: -(titleSize.width * 2 + spacing))
        case .right:
            titleInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: -spacing)
            imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        default:
            titleInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        }
        
        self.titleEdgeInsets = titleInsets
        self.imageEdgeInsets = imageInsets
    }
}
