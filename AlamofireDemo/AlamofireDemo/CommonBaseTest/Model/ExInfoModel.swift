//
//  ExInfoModel.swift
//  AlamofireDemo
//
//  Created by hnbwyh on 2019/3/15.
//  Copyright © 2019 ZhiXingJY. All rights reserved.
//

import UIKit

@objcMembers
class ExInfoModel: NSObject {
    
    var tid:String = ""
    
    var showstring:String = ""
    
    override init() {
        super.init()
//        self.tid = "86"
//        self.showstring = "中国"
        
    }
    
    init(dic:[String:Any]) {
        super.init()
        self.setValuesForKeys(dic)
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        print(" \n forUndefinedKey : \(String(describing: value)) - \(key) \n ")
        
    }
    
    
}
