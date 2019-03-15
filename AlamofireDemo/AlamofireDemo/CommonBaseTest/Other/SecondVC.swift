//
//  SecondVC.swift
//  AlamofireDemo
//
//  Created by hnbwyh on 2018/2/28.
//  Copyright © 2018年 ZhiXingJY. All rights reserved.
//

import UIKit

class SecondVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        var sv :String = "68"
        let hsv = sv.hashValue
        print("First : \(hsv)")
        
        var sv2 : String?
        let hsv2 = sv2?.hashValue
        print("Second : \(hsv2)")
        
        
        
        
    }

    override func viewWillAppear(_ animated: Bool) {
        self.view.backgroundColor = UIColor.white
        self.title = "SecondVC"
        
    }
    
    
    
    
    

}
