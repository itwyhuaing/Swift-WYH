//
//  LoginVC.swift
//  SwiftUIDemo
//
//  Created by hnbwyh on 2018/12/4.
//  Copyright © 2018年 ZhiXing. All rights reserved.
//

import UIKit
import SnapKit

class LoginVC: BaseVC {
    
    // MARK: - life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.addSubviewsToTheView()
        self.addConstraints()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.view.backgroundColor = UIColor.white
        self.navigationController?.navigationBar.barTintColor        = UIColor.white
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor:UIColor.black]
        self.navigationController?.navigationBar.shadowImage         = UIImage.init()
        self.title                                                   = "登录"
        
        // 左侧返回按钮
        self.navigationItem.hidesBackButton = true
        let backBtnItem = UIButton.init(type: .custom)
        self.modifyBackBtnItem(btnItem: backBtnItem)
        backBtnItem.setImage(UIImage.init(named: "login_nav_back"), for: .normal)
        backBtnItem.addTarget(self, action: #selector(backPreVC), for: .touchUpInside)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: backBtnItem)
        // 右侧注册按钮
        let rgtBtnItem = UIButton.init(type: .custom)
        rgtBtnItem .setTitleColor(UIColor.init(red: 63.0/255.0, green: 162.0/255.0, blue: 255.0/255.0, alpha: 1.0), for: .normal)
        rgtBtnItem.frame = CGRect.init(x: 0, y: 0, width: 30.0, height: 30.0)
        rgtBtnItem.setTitle("注册", for: .normal)
        rgtBtnItem.addTarget(self, action: #selector(registerNerUsr), for: .touchUpInside)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(customView: rgtBtnItem)
    }
   
    // MARK: - private method
    func modifyBackBtnItem(btnItem:UIButton) -> Void {
        btnItem.frame = CGRect.init(x: 0, y: 0, width: 30, height: 30)
    }
    
    @objc func backPreVC() -> Void {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func registerNerUsr() -> Void {
        
    }
    
    func addSubviewsToTheView () {
        view.addSubview(self.logo)
        view.addSubview(self.them)
        view.addSubview(self.des)
        view.addSubview(self.wxLoginBtn)
        view.addSubview(self.phoneLoginBtn)
        
        self.logo.backgroundColor = UIColor.orange
        self.them.backgroundColor = UIColor.cyan
        
    }
    
    func addConstraints () {
        
        self.logo.snp.makeConstraints { (make) in
//            make.width.equalTo(80.0)
//            make.height.equalTo(80.0)
            make.width.height.equalTo(80.0)
            make.centerX.equalTo(view)
            make.topMargin.equalTo(100.0)
        }
        
        self.them.snp.makeConstraints { (make) in
//            make.left.equalToSuperview()
//            make.right.equalToSuperview()
            make.left.right.equalToSuperview()
            make.top.equalTo(self.logo.snp.bottom).offset(28.0)
            make.height.equalTo(22.0)
        }
        
        self.des.snp.makeConstraints { (make) in
            
        }
        
    }
    
    // MARK: - lazy load
    lazy var logo:UIImageView = {
        let rltV = UIImageView()
        return rltV
    }();
    
    lazy var them:UILabel = {
        let rltV = UILabel()
        return rltV
    }();
    
    lazy var des:UILabel = {
        let rlt = UILabel()
        return rlt;
    }();
    
    lazy var wxLoginBtn:UIButton = {
        let rltV = UIButton.init(type: .custom)
        return rltV
    }();
    
    lazy var phoneLoginBtn:UIButton = {
        let rltV = UIButton.init(type: .custom)
        return rltV
    }();
}
