//
//  CoreAnimationVC.swift
//  SFTSDKDemo
//
//  Created by hnbwyh on 2019/4/26.
//  Copyright © 2019 JiXia. All rights reserved.
//

import UIKit

class CoreAnimationVC: UIViewController,CAAnimationDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        view.addSubview(self.redView)
        self.title = NSStringFromClass(self.classForCoder)
    }

    // MARK: - Trigger
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.animation1()
    }
    
    
    // MARK: - Functions
    func testView() -> Void {
        // 如果将UIView说成是视图，那么CALayer就是图层了。每一个 UIView 的身后对应一个 Core Animation 框架中的 CALayer；每一个 CALayer 都是 UIView 的代理。尝试下面代码，一样的内存地址：
        let tv = UIView.init()
        print("\(tv)")
        print("\(tv.layer.delegate!)")
    }
    
    func testView2() -> Void {
        let testView = UIView.init(frame: CGRect.init(x: 100, y: 100, width: 100, height: 100))
        testView.backgroundColor = UIColor.blue
        view.addSubview(testView)
        //设置圆角
        testView.layer.cornerRadius = testView.frame.width / 2.0
        testView.layer.masksToBounds = true
    
        //设置边框
        testView.layer.borderWidth = 5
        testView.layer.borderColor = UIColor.red.cgColor
    
        //设置阴影，这里需要注意，如果masksToBounds为true，阴影会被裁剪掉（所以，一般如果你既想要圆形图片，又想要阴影，那么是需要将图片进行裁剪的）
        testView.layer.shadowOpacity = 0.5
        testView.layer.shadowOffset  = CGSize.init(width: 0.0, height: 2.0)
        testView.layer.shadowRadius  = 5.0
    }
    
    func animation1() -> Void {
        // path
        let keyFrameAnimate = CAKeyframeAnimation.init(keyPath: "position")
        let path = UIBezierPath.init()
        path.addArc(withCenter: CGPoint.init(x: UIScreen.main.bounds.midX, y: UIScreen.main.bounds.midY), radius: 100.0, startAngle: 0, endAngle: CGFloat(Double.pi * 2.0), clockwise: true)
        keyFrameAnimate.path = path.cgPath
        keyFrameAnimate.duration = 8.0
        keyFrameAnimate.delegate = self
        keyFrameAnimate.isRemovedOnCompletion = false
        keyFrameAnimate.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeIn)
        
        // layer 标记出路径
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.lineWidth = 2.0
        shapeLayer.strokeColor = UIColor.blue.cgColor
        self.view.layer.addSublayer(shapeLayer)
        
        // view
        DispatchQueue.main.asyncAfter(deadline: .now()+3.0) {
            self.redView.layer.add(keyFrameAnimate, forKey: "x_animation")
        }
    }
    
    // MARK: - CAAnimationDelegate
    func animationDidStart(_ anim: CAAnimation) {
        print("\n animationDidStart \n")
    }
    
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        print("\n animationDidStop \n")
    }
    
    // MARK: - lazy load
    lazy var redView:UIView = {
        let rlt:UIView = UIView.init(frame: CGRect.init(x: 40.0, y: 200.0, width: 50.0, height: 50.0))
        rlt.backgroundColor = UIColor.red
        rlt.layer.cornerRadius = 25.0
        //rlt.layer.masksToBounds = true
        rlt.layer.anchorPoint = CGPoint.init(x: 0.5, y: 0.5)
        return rlt
    }();
    
}
