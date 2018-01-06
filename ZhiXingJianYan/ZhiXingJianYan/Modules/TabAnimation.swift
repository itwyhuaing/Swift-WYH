//
//  TabAnimation.swift
//  ZhiXingJianYan
//
//  Created by hnbwyh on 2017/11/28.
//  Copyright © 2017年 ZhiXing. All rights reserved.
//

import UIKit
import RAMAnimatedTabBarController

class TabAnimation: RAMItemAnimation {
    
    override func playAnimation(_ icon: UIImageView, textLabel: UILabel) {
        print(" playAnimation ")
        playBounceAnimation(icon)
        textLabel.textColor = UIColor.init(red: 0, green: 0.478431, blue: 1, alpha: 1)
        
        
    }
    
    override func deselectAnimation(_ icon: UIImageView, textLabel: UILabel, defaultTextColor: UIColor, defaultIconColor: UIColor) {
        print(" deselectAnimation ")
    }
    
    override func selectedState(_ icon: UIImageView, textLabel: UILabel) {
        print(" selectedState ")
    }
    
    
    func playBounceAnimation(_ icon : UIImageView) {
        
        let bounceAnimation = CAKeyframeAnimation(keyPath: "transform.scale")//Constants.AnimationKeys.Scale)
        bounceAnimation.values = [1.0 ,1.4, 0.9, 1.15, 0.95, 1.02, 1.0]
        bounceAnimation.duration = TimeInterval(duration)
        bounceAnimation.calculationMode = kCAAnimationCubic
        
        icon.layer.add(bounceAnimation, forKey: nil)
        
        if let iconImage = icon.image {
            let renderImage = iconImage.withRenderingMode(.alwaysTemplate)
            icon.image = renderImage
            icon.tintColor = iconSelectedColor
        }
    }
    
    
    
}
