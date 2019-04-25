//
//  LoginView.swift
//  SwiftProDemoOne
//
//  Created by hnbwyh on 2017/10/17.
//  Copyright © 2017年 wangyinghua. All rights reserved.
//

import UIKit

//    MARK: - 闭包
typealias UsrReadClickBlock = (UIButton,String) -> Void

//    MARK: - 代理协议
protocol LoginViewDelegate:NSObjectProtocol {
    func clickLoginView(btn:UIButton,str1:String,str2:String)
    
}

class LoginView: UIView {

    //    MARK: - 属性
    let NOTIFYCATION_NAME = Notification.Name.init("notifycation.loginView")
    
    var nametxetfiled:UITextField!
    var pwdtextfiled:UITextField!
    var loginbtn:UIButton!
    var usrRead:UIButton!
    var otherLoginbtn:UIButton!
    weak var delegate:LoginViewDelegate?
    var usrReadClick:UsrReadClickBlock?
    
    
    //    MARK: - 全局变量
    let kScreenWidth = UIScreen.main.bounds.size.width
    let kScreenHeight = UIScreen.main.bounds.size.height
    
    //    MARK: - init
    override init(frame: CGRect) {
        super.init(frame: frame)
        createname()
        createpwd()
        createlogin()
        createOtherLogin()
        createUsrRead()        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError(" required init has not been implemented ")
    }
    
    //    MARK: - UI
    func createname(){
        nametxetfiled = UITextField()
        nametxetfiled.placeholder = "    账号"
        nametxetfiled.frame = CGRect(x:20,y:200,width:kScreenWidth-20*2,height:50)
        nametxetfiled.layer.borderWidth = 0.1
        nametxetfiled.layer.borderColor = UIColor.gray.cgColor
        nametxetfiled.layer.cornerRadius = 25.0
        self.addSubview(nametxetfiled)
        
    }
    
    func createpwd()  {
        pwdtextfiled = UITextField()
        pwdtextfiled.placeholder = "    密码"
        pwdtextfiled.frame = CGRect(x:20,y:200 + 50 + 20,width:kScreenWidth-20*2,height:50)
        pwdtextfiled.layer.borderWidth = 0.3
        pwdtextfiled.layer.borderColor = UIColor.gray.cgColor
        pwdtextfiled.layer.cornerRadius = 25.0
        self.addSubview(pwdtextfiled)
    }
    
    func createlogin() {
        loginbtn = UIButton(type:.custom)
        loginbtn.setTitle("登 陆", for: .normal)
        loginbtn.titleLabel?.font = UIFont.systemFont(ofSize: 16.0)
        loginbtn.backgroundColor = UIColor.green
        loginbtn.frame = CGRect(x:20,y:200 + (50 + 20)*2,width:kScreenWidth-20*2,height:50)
        loginbtn.layer.cornerRadius = 25
        loginbtn.addTarget(self, action: #selector(loginclick(btn:)), for: .touchUpInside)
        self.addSubview(loginbtn)
        
    }
    
    func createOtherLogin() {
        otherLoginbtn = UIButton(type:.custom)
        otherLoginbtn.setTitle("其他方式登陆", for: .normal)
        otherLoginbtn.titleLabel?.font = UIFont.systemFont(ofSize: 16.0)
        otherLoginbtn.backgroundColor = UIColor.green
        otherLoginbtn.frame = CGRect(x:20,y:loginbtn.frame.maxY+20.0,width:kScreenWidth-20*2,height:50)
        otherLoginbtn.addTarget(self, action: #selector(otherLoginClick(btn:)), for: .touchUpInside)
        otherLoginbtn.layer.cornerRadius = 25;
        self.addSubview(otherLoginbtn)
    }
    
    func createUsrRead() {
        usrRead = UIButton(type:.custom)
        usrRead.setTitle("点击阅读《用户协议》", for: .normal)
        usrRead.titleLabel?.font = UIFont.systemFont(ofSize: 13.0)
        usrRead.setTitleColor(UIColor.red, for: .normal)
        //usrRead.backgroundColor = UIColor.red
        usrRead.frame = CGRect(x:0,y:otherLoginbtn.frame.maxY+60.0,width:kScreenWidth,height:30.0)
        usrRead.addTarget(self, action: #selector(usrReadClick(btn:)), for: .touchUpInside)
        self.addSubview(usrRead)
    }
    
    
    
    //    MARK: - click : 代理 - 闭包函数 - 通知
    @objc func loginclick(btn:UIButton) {
        print("\n \n \(#function) \n \n btn = \(btn)")
        if delegate != nil && nametxetfiled.text != "" && pwdtextfiled.text != ""{
            delegate?.clickLoginView(btn: loginbtn, str1: nametxetfiled.text!, str2: pwdtextfiled.text!)
        }
        
    }
    
    @objc func usrReadClick(btn:UIButton) {
        if usrReadClick != nil {
            usrReadClick!(btn,"点击阅读《用户协议》")
        }
    }
    
    @objc func otherLoginClick(btn:UIButton) {
        NotificationCenter.default.post(name:NOTIFYCATION_NAME , object:["data1","data2","data3"])
    }
    
    
}
