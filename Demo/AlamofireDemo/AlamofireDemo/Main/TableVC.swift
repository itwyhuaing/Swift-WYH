//
//  TableVC.swift
//  AlamofireDemo
//
//  Created by hnbwyh on 2018/2/2.
//  Copyright © 2018年 ZhiXingJY. All rights reserved.
//

import UIKit

class TableVC: UITableViewController {

    //
    var dataSource = ["关键词","Alamofire 简单应用","数据解析"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.separatorStyle = .none
        self.title = NSStringFromClass(self.classForCoder).components(separatedBy: ".").last
        
        // iOS11 新特性
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
        
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cellID")
        if cell == nil {
            cell = UITableViewCell.init(style: .default, reuseIdentifier: "cellID")
            cell?.textLabel?.text = dataSource[indexPath.row]
        }
        return cell!
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(" IndexPath.row : ",indexPath.row)
        var vc = UIViewController()
        
        switch indexPath.row {
        case 0:
            vc = KeyWordsVC()
            break
            
        case 1:
            vc = FirstVC()
        break
            
        case 2:
            vc = SecondVC()
        break
            
        default:
        break
            
        }
        
        self.navigationController?.pushViewController(vc, animated: true)
        
        
    }
     
}
