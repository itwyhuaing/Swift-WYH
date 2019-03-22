//
//  HandyJsonModel.swift
//  AlamofireDemo
//
//  Created by hnbwyh on 2019/3/21.
//  Copyright © 2019 ZhiXingJY. All rights reserved.
//

import UIKit
import HandyJSON

class HandyJsonModel: HandyJSON {
    var id:Int64!
    var name:String!
    var frd:[String]?
    var wgt:Double?
    var alv:Bool = true
    var clr:NSString?
    
    required init() {}
}
