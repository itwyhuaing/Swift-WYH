//
//  RunTimeTestObj.swift
//  SFTSDKDemo
//
//  Created by hnbwyh on 2019/4/29.
//  Copyright © 2019 JiXia. All rights reserved.
//

import UIKit

typealias UserReadClickEventBlock = (UIButton,String) -> Void

protocol LoginViewDlegate:NSObjectProtocol {
    func clickEventForLogin(btn:UIButton,info:String) -> Void
    
}


class RunTimeTestObj: NSObject {
    var aBoll:Bool  = false
    var aInt:Int    = 30
    private var aStr:String = "TestStr"
    var usrRdEvent: UserReadClickEventBlock?
    weak var delegate:LoginViewDlegate?
    
    override init() {
        super.init()
    }
    
    func testMethod(pra1:String,pra2:Bool) -> String {
        let rlt = "testMethod"
        print("\n testMethod \n")
        return rlt
    }
    
    
}
