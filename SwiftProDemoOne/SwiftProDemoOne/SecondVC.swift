

//
//  SecondVC.swift
//  SwiftProDemoOne
//
//  Created by wangyinghua on 2017/8/30.
//  Copyright © 2017年 wangyinghua. All rights reserved.
//

import UIKit

class SecondVC: BaseVC {

// MARK: - life-cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "1VC简单算法"
        
        var t = 88
        var m = 100
        swap1(a: 59, b: 99)
        swap2(a:&t,b:&m)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    func swap1(a:Int,b:Int) {
        var a = a
        var b = b
        print(" 11 \n : a = \(a) , b = \(b)")
        let tmp = a
        a = b
        b = tmp
        print(" 22 \n : a = \(a) , b = \(b)")
        
    }
    
    func swap2(a:inout Int,b:inout Int) {
        print(" 1111 \n : a = \(a) , b = \(b)")
        let tmp = a
        a = b
        b = tmp
        print(" 2222 \n : a = \(a) , b = \(b)")
        
    }
    

}
