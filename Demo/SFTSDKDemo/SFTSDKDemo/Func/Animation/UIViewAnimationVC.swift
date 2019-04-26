//
//  UIViewAnimationVC.swift
//  SFTSDKDemo
//
//  Created by hnbwyh on 2019/4/26.
//  Copyright © 2019 JiXia. All rights reserved.
//

import UIKit
import SnapKit

class UIViewAnimationVC: UIViewController {

    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        self.title = NSStringFromClass(self.classForCoder)
        view.addSubview(self.blackView)
        view.addSubview(self.redView)
        view.addSubview(self.fimgV)
        self.addConstriants()
    }
    
    // MARK: - UI
    func addConstriants() -> Void {
        self.blackView.snp.makeConstraints { (make) in
            make.width.height.equalTo(30.0)
            make.centerX.equalToSuperview()
            make.bottom.equalTo(view.snp_bottom).offset(-30.0)
        }
        
    }
    
    // MARK: - Trigger
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.animation4()
    }
    
    // MARK: - Animation
    func animation1() -> Void {

        let ti:TimeInterval = 3.0
        UIView.animate(withDuration: ti) {
            self.blackView.snp.remakeConstraints({ (make) in
                make.width.height.equalTo(50.0)
                make.centerX.equalToSuperview()
                make.bottom.equalTo(self.view.snp_bottom).offset(-30.0)
            })
        }
        
       
        UIView.animate(withDuration: ti, animations: {
            self.redView.frame = CGRect.init(x: 8.0, y: 100.0, width: 60.0, height: 60.0)
        }) { (isFinish) in
            if isFinish {
               self.redView.frame = CGRect.init(x: 8.0, y: 100.0, width: 30.0, height: 30.0)
            }
        }
        
        
        //        UIView.animate(withDuration: <#T##TimeInterval#>, delay: <#T##TimeInterval#>, options: <#T##UIView.AnimationOptions#>, animations: <#T##() -> Void#>, completion: <#T##((Bool) -> Void)?##((Bool) -> Void)?##(Bool) -> Void#>)
        
    }
    
    func animation2() -> Void {

        let ti:TimeInterval = 3.0
        /*!
         弹簧式动画
         
         @withDuration : 设置动画时间
         @delay : 设置动画延时时间
         @usingSpringWithDamping : 设置阻尼系数(该数字越大，动画弹动的次数越少)
         @initialSpringVelocity : 设置初始速度(该数字越大，震动的振幅越大)
         @options : 设置动画的出现形式
         */
        
        UIView.animate(withDuration: ti, delay: 1.0, usingSpringWithDamping: 0.1, initialSpringVelocity: 10, options: .curveEaseInOut, animations: {
            self.redView.frame = CGRect.init(x: 8.0, y:200.0, width: 30.0, height: 30.0)
        }) { (isFinish) in
            
        }
        
    }
    
    func animation3() -> Void {
        let ti:TimeInterval = 8.0
        let rct:CGRect = self.redView.frame
        let screenRct:CGRect = UIScreen.main.bounds
        UIView.animateKeyframes(withDuration: ti, delay: 1.0, options: .calculationModeLinear, animations: {
            
            /*!
             帧动画
             
             @withRelativeStartTime : 设置动画的开始时间
             @relativeDuration : 动画的持续时间
             */
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 1/4, animations: {
                self.redView.frame = CGRect.init(x: screenRct.maxX-rct.width, y: rct.minY, width: rct.width, height: rct.height)
            })
            UIView.addKeyframe(withRelativeStartTime: 1/4, relativeDuration: 1/4, animations: {
                self.redView.frame = CGRect.init(x: screenRct.maxX-rct.width, y: screenRct.maxY-rct.height, width: rct.width, height: rct.height)
            })
            UIView.addKeyframe(withRelativeStartTime: 2/4, relativeDuration: 1/4, animations: {
                self.redView.frame = CGRect.init(x: rct.origin.x, y: screenRct.maxY-rct.height, width: rct.width, height: rct.height)
            })
            UIView.addKeyframe(withRelativeStartTime: 3/4, relativeDuration: 1/4, animations: {
                self.redView.frame = rct
            })
        }) { (isFinish) in
            
        }
    }
    
    func animation4() -> Void {

        UIView.transition(with: self.fimgV, duration: 2.0, options: .transitionFlipFromLeft, animations: {
            self.fimgV.image = UIImage.init(named: "02.jpg")
        }) { (isFinish) in

        }
        
//        UIView.transition(from: self.fimgV, to: self.simgV, duration: 3.0, options: .transitionFlipFromLeft) { (isFinish) in
//
//        }
        
    }
    
    
    // MARK: - Lazy load
    lazy var blackView:UIView = {
        let rlt:UIView = UIView.init()
        rlt.backgroundColor = UIColor.black
        return rlt
    }();

    lazy var redView:UIView = {
        let rlt:UIView = UIView.init(frame: CGRect.init(x: 8.0, y: 100.0, width: 30.0, height: 30.0))
        rlt.layer.cornerRadius = 15.0
        rlt.layer.masksToBounds = true
        rlt.backgroundColor = UIColor.red
        return rlt
    }();
    
    lazy var fimgV:UIImageView = {
        let redRct:CGRect = self.redView.frame
        let rlt:UIImageView = UIImageView.init(frame: CGRect.init(x: redRct.maxX + 20, y: redRct.minY, width: 102.4, height: 75.5))
        rlt.image = UIImage.init(named: "01.jpg")
        return rlt
    }();
    
    lazy var simgV:UIImageView = {
        let redRct:CGRect = self.redView.frame
        let rlt:UIImageView = UIImageView.init(frame: CGRect.init(x: redRct.maxX + 20, y: redRct.minY, width: 102.4, height: 75.5))
        rlt.image = UIImage.init(named: "02.jpg")
        return rlt
    }();
    
}
