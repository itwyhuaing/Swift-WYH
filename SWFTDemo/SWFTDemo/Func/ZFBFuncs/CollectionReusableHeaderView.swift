//
//  CollectionReusableHeaderView.swift
//  SWFTDemo
//
//  Created by hnbwyh on 2019/4/24.
//  Copyright © 2019 JiXia. All rights reserved.
//

import UIKit

typealias ThemEventBlock = (Bool) -> Void

class CollectionReusableHeaderView: UICollectionReusableView {
    var themBtn:UIButton = UIButton.init(type: .custom)
    var themBlock:ThemEventBlock?
    var curStatus:Bool = true
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        themBtn.frame                       = CGRect(x: 0, y: 0, width: 68.0, height: frame.size.height)
        themBtn.titleLabel?.font            = UIFont.systemFont(ofSize: 16.0)
        themBtn.backgroundColor             = UIColor.white
        themBtn.setTitleColor(UIColor.black, for: .normal)
        themBtn.addTarget(self, action: #selector(clickForThemBtn(btn:)), for: .touchUpInside)
        self.addSubview(themBtn)
    }
    
    @objc func clickForThemBtn(btn:UIButton) -> Void {
        if themBlock != nil {
           curStatus = !curStatus
           themBlock!(curStatus)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
