//
//  MethodExVC.swift
//  SFTSDKDemo
//
//  Created by hnbwyh on 2019/4/28.
//  Copyright © 2019 JiXia. All rights reserved.
//

import UIKit

class MethodExVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        // 接收通知
        NotificationCenter.default.addObserver(self, selector: #selector(usrlogin(info:)), name: Notification.Name.UsrIno.usrLogin, object: nil)
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // 发出通知
        NotificationCenter.default.post(name: Notification.Name.UsrIno.usrLogin, object: ["para-name","para-pwd"])
    }
    
    deinit {
        // 移除监听
        NotificationCenter.default.removeObserver(self)
        print(" \n 销毁 \n ")
    }
    
}


extension Notification.Name {
    
    public struct UsrIno {
        public static let usrLogin       = Notification.Name(rawValue: "notification.name.userlogin")
        public static let usrLogout      = Notification.Name(rawValue: "notification.name.userlogout")
        public static let usrLogforceout = Notification.Name(rawValue: "notification.name.userforcelogout")
    }
    
}


extension MethodExVC {
    @objc func usrlogin(info:Notification) -> Void {
        print("\n 用户登录通知接收数据: \(info) \n")
    }
    
    @objc func testFunc() -> Void {
        print("\n testFunc \n")
    }
    
    
    private func testFunc2() -> Void {
        print("\n testFunc2 \n")
    }
    
    
    public func testFunc3() -> Void {
        print("\n testFunc3 \n")
    }
    
}
