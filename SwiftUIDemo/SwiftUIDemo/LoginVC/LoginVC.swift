//
//  LoginVC.swift
//  SwiftUIDemo
//
//  Created by hnbwyh on 2018/12/4.
//  Copyright © 2018年 ZhiXing. All rights reserved.
//

import UIKit
import SnapKit

class LoginVC: UIViewController {
    
    // MARK: - life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.addSubviewsToTheView()
        self.addConstraints()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.view.backgroundColor = UIColor.white
    }
   
    // MARK: - private method
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
