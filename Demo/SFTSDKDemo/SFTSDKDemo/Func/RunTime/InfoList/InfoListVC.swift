//
//  InfoListVC.swift
//  SFTSDKDemo
//
//  Created by hnbwyh on 2019/4/29.
//  Copyright © 2019 JiXia. All rights reserved.
//

import UIKit

class InfoListVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("\n ============> \n")
        self.checkIvars()
        print("\n ============> \n")
        self.checkProperties()
    }
    
    func checkIvars() -> Void {
        var count:UInt32 = 0
        let ivarList = class_copyIvarList(RunTimeTestObj.self, &count)
        if count > 0 {
            for index in 0...Int(count)-1 {
                let ivar = ivarList?[index]
                let cName = ivar_getName(ivar!)
                let name  = String(utf8String: cName!)
                print("\n index:\(index) name?.description:\(name?.description) \n")
            }
        }
        
    }
    
    func checkProperties() -> Void {
        var count:UInt32 = 0
        let list = class_copyPropertyList(RunTimeTestObj.self, &count)
        if count > 0 {
            for index in 0...Int(count)-1 {
                let p = list?[index]
                let cName = property_getName(p!)
                let name = String(utf8String: cName)
                print("\n index:\(index) name?.description:\(name?.description) \n")
            }
        }
        
    }
    
}
