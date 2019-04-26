//
//  CustomItem.swift
//  SWFTDemo
//
//  Created by hnbwyh on 2019/4/24.
//  Copyright © 2019 JiXia. All rights reserved.
//

import UIKit

class CustomItem: UICollectionViewCell {
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.contentView.backgroundColor = UIColor.cyan
        
    }
    
    lazy var icon:UIImageView = {
        let rltV = UIImageView()
        rltV.frame = CGRect(x: (self.frame.size.width-40)/2.0, y: 10, width: 40, height: 40);
        rltV.backgroundColor   = UIColor.red
        self.contentView.addSubview(rltV)
        return rltV
    }()
    
    
    lazy var title:UILabel = {
        let rltV = UILabel()
        rltV.frame = CGRect(x: 0, y: (self.frame.size.height - 25), width: self.frame.size.width, height: 20)
        rltV.font  = UIFont.systemFont(ofSize: 10.0)
        rltV.textAlignment = .center
        rltV.textColor = UIColor.black
        rltV.backgroundColor   = UIColor.purple
        self.contentView.addSubview(rltV)
        return rltV
    }()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
