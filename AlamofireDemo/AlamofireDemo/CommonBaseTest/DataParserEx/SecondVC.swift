//
//  SecondVC.swift
//  AlamofireDemo
//
//  Created by hnbwyh on 2018/2/28.
//  Copyright © 2018年 ZhiXingJY. All rights reserved.
//

import UIKit
//import ExInfoModel

class SecondVC: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    // MARK: -life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(self.table)
    }

    
    override func viewWillAppear(_ animated: Bool) {
        self.view.backgroundColor = UIColor.white
        self.title = NSStringFromClass(self.classForCoder).components(separatedBy: ".").last
        
    }
    
    // MARK -UITableViewDataSource,UITableViewDelegate
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.thems.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "CellID")!
        cell.textLabel?.text = self.thems[indexPath.row]
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        switch indexPath.row {
        case 0:
            self.valueWithDicInfo()
            break
            
        default:
            break
        }
    }
    
    
    // MARK: -lazy load
    lazy var table:UITableView = {
        () -> UITableView in
        let scn = UIScreen.main.bounds.size
        let rltV = UITableView.init(frame: CGRect.init(x: 0, y: 64.0, width: scn.width, height: scn.height-64.0), style: .plain)
        rltV .register(UITableViewCell.classForCoder(), forCellReuseIdentifier: "CellID")
        rltV.delegate   = self
        rltV.dataSource = self
        return rltV
    }()
    
    lazy var thems:[String] = {
        () -> [String] in
        let rlt:[String] = ["字典赋值"]
        return rlt
    }()
    
    
    // MARK -inner method
    func valueWithDicInfo() -> Void {
        let datas = NSMutableArray.init()
        for index in 1...2 {
            let tmpD = index
            let tmpS = "showstring\(index)"
            let dict = [
                "tid":tmpD,
                "showstring":tmpS
                ] as [String : Any]
            datas.add(dict)
            
            // 1. 方式
            //let f:ExInfoModel  = ExInfoModel.init()
            //f.setValuesForKeys(dict)
            
            // 2. 方式
            let f = ExInfoModel(dic: dict)
            
            print(" \n f.tid = \(f.tid) f.showstring = \(f.showstring) \n ")
        }
        
        print(" \n 数据测试结束 \n ")
        
    }

}
