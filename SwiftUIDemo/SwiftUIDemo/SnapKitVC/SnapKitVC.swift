//
//  SnapKitVC.swift
//  SwiftUIDemo
//
//  Created by hnbwyh on 2018/1/29.
//  Copyright © 2018年 ZhiXing. All rights reserved.
//

import UIKit
import SnapKit

class SnapKitVC: BaseVC {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        view.backgroundColor = UIColor.orange
        self.sampleTest5()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    // MARK:  Snapkit 简单应用1
    func sampleTest1() {
        
        let tv = UIView()
        view.addSubview(tv)
        tv.backgroundColor = UIColor.cyan
        tv.snp.makeConstraints { (make) in
            
            // 宽高均为 100.0 ，中心居于父视图中心
            //            make.width.equalTo(100.0)
            //            make.height.equalTo(100.0)
            //            make.center.equalTo(view)
            
            // 宽高均为 100 ， 自定义中心位置
            //            make.width.height.equalTo(100.0)
            //            make.center.equalTo(CGPoint.init(x: 100.0, y: 100.0))
            
            //
            
            
        }
    }
    
    // MARK:  Snapkit 简单应用2
    func sampleTest2() {
        
        let tv1 = UIView()
        tv1.frame = CGRect(x:0,y:0,width:200,height:200)
        tv1.center = view.center
        tv1.backgroundColor = UIColor.cyan
        view.addSubview(tv1)
        
        let tv2 = UIView()
        tv2.backgroundColor = UIColor.purple

        tv1.addSubview(tv2)
        tv2.snp.makeConstraints { (make) in

//            make.top.equalToSuperview().offset(20.0)
//            make.left.equalToSuperview().offset(20.0)
//            make.bottom.equalToSuperview().offset(-20.0)
//            make.right.equalToSuperview().offset(-20.0)

            make.edges.equalToSuperview().inset(UIEdgeInsetsMake(20, 20, 20, 20))
            
        }
        
    }
    
    // MARK: <= \ >= 其中 lessThanOrEqualTo 优先级较高 、 相对于其他视图(非父视图)的布局
    func sampleTest3() {
        
        let tv1 = UIView()
        tv1.frame = CGRect(x:0,y:0,width:200,height:200)
        tv1.center = view.center
        tv1.backgroundColor = UIColor.cyan
        view.addSubview(tv1)
        
        let tv2 = UIView()
        tv2.backgroundColor = UIColor.purple
        
        view.addSubview(tv2)
        tv2.snp.makeConstraints { (make) in
            
            make.top.equalTo(tv1.snp.bottom).offset(10.0)
            make.width.height.equalTo(100.0)
            //make.centerX.lessThanOrEqualTo(tv1.snp.leading)
            make.centerX.lessThanOrEqualTo(tv1.snp.left)
            
        }
        
    }
    
    // MARK: - 更新约束 ： update 与 updateConstraints （注意 updateConstraints / makeConstraints 两者区别）
    var updateConstraint:Constraint?
    func sampleTest5() {
        
        let tv1 = UIView()
        tv1.frame = CGRect(x:0,y:0,width:300,height:300)
        tv1.center = view.center
        tv1.backgroundColor = UIColor.cyan
        view.addSubview(tv1)
        
        let tv2 = UIView()
        tv2.backgroundColor = UIColor.purple
        
        tv1.addSubview(tv2)
        tv2.snp.makeConstraints { (make) in
            
            make.width.height.equalTo(100.0)
            self.updateConstraint = make.top.left.equalTo(10).constraint // 保存
            
        }
        
        // 触发事件
        let btn = UIButton(type:.custom)
        btn.backgroundColor = UIColor.blue
        btn.setTitle("点击更新约束", for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 13.0)
        btn.addTarget(self, action: #selector(clickEvent(btn:)), for: .touchUpInside)
        view.addSubview(btn)
        btn.snp.makeConstraints { (make) in
            make.top.equalTo(100)
            make.height.equalTo(30)
            make.width.equalTo(100)
            make.centerX.equalToSuperview()
        }
        
    }
    
    @objc func clickEvent(btn:UIButton) {
        self.updateConstraint?.update(offset:80)
    }
    
    // MARK: - remakeConstraints
    // 销毁之前 makeConstraints 所产生的约束
    
}
