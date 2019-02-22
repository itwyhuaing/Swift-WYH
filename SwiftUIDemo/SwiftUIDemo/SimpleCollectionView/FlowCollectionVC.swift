//
//  FlowCollectionVC.swift
//  SwiftUIDemo
//
//  Created by wangyinghua on 2018/1/6.
//  Copyright © 2018年 ZhiXing. All rights reserved.
//

import UIKit

class FlowCollectionVC: BaseVC,UICollectionViewDelegate,UICollectionViewDataSource {
    //MARK: - 私有属性
    var sectionsData = NSMutableArray()
    
    
    
    //MARK: - life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // 数据初始化
        sectionsData .addObjects(from: ["我的应用","便民生活","数据测试","出行方式","幸福生活"])
        
        // UI 初始化
        collectionV.backgroundColor  = UIColor.orange;
        self.view.addSubview(collectionV)
    }

    override func viewWillAppear(_ animated: Bool) {
        // 移除导航栏底部线条
        self.view.backgroundColor                               = UIColor.white
        self.navigationController?.navigationBar.shadowImage    = UIImage.init()
        self.navigationController?.navigationBar.isTranslucent  = false
    }
    
    //MARK: - UICollectionViewDelegate,UICollectionViewDataSource
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return sectionsData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 30
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let itemCell:CustomItem     = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomItemID", for: indexPath) as! CustomItem
        itemCell.title.text = String(format: "itemCell-%ld", indexPath.row)
        return itemCell
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionElementKindSectionHeader {
            let header:CollectionReusableHeaderView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "CollectionReusableHeaderViewID", for: indexPath) as! CollectionReusableHeaderView
            header.themBtn.setTitle(String(format: "%@", sectionsData[indexPath.section] as! CVarArg), for: .normal)
            return header
        }else{
            return UICollectionReusableView()
        }
    }
    
    
    //MARK: - lazy load
    lazy var collectionV:UICollectionView = {
        let layout                      = UICollectionViewFlowLayout()
        let edge                        = UIEdgeInsetsMake(10, 10, 10, 10)
        var sw:CGFloat                  = UIScreen.main.bounds.size.width
        var sh:CGFloat                  = UIScreen.main.bounds.size.height
        layout.scrollDirection          = .vertical
        layout.minimumLineSpacing       = 6.0
        layout.minimumInteritemSpacing  = 6.0
        layout.headerReferenceSize      = CGSize(width: sw, height: 35.0)
        layout.itemSize                 = CGSize(width: 66.0, height: 88.0)
        layout.sectionHeadersPinToVisibleBounds = true;
        let rltV                        = UICollectionView(frame: self.view.bounds, collectionViewLayout: layout)
        rltV.delegate                   = self
        rltV.dataSource                 = self
        rltV.register(CustomItem.self, forCellWithReuseIdentifier: "CustomItemID") // cell
        rltV.register(CollectionReusableHeaderView.classForCoder(), forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "CollectionReusableHeaderViewID")
        return rltV
    }()
    
}



























