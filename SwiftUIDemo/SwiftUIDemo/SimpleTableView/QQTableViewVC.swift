//
//  QQTableViewVC.swift
//  SwiftUIDemo
//
//  Created by wangyinghua on 2018/1/6.
//  Copyright © 2018年 ZhiXing. All rights reserved.
//

import UIKit

class QQTableViewVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        // 移除导航栏底部线条
        self.view.backgroundColor = UIColor.white
        self.navigationController?.navigationBar.shadowImage = UIImage.init()
    }

}
