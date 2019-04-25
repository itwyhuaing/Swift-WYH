//
//  ZFBFuncGroup.swift
//  SWFTDemo
//
//  Created by hnbwyh on 2019/4/24.
//  Copyright © 2019 JiXia. All rights reserved.
//

import UIKit


class FuncItem: NSObject {
    var icon:String  = ""
    var title:String = ""
}

class ZFBFuncGroup: NSObject {
    var groupThem:String = ""
    var funcs:NSMutableArray = []
    var isAll:Bool = true
    
    override init() {
        funcs = NSMutableArray.init() 
    }
    
}
