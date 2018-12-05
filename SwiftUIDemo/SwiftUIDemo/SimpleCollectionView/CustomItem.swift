//
//  CustomItem.swift
//  SwiftUIDemo
//
//  Created by hnbwyh on 2018/9/7.
//  Copyright © 2018年 ZhiXing. All rights reserved.
//

import UIKit

class CustomItem: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.contentView.addSubview(self.icon)
        self.contentView.addSubview(self.title)
        self.contentView.backgroundColor = UIColor.red
        self.icon.backgroundColor        = UIColor.purple
        self.title.backgroundColor       = UIColor.green
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    lazy var icon:UIImageView = {
        let rltV = UIImageView()
        rltV.frame = CGRect(x: (self.frame.size.width-40)/2.0, y: 10, width: 40, height: 40);
        return rltV
    }()
    
    
    lazy var title:UILabel = {
        let rltV = UILabel()
        rltV.frame = CGRect(x: 0, y: (self.frame.size.height - 25), width: self.frame.size.width, height: 20)
        rltV.font  = UIFont.systemFont(ofSize: 10.0)
        rltV.textAlignment = .center
        rltV.textColor = UIColor.black
        return rltV
    }()
    
}
