//
//  DelegateExVC.swift
//  SFTSDKDemo
//
//  Created by hnbwyh on 2019/4/28.
//  Copyright © 2019 JiXia. All rights reserved.
//

import UIKit

class DelegateExVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        view.addSubview(self.table)
        
        let vc:MethodExVC = MethodExVC.init()
        //vc.testFunc
        vc.testFunc()
        vc.testFunc3()
        
    }
    
    // MARK: - lazy load
    lazy var table:UITableView = {
        let y_off:CGFloat = self.navigationController?.navigationBar.frame.maxY ?? 0.0
        let srnFrame      = UIScreen.main.bounds
        let rlt:UITableView = UITableView.init(frame: CGRect.init(x: 0, y: y_off, width: srnFrame.width, height: srnFrame.height-y_off), style: .plain)
        rlt.delegate = self
        rlt.dataSource = self
        return rlt
    }()
    
    lazy var datas:NSMutableArray = {
        let rlt = NSMutableArray.init()
        for idx in 0...20 {
            rlt.add("\(idx)Cell")
        }
        return rlt
    }()
    
}


// MARK: - UITableViewDelegate
extension DelegateExVC:UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(" \n didSelectRowAt \(indexPath.row) \n")
    }
    
}

// MARK: - UITableViewDataSource
extension DelegateExVC:UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.datas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "CellID") ?? UITableViewCell.init(style: .default, reuseIdentifier: "CellID")
        cell.textLabel?.text = self.datas[indexPath.row] as! String
        return cell
    }
    
    
    
}
