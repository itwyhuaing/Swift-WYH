//
//  ScaleHeaderVC.swift
//  SFTSDKDemo
//
//  Created by hnbwyh on 2019/4/28.
//  Copyright © 2019 JiXia. All rights reserved.
//

import UIKit
import MessageUI

class ScaleHeaderVC: UIViewController,UITableViewDelegate,UITableViewDataSource,MFMailComposeViewControllerDelegate {
    
    var data:[String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        
        data = ["Cell0","Cell1","Cell2","Cell3","Cell4","Cell5","Cell6","Cell7","Cell8","Cell9","Cell10","Cell11","Cell12","Cell13","Cell14"]
        let y_off:CGFloat = self.navigationController?.navigationBar.frame.maxY ?? 0.0
        let screenFrame   = UIScreen.main.bounds
        let tbView=UITableView.init(frame: CGRect(x: 0, y: y_off, width: screenFrame.width, height: screenFrame.height-y_off), style: .plain)
        view.addSubview(tbView)
        tbView.delegate=self
        tbView.dataSource=self
        tbView.backgroundColor=UIColor.white
        let footer=UIView()
        footer.backgroundColor=UIColor.red
        tbView.tableFooterView=footer
        tbView .fg_setHeaderView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 200), image: UIImage(named: "01.jpg"))
    }
    //MARK:UITableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return data.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cid="cell id"
        var cell=tableView.dequeueReusableCell(withIdentifier: cid)
        if cell == nil {
            
            cell=UITableViewCell.init(style: .default, reuseIdentifier: cid)
        }
        cell?.textLabel?.text=data[indexPath.row]
        cell?.textLabel?.textColor=UIColor.blue
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\n 测试数据 \(indexPath.section)-\(indexPath.row) \n")
    }
    //MARK:MFMailCOmposeViewController
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        
        controller.dismiss(animated: true, completion: nil)
    }

}
