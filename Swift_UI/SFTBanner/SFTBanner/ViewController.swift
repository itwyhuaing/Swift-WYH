//
//  ViewController.swift
//  SFTBanner
//
//  Created by hnbwyh on 2017/8/24.
//  Copyright © 2017年 hainbwyh. All rights reserved.
//

/**
 1. 区分大小写
 2. 
 **/
import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let bannervc = BannerVC();
        self.navigationController?.pushViewController(bannervc, animated: true);
    }


}

