//
//  BaseVC.swift
//  SwiftUIDemo
//
//  Created by hnbwyh on 2019/2/22.
//  Copyright © 2019 ZhiXing. All rights reserved.
//

import UIKit

class BaseVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.barTintColor   = UIColor.init(red: 63.0/255.0, green: 162.0/255.0, blue: 255.0/255.0, alpha: 1.0)// 导航栏底部颜色
        self.navigationController?.navigationBar.tintColor      = UIColor.black
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor:UIColor.black]
        self.navigationController?.navigationBar.shadowImage  = UIImage.init()
        // 左侧返回按钮
        self.navigationItem.hidesBackButton = true
        let backBtnItem = UIButton.init(type: .custom)
        self.modifyBackBtnItem(btnItem: backBtnItem)
        backBtnItem.setImage(UIImage.init(named: "login_nav_back"), for: .normal)
        backBtnItem.addTarget(self, action: #selector(backPreVC), for: .touchUpInside)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: backBtnItem)
    }
    
    func modifyBackBtnItem(btnItem:UIButton) -> Void {
        btnItem.frame = CGRect.init(x: 0, y: 0, width: 30, height: 30)
    }
    
    @objc func backPreVC() -> Void {
        self.navigationController?.popViewController(animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
