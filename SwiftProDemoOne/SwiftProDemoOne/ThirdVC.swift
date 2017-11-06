//
//  ThirdVC.swift
//  SwiftProDemoOne
//
//  Created by hnbwyh on 2017/10/17.
//  Copyright © 2017年 wangyinghua. All rights reserved.
//

import UIKit

class ThirdVC: BaseVC,LoginViewDelegate{
    
    var lgview:LoginView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lgview = LoginView.init(frame: CGRect(x:0,y:0,width:UIScreen.main.bounds.size.width,height:UIScreen.main.bounds.size.height))
        lgview.delegate = self
        self.view.addSubview(lgview)
        
        var t = 88
        var m = 100
        swap1(a: 59, b: 99)
        swap2(a:&t,b:&m)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

    func clickLoginView(btn: UIButton, str1: String, str2: String) {
        print(" clickLoginView : btn = \(btn) , str1 = \(str1) , str2 = \(str2) ")
        
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
