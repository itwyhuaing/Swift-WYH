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

        // 右侧注册按钮
        let rgtBtnItem = UIButton.init(type: .custom)
        rgtBtnItem .setTitleColor(UIColor.init(red: 63.0/255.0, green: 162.0/255.0, blue: 255.0/255.0, alpha: 1.0), for: .normal)
        rgtBtnItem.frame = CGRect.init(x: 0, y: 0, width: 30.0, height: 30.0)
        rgtBtnItem.setTitle("注册", for: .normal)
        rgtBtnItem.addTarget(self, action: #selector(registerNerUsr), for: .touchUpInside)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(customView: rgtBtnItem)
    }
   
    // MARK: - private method
    @objc func registerNerUsr() -> Void {
        let nextVC = RegisterVC.init()
        self.navigationController?.pushViewController(nextVC, animated: false)
    }
    
    func addSubviewsToTheView () {
        view.addSubview(self.logo)
        view.addSubview(self.them)
        view.addSubview(self.UsrCount)
        view.addSubview(self.Psd)
        
        self.logo.backgroundColor = UIColor.orange
        self.them.backgroundColor = UIColor.cyan
        self.UsrCount.backgroundColor = UIColor.red
        self.Psd.backgroundColor      = UIColor.purple
    }
    
    func addConstraints () {
        
        self.logo.snp.makeConstraints { (make) in
            make.width.height.equalTo(80.0)
            make.centerX.equalTo(view)
            make.topMargin.equalTo(88.0)
        }
        
        self.them.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview()
            make.top.equalTo(self.logo.snp.bottom).offset(28.0)
            make.height.equalTo(22.0)
        }
        
        self.UsrCount.snp.makeConstraints { (make) in
            make.top.equalTo(self.them.snp.bottom).offset(36.0)
            make.left.equalTo(view.snp.left).offset(15.0)
            make.right.equalTo(view.snp.right).offset(-15.0)
            make.height.equalTo(33.0)
        }
        
        self.Psd.snp.makeConstraints { (make) in
//            make.top.equalTo(self.UsrCount.snp.bottom).offset(15.0)
//            make.width.equalTo(self.UsrCount)
//            make.left.equalTo(self.UsrCount.snp.left)
//            make.height.equalTo(self.UsrCount.snp.height)
            make.top.equalTo(self.UsrCount.snp.bottom).offset(15.0)
            make.width.equalTo(self.UsrCount)
            make.left.equalTo(self.UsrCount)
            make.height.equalTo(self.UsrCount)
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
    
    lazy var UsrCount:UITextField = {
        let rltV = UITextField.init()
        rltV.placeholder = "请输入手机号/邮箱"
        rltV.font = UIFont.systemFont(ofSize: 13.0)
        return rltV;
    }();
    
    lazy var Psd:UITextField = {
        let rltV = UITextField.init()
        rltV.placeholder = "请输入密码"
        rltV.font = UIFont.systemFont(ofSize: 13.0)
        return rltV;
    }();
    
//    lazy var des:UILabel = {
//        let rlt = UILabel()
//        return rlt;
//    }();
    
//    lazy var wxLoginBtn:UIButton = {
//        let rltV = UIButton.init(type: .custom)
//        return rltV
//    }();
    
}
