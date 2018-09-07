//
//  CollectionReusableHeaderView.swift
//  SwiftUIDemo
//
//  Created by hnbwyh on 2018/9/7.
//  Copyright © 2018年 ZhiXing. All rights reserved.
//

import UIKit

class CollectionReusableHeaderView: UICollectionReusableView {
    public var themBtn:UIButton = UIButton.init(type: .custom)
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        themBtn.frame                       = CGRect(x: 0, y: 0, width: 68.0, height: frame.size.height)
        themBtn.titleLabel?.font            = UIFont.systemFont(ofSize: 16.0)
        themBtn.titleLabel?.textColor       = UIColor.black
        themBtn.backgroundColor             = UIColor.cyan
        self.addSubview(themBtn)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
