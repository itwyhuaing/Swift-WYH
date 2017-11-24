//
//  MainTabBarVC.swift
//  ZhiXingJianYan
//
//  Created by hnbwyh on 2017/11/24.
//  Copyright © 2017年 ZhiXing. All rights reserved.
//

import UIKit

class MainTabBarVC: CYLTabBarController { // CYLTabBarController UIViewController

    // StoryBoard 的名称
    let StoryName = ["HomePageSB","UserCenterSB"]
    // 标题
    let Title = ["首页","我的"]
    // 选中时的图片
    let SelectedImage = ["tab_5th_h","tab_3rd_h"]
    // 未选中时的图片
    let Image = ["tab_5th_n","tab_3rd_n"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        var tabBarItemsAttributes:[Any] = []
        var viewControllers:[Any] = []
        
        for i in 0...Title.count-1 {
            let dict:[String : Any] = [
                CYLTabBarItemTitle:Title[i],
                CYLTabBarItemImage:Image[i],
                CYLTabBarItemSelectedImage:SelectedImage[i]
            ]
            
            //let vc = UIStoryboard.init(name: StoryName[i], bundle: nil).instantiateInitialViewController()
            let vc = UIStoryboard(name: StoryName[i], bundle: nil).instantiateInitialViewController()
            tabBarItemsAttributes.append(dict)
            viewControllers.append(vc!)

            
        }
        
//        self.tabBarItemsAttributes = tabBarItemsAttributes
//        self.viewControllers = viewControllers
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
