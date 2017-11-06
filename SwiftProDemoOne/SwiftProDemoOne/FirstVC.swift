//
//  FirstVC.swift
//  SwiftProDemoOne
//
//  Created by wangyinghua on 2017/8/30.
//  Copyright © 2017年 wangyinghua. All rights reserved.
//

import UIKit
//import ThirdVC

class FirstVC: BaseVC {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let tvc = ThirdVC()
        self.navigationController?.pushViewController(tvc, animated: true)
    }

}
