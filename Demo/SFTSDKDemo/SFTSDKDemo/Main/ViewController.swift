//
//  ViewController.swift
//  SFTSDKDemo
//
//  Created by hnbwyh on 2019/4/26.
//  Copyright © 2019 JiXia. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        view.addSubview(self.table)
    }

    
    // MARK: -
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.detailCnts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "CellID") ?? UITableViewCell.init(style: .default, reuseIdentifier: "CellID")
        cell.textLabel?.text = self.detailCnts[indexPath.row] as! String
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        let proName:String = Bundle.main.infoDictionary?["CFBundleExecutable"] as! String
        let vcName:String  = self.data[indexPath.row] as! String
        let theVCName:String = proName + "." + vcName
        let theVC          = NSClassFromString(theVCName) as! UIViewController.Type
        let vc             = theVC.init()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    // MARK: -
    lazy var table:UITableView = {
        let y_off:CGFloat = self.navigationController?.navigationBar.frame.maxY ?? 0.0
        let size:CGSize   = UIScreen.main.bounds.size
        let rct:CGRect    = CGRect.init(x: 0, y: y_off, width: size.width, height: size.height - y_off)
        let rlt = UITableView.init(frame: rct, style: .plain)
        rlt.register(UITableViewCell.self, forCellReuseIdentifier: "CellID")
        rlt.delegate      = self
        rlt.dataSource    = self
        return rlt
    }();

    lazy var data:NSMutableArray = {
        var rlt = NSMutableArray.init()
        rlt.addObjects(from: ["SystemRFVC","CustomRFVC","UIViewAnimationVC","CoreAnimationVC","CustomRFVC","CustomRFVC"])
        return rlt
    }();
    
    lazy var detailCnts:NSMutableArray = {
        var rlt = NSMutableArray.init()
        rlt.addObjects(from: ["Refresh-系统","Refresh-ZHRefresh","Animation-UIView","Animation-CoreAnimation","RunTime","RunLoop"])
        return rlt
    }();
}

