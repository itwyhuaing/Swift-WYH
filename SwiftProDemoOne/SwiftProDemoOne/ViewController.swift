//
//  ViewController.swift
//  SwiftProDemoOne
//
//  Created by wangyinghua on 2017/8/30.
//  Copyright © 2017年 wangyinghua. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "ViewController"
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let tvc = ThirdVC()
        //let tvc = FirstVC()
        self.navigationController?.pushViewController(tvc, animated: true)
        
    }
    
}

