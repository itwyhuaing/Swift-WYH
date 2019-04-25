//
//  ViewController.swift
//  SWFTDemo
//
//  Created by hnbwyh on 2019/4/24.
//  Copyright © 2019 JiXia. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UITableViewDelegate , UITableViewDataSource {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor.cyan
        self.table.backgroundColor = UIColor.white
    }
    
    // MARK: - UITableViewDelegate 、UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.datas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "CellID") ?? UITableViewCell.init(style: .default, reuseIdentifier: "CellID")
        cell.textLabel?.text = self.datas[indexPath.row] as? String
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 66.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        let vcs:String = self.cnts[indexPath.row] as! String
        let proName    = Bundle.main.infoDictionary?["CFBundleExecutable"] as! String
        let theVCString = proName + "." + vcs
        let tVC         = NSClassFromString(theVCString) as! UIViewController.Type
        let theVC       = tVC.init()
        self.navigationController?.pushViewController(theVC, animated: true)
    }
    
    // MARK: - lazy load
    lazy var table:UITableView = {
        let y_off:CGFloat   = self.navigationController?.navigationBar.frame.maxY ?? 0.0
        let rct             = CGRect(x: 0,
                                     y: y_off,
                                     width: UIScreen.main.bounds.width,
                                     height: UIScreen.main.bounds.height - y_off)
        let rlt = UITableView.init(frame :rct, style: .plain)
        rlt.delegate    = self //as? UITableViewDelegate
        rlt.dataSource  = self //as? UITableViewDataSource
        view.addSubview(rlt)
        return rlt
    }();
    
    lazy var datas:NSMutableArray = {
        var rlt = NSMutableArray.init()
        rlt.addObjects(from: ["QQTableView","ZFBCollectionView","PickerView","LoginVC","SnapKit"])
        return rlt
    }();
    
    lazy var cnts:NSMutableArray = {
        var rlt = NSMutableArray.init()
        rlt.addObjects(from: ["QQTableVC","ZFBCollectionVC","DatePickViewVC","LoginVC","SnapKitVC"])
        return rlt
    }();

}

