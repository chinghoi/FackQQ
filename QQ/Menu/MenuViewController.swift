//
//  MenuViewController.swift
//  QQ
//
//  Created by ChingHoi on 2018/4/23.
//  Copyright © 2018年 ChingHoi. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var leftTableView: UITableView!
    
    override func viewDidLoad() {
        
        let tableView = UITableView(frame: leftTableView.frame, style: .plain)
        //声明tableView的代理和数据源
        tableView.delegate = self
        tableView.dataSource = self
        //根据cell ID 给 tableView注册cell
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Default")
        self.view.addSubview(tableView)
    }
    //每个section中的cell个数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    //设置每个 cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //从tableview的重用池里通过cellID取一个cell
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "Default")!
        //设置cell的标题
        cell.textLabel?.text = "这是第\(indexPath.row)个cell"
        return cell
    }
    

}
