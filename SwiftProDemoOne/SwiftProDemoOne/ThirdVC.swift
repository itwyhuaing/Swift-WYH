//
//  ThirdVC.swift
//  SwiftProDemoOne
//
//  Created by hnbwyh on 2017/10/17.
//  Copyright © 2017年 wangyinghua. All rights reserved.
//

import UIKit

class ThirdVC: BaseVC,LoginViewDelegate{
    
    var lgview:LoginView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lgview = LoginView.init(frame: CGRect(x:0,y:0,width:UIScreen.main.bounds.size.width,height:UIScreen.main.bounds.size.height))
        lgview.delegate = self
        
        // 闭包点击事件处理
        lgview!.usrReadClick = {
            (btn:UIButton,info:String) in
            print("btn:\(btn) ,info: \(info)")
        }
        self.view.addSubview(lgview)
        self.title = "ThirdVC-登陆 UI"
        
        // 通知事件处理
        NotificationCenter.default.addObserver(self, selector: #selector(clickOtherLogin(notifyInfo:)), name: lgview.NOTIFYCATION_NAME, object: nil)
        
    }

    deinit {
        /**
         该方法属于析构函数。与 OC 的 dealloc 函数一样，通常在对象结束其生命周期时，系统自动执行该函数。
         */
        print(" \n \n \(#function)  \n \n ")
        NotificationCenter.default.removeObserver(self)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

    // 代理事件处理
    func clickLoginView(btn: UIButton, str1: String, str2: String) {
        print(" clickLoginView : btn = \(btn) , str1 = \(str1) , str2 = \(str2) ")
        
    }
    
    func clickOtherLogin(notifyInfo:Notification) {
        print("\n \n \(#function) \n notifyInfo : \(notifyInfo) \n ")
        
    }
    
}
