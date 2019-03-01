//
//  LoginVC.swift
//  SwiftUIDemo
//
//  Created by hnbwyh on 2018/12/4.
//  Copyright © 2018年 ZhiXing. All rights reserved.
//

import UIKit
import SnapKit

class LoginVC: BaseVC,UITextFieldDelegate {
    
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
        
        // 点击事件
        self.loginBtn.addTarget(self, action: #selector(entryLogin), for: .touchUpInside)
        self.forgetPsd.addTarget(self, action: #selector(findPsd), for: .touchUpInside)
    }
   
    // MARK: - private method
    @objc func registerNerUsr() -> Void {
        let nextVC = RegisterVC.init()
        self.navigationController?.pushViewController(nextVC, animated: false)
    }
    
    @objc func entryLogin() -> Void {
        let nextVC = FindPsdVC.init()
        self.navigationController?.pushViewController(nextVC, animated: false)
    }
    
    @objc func findPsd() -> Void {
        let nextVC = FindPsdVC.init()
        self.navigationController?.pushViewController(nextVC, animated: false)
    }
    
    func addSubviewsToTheView () {
        view.addSubview(self.logo)
        view.addSubview(self.them)
        view.addSubview(self.UsrCount)
        view.addSubview(self.Psd)
        view.addSubview(self.loginBtn)
        view.addSubview(self.forgetPsd)
        self.UsrCount.addSubview(self.ucBottomLine)
        self.Psd.addSubview(self.psdBottomLine)
        
        
        //self.logo.backgroundColor           = UIColor.orange
        //self.them.backgroundColor           = UIColor.cyan
        //self.UsrCount.backgroundColor       = UIColor.red
        //self.Psd.backgroundColor            = UIColor.purple
        //self.loginBtn.backgroundColor       = UIColor.orange
        //self.forgetPsd.backgroundColor = UIColor.red
        
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
            make.top.equalTo(self.UsrCount.snp.bottom).offset(15.0)
            make.width.equalTo(self.UsrCount)
            make.left.equalTo(self.UsrCount)
            make.height.equalTo(self.UsrCount)
        }
        
        self.ucBottomLine.snp.makeConstraints { (make) in
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
            make.height.equalTo(1.0)
        }
        
        self.psdBottomLine.snp.makeConstraints { (make) in
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
            make.height.equalTo(1.0)
        }
        
        self.loginBtn.snp.makeConstraints { (make) in
            make.top.equalTo(self.Psd.snp.bottom).offset(36.0)
            make.left.equalTo(self.Psd.snp.left).offset(10)
            make.right.equalTo(self.Psd.snp.right).offset(-10)
            make.height.equalTo(36.0)
        }
        
        self.forgetPsd.snp.makeConstraints { (make) in
            make.top.equalTo(self.loginBtn.snp.bottom).offset(15.0)
            make.left.equalTo(self.loginBtn.snp.left)
            make.width.lessThanOrEqualTo(200)
            make.height.equalTo(15.0)
        }
        
    }
    
    func createThemLabel(them:String) -> UILabel {
        let rltV            = UILabel.init()
        rltV.frame          = CGRect.init(x: 0, y: 0, width: 46.0, height: 33.0)
        rltV.text           = them
        rltV.font           = UIFont.systemFont(ofSize: 15.0)
        rltV.textColor      = UIColor.black
        //rltV.textAlignment  = .center
        //rltV.backgroundColor = UIColor.red
        return rltV
    }
    
    func resignEditing() -> Void {
        self.UsrCount.resignFirstResponder()
        self.Psd.resignFirstResponder()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("\n touchesBegan \n")
        self.resignEditing()
    }
    
    // MARK: - UITextFieldDelegate
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        // 每次输入调用
        print("\n 每次输入调用 \n")
        let usText:String = self.UsrCount.text ?? ""
        let pdText:String = self.Psd.text ?? ""
        if usText.count > 6 && pdText.count > 6 {
            self.loginBtn.alpha = 1.0
        }else{
            self.loginBtn.alpha = 0.5
        }
        
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        // 即将结束编辑时调用
        print("\n 即将结束编辑时调用 \n")
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        // 已经结束编辑时调用
        print("\n 已经结束编辑时调用 \n")
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.resignEditing()
        print("\n return 结束编辑时调用 \n")
        return true
    }
    
    // MARK: - lazy load
    lazy var logo:UIImageView = {
        let rltV = UIImageView()
        rltV.image = UIImage.init(named: "6")
        rltV.contentMode = .scaleAspectFill
        rltV.clipsToBounds = true
        rltV.layer.cornerRadius = 40.0
        return rltV
    }();
    
    lazy var them:UILabel = {
        let rltV = UILabel()
        rltV.text = "时尚生活，随心出行"
        rltV.font = UIFont.systemFont(ofSize: 13.0)
        rltV.textColor = UIColor.black
        rltV.textAlignment = .center
        return rltV
    }();
    
    lazy var UsrCount:UITextField = {
        let rltV = UITextField.init()
        rltV.delegate = self
        rltV.placeholder = "请输入手机号/邮箱"
        rltV.font = UIFont.systemFont(ofSize: 15.0)
        rltV.leftView = self.createThemLabel(them: "账  号")
        rltV.leftViewMode = .always
        return rltV;
    }();
    
    lazy var Psd:UITextField = {
        let rltV = UITextField.init()
        rltV.delegate = self
        rltV.placeholder = "请输入密码"
        rltV.font = UIFont.systemFont(ofSize: 15.0)
        rltV.leftView = self.createThemLabel(them: "密  码")
        rltV.leftViewMode = .always
        return rltV;
    }();
    
    lazy var ucBottomLine:UILabel = {
        let rltLine = UILabel.init()
        rltLine.backgroundColor = UIColor.init(red: 200.0/255.0, green: 200.0/255.0, blue: 200.0/255.0, alpha: 1.0)
        return rltLine
    }()
    
    lazy var psdBottomLine:UILabel = {
        let rltLine = UILabel.init()
        rltLine.backgroundColor = UIColor.init(red: 200.0/255.0, green: 200.0/255.0, blue: 200.0/255.0, alpha: 1.0)
        return rltLine
    }()
    
    lazy var loginBtn:UIButton = {
        let rltV = UIButton.init(type: .custom)
        rltV.setTitle("登 录", for: .normal)
        rltV.layer.cornerRadius = 6.0
        rltV.backgroundColor = UIColor.init(red: 63.0/255.0, green: 162.0/255.0, blue: 255.0/255.0, alpha: 1.0)
        rltV.alpha = 0.5
        return rltV
    }();
    
    lazy var forgetPsd:UIButton = {
        let rltV = UIButton.init(type: .custom)
        rltV.setTitle("忘记密码？", for: .normal)
        rltV.setTitleColor(.black, for: .normal)
        rltV.titleLabel?.font = UIFont.systemFont(ofSize: 13.0)
        return rltV
    }()
}
