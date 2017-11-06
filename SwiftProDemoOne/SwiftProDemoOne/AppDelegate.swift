//
//  AppDelegate.swift
//  SwiftProDemoOne
//
//  Created by wangyinghua on 2017/8/30.
//  Copyright © 2017年 wangyinghua. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow.init(frame:UIScreen.main.bounds)
        window?.backgroundColor = UIColor.white
        let firstVC = FirstVC()
        let secondVC = SecondVC()
        let firstNav = UINavigationController.init(rootViewController: firstVC)
        let secondNav = UINavigationController.init(rootViewController: secondVC)
        let tabBarVC = UITabBarController.init()
        tabBarVC.viewControllers = [firstNav,secondNav]
        window?.rootViewController = tabBarVC
        window?.makeKeyAndVisible()
        return true
    }

}

/**
 1. ThirdVC 与 LoginView 展示 协议代理 的应用当然也涉及 函数 与 属性
 2.
 */
