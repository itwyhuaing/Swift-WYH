//
//  KeyWordsVC.swift
//  AlamofireDemo
//
//  Created by hnbwyh on 2019/3/20.
//  Copyright © 2019 ZhiXingJY. All rights reserved.
//

import UIKit

class KeyWordsVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.keyWordForOnePart()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.view.backgroundColor = UIColor.white
        self.title = NSStringFromClass(self.classForCoder).components(separatedBy: ".").last
        
    }
    
    // MARK: ------ 关键字测试
    
    // MARK: - 关键字:guard
    func keyWordForOnePart() -> Void {
        print("测试 888888 ")
        let a = 101
        guard a % 20 == 0 else { print("测试 else ")
                                 return }
        print("测试 666666 ")
    }
    
    // MARK: - 关键字:try
    func keyWordForTwoPart() -> Void {
        /**
         - try? :告诉系统可能有错, 也可能没错, 如果发生错误, 那么返回nil, 如果没有发生错误, 会将数据包装成一个可选类型的值返回给我们
         这种使用方式, 相当于忽略错误
         
         - try! : 告诉系统一定没错, 如果发生错误, 程序会崩溃. 不推荐使用
         
         */
        
    }
    
    // MARK: - 关键字:
    func keyWordForThreePart() -> Void {
       
    }
    
    // MARK: - 关键字:
    func keyWordForFourPart() -> Void {
        
    }
    
    // MARK: - 关键字:
    func keyWordForFivePart() -> Void {
        
    }
    
    // MARK: - 关键字:
    func keyWordForSixPart() -> Void {
        
    }
    
    // MARK: - 关键字:
    func keyWordForSevenPart() -> Void {
        
    }
    
    
}
