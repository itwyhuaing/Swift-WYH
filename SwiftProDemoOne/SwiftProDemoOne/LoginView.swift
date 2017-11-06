//
//  LoginView.swift
//  SwiftProDemoOne
//
//  Created by hnbwyh on 2017/10/17.
//  Copyright © 2017年 wangyinghua. All rights reserved.
//

import UIKit

protocol LoginViewDelegate:NSObjectProtocol {
    func clickLoginView(btn:UIButton,str1:String,str2:String)
    
}

class LoginView: UIView {
    var nametxetfiled:UITextField!
    var pwdtextfiled:UITextField!
    var loginbtn:UIButton!
    var delegate:LoginViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        createname()
        createpwd()
        createlogin()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError(" required init has not been implemented ")
    }
    
    func createname(){
        nametxetfiled = UITextField()
        nametxetfiled.placeholder = "111"
        nametxetfiled.frame = CGRect(x:20,y:200,width:UIScreen.main.bounds.size.width-20*2,height:50)
        self.addSubview(nametxetfiled)
        
    }
    
    func createpwd()  {
        pwdtextfiled = UITextField()
        pwdtextfiled.placeholder = "222"
        pwdtextfiled.frame = CGRect(x:20,y:200 + 50 + 20,width:UIScreen.main.bounds.size.width-20*2,height:50)
        self.addSubview(pwdtextfiled)
    }
    
    func createlogin() {
        loginbtn = UIButton(type:.custom)
        loginbtn.backgroundColor = UIColor.green
        loginbtn.frame = CGRect(x:20,y:200 + (50 + 20)*2,width:UIScreen.main.bounds.size.width-20*2,height:50)
        loginbtn.layer.cornerRadius = 25
        loginbtn.addTarget(self, action: #selector(loginclick), for: .touchUpInside)
        self.addSubview(loginbtn)
        
    }
    
    func loginclick(btn:UIButton) {
        print(" loginclick : btn = \(btn) , loginbtn = \(loginbtn) ")
        if delegate != nil && nametxetfiled.text != "" && pwdtextfiled.text != ""{
            delegate?.clickLoginView(btn: loginbtn, str1: nametxetfiled.text!, str2: pwdtextfiled.text!)
        }
        
    }
    
    
}
