//
//  CustomUtil.swift
//  SwiftProDemoOne
//
//  Created by hnbwyh on 2018/1/25.
//  Copyright © 2018年 wangyinghua. All rights reserved.
//

import UIKit

class CustomUtil: NSObject {
    
    // 测试 KVC
    var paraT:String = "paraT_Value"
    
    // 测试 KVO
    dynamic var kvoParaT = "kvo-init-value"
    
    // 单例
    static let sharedInstance = CustomUtil()
    private override init() {
        print(" CustomUtil - init ")
    }
    
}
