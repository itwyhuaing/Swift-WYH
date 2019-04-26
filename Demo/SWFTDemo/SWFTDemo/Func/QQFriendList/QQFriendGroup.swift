//
//  QQFriendGroup.swift
//  SWFTDemo
//
//  Created by hnbwyh on 2019/4/24.
//  Copyright © 2019 JiXia. All rights reserved.
//

import UIKit

class QQFriendGroup: NSObject {
    var group:String = ""
    var isAll:Bool   = true
    var friends:NSMutableArray = []
    
    override init() {
        super.init()
        friends = NSMutableArray.init()
    }
    
}
