//
//  ViewController.swift
//  SwiftUIDemo
//
//  Created by wangyinghua on 2018/1/6.
//  Copyright © 2018年 ZhiXing. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    var table = UITableView()
    var dataSource = NSMutableArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let sw = UIScreen.main.bounds.width
        let sh = UIScreen.main.bounds.height
        table.frame = CGRect(x:0,y:0,width:sw,height:sh)
        self.view.addSubview(table)
        table.delegate = self
        table.dataSource = self
        table.separatorStyle = .none
        let arr = ["QQTableViewVC","FlowCollectionVC","DatePickViewVC","SnapKitVC"]
        dataSource.addObjects(from: arr)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        // 移除导航栏底部线条
        self.view.backgroundColor = UIColor.white
        self.navigationController?.navigationBar.shadowImage = UIImage.init()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50.0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = table.dequeueReusableCell(withIdentifier: "cellID")
        if cell==nil {
            cell = UITableViewCell.init(style: .default, reuseIdentifier: "cellID")
            cell?.selectionStyle = .none
            cell?.layer.borderWidth = 0.3
            cell?.layer.borderColor = UIColor.init(red: 0.6, green: 0.6, blue: 0.6, alpha: 0.6).cgColor
        }
        cell?.textLabel?.text = dataSource[indexPath.row] as? String
        return cell!
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        table.deselectRow(at: indexPath, animated: true)
        
        let clString: String = dataSource[indexPath.row] as! String
        if clString == "QQTableViewVC" {
            let vc = QQTableViewVC()
            self.navigationController?.pushViewController(vc, animated: true)
        }else if clString == "FlowCollectionVC" {
            let vc = FlowCollectionVC()
            self.navigationController?.pushViewController(vc, animated: true)
        }else if clString == "DatePickViewVC" {
            let vc = DatePickViewVC()
            self.navigationController?.pushViewController(vc, animated: true)
        }else if clString == "SnapKitVC" {
            let vc = SnapKitVC()
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
        
    }

}

