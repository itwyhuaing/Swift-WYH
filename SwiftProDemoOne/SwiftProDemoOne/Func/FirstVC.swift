//
//  FirstVC.swift
//  SwiftProDemoOne
//
//  Created by wangyinghua on 2017/8/30.
//  Copyright © 2017年 wangyinghua. All rights reserved.
//

import UIKit

class FirstVC: BaseVC {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "1VC"
        
        // 单例与 KVC
        let cusU = CustomUtil.sharedInstance
        //let rValue = cusU.paraT
        let rValue = String(describing: cusU.value(forKey: "paraT"))
        print("读取初始值 cusU.paraT:\(rValue)")
        
        cusU.setValue("paraT_setValue", forKey: "paraT")
        //let sValue = cusU.paraT
        let sValue = String(describing: cusU.value(forKey: "paraT"))
        print("设置一次之后读取 cusU.paraT:\(sValue)")
        
        
        // KVO
        
        
        
    }
    
    
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        
    }
    

}
