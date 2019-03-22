//
//  JsonInfoModel.swift
//  AlamofireDemo
//
//  Created by hnbwyh on 2019/3/20.
//  Copyright © 2019 ZhiXingJY. All rights reserved.
//

import UIKit
import HandyJSON


// mark: -CodableModel
// 不能确定这些字断有值的，需要加可选，不然解析不成功
struct CodableModel : Decodable {
    var user:String
    var id:String
    var model:String?
    
    // 对应 data.json 数据文件中字段的 key 值，如果都是一样可以不写
    enum CodingKeys:String,CodingKey {
        case id     = "deciceId"
        case user   = "name"
        case model
    }
    
    
}


// mark: -CatModel
struct CatModel: HandyJSON {
    
    var id:Int64!
    var name:String!
    var frd:[String]?
    var wgt:Double?
    var alv:Bool = true
    var clr:NSString?
    
}

class JsonInfoModel: NSObject {
    
}
