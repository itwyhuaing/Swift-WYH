//
//  QQTableVC.swift
//  SWFTDemo
//
//  Created by hnbwyh on 2019/4/24.
//  Copyright © 2019 JiXia. All rights reserved.
//

import UIKit

class QQTableVC: UIViewController ,UITableViewDelegate,UITableViewDataSource {
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor        = UIColor.white
        self.table.backgroundColor  = UIColor.white
    }
    
    // MARK: - UITableViewDelegate,UITableViewDataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.data.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let f:QQFriendGroup = self.data[section]
        return f.isAll ? f.friends.count : 0
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let f:QQFriendGroup = self.data[section]
        let btn:UIButton = UIButton.init(type: .custom)
        btn.frame = CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 30.0)
        btn.backgroundColor = UIColor.cyan
        btn.setTitle(f.group, for: .normal)
        btn.tag = section
        btn.addTarget(self, action: #selector(clickForHeader(btn:)), for: .touchUpInside)
        return btn
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "CellID")
        if cell==nil {
            cell = UITableViewCell.init(style: .default, reuseIdentifier: "CellID")
        }
        let f:QQFriendGroup = self.data[indexPath.section]
        cell?.textLabel?.text = f.friends[indexPath.row] as? String
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        print("didSelect \(indexPath.section) - \(indexPath.row)")
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30.0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 66.0
    }
    
    // MARK: - Click
    @objc func clickForHeader(btn:UIButton) -> Void {
        print(" \n clickForHeader \n ")
        let f:QQFriendGroup = self.data[btn.tag]
        f.isAll = !f.isAll
        self.table.reloadData()
    }
    
    // MARK: - lazy load
    lazy var table:UITableView = {
        let y_off:CGFloat = self.navigationController?.navigationBar.frame.maxY ?? 0.0
        let rlt = UITableView.init(frame: CGRect.init(x: 0,
                                                      y: y_off,
                                                      width: UIScreen.main.bounds.width,
                                                      height: UIScreen.main.bounds.height - y_off),
                                   style: .plain)
        rlt.delegate = self
        rlt.dataSource = self
        view.addSubview(rlt)
        return rlt
    }();
    
    lazy var data:[QQFriendGroup] = {
        let rlt = NSMutableArray.init()
        for idx in 1...3 {
            var f:QQFriendGroup = QQFriendGroup.init()
            f.group = "\(idx)" + "Group"
            let tmp:Int = Int(arc4random() % 30) + 2
            for cou in 1...tmp {
                let theFriend = "Friend \(idx) \(cou)"
                f.friends.add(theFriend)
            }
            rlt.add(f)
        }
        return rlt as! [QQFriendGroup]
    }();
    
    
}
