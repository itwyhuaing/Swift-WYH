//
//  ZFBCollectionVC.swift
//  SWFTDemo
//
//  Created by hnbwyh on 2019/4/24.
//  Copyright © 2019 JiXia. All rights reserved.
//

import UIKit

class ZFBCollectionVC: UIViewController ,UICollectionViewDelegate,UICollectionViewDataSource {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor.white
        self.clv.backgroundColor = UIColor.white
        view.addSubview(self.clv)
    }

    // MARK: - UICollectionViewDelegate,UICollectionViewDataSource
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return self.data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let f:ZFBFuncGroup = self.data[section] as! ZFBFuncGroup
        return f.isAll ? f.funcs.count : 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:CustomItem = collectionView.dequeueReusableCell(withReuseIdentifier: "CellID", for: indexPath) as! CustomItem
        let f:ZFBFuncGroup = self.data[indexPath.section] as! ZFBFuncGroup
        let itm:FuncItem = f.funcs[indexPath.row] as! FuncItem
        cell.title.text = itm.title
        cell.icon.image = UIImage.init(named: itm.icon)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        var rlt:UICollectionReusableView = UICollectionReusableView.init()
        if kind == UICollectionView.elementKindSectionHeader {
            rlt = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "CLVHeader", for: indexPath)
            let f:ZFBFuncGroup = self.data[indexPath.section] as! ZFBFuncGroup
            let theV:CollectionReusableHeaderView = rlt as! CollectionReusableHeaderView
            theV.themBtn.setTitle(f.groupThem, for: .normal)
            theV.curStatus = f.isAll
            theV.themBlock = {
                (isAll:Bool) in
                f.isAll = isAll
                collectionView.reloadData()
            }
        }
        return rlt
    }
    
    // MARK: -
    lazy var clv:UICollectionView = { 
        let clvLayout:UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
        
//        let edge                        = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        var sw:CGFloat                  = UIScreen.main.bounds.size.width
        var sh:CGFloat                  = UIScreen.main.bounds.size.height
//        clvLayout.scrollDirection          = .vertical
//        clvLayout.minimumLineSpacing       = 6.0
//        clvLayout.minimumInteritemSpacing  = 6.0
        clvLayout.headerReferenceSize      = CGSize(width: sw, height: 35.0)
        clvLayout.itemSize                 = CGSize(width: 66.0, height: 88.0)
        clvLayout.sectionHeadersPinToVisibleBounds = true;

        let y_off = self.navigationController?.navigationBar.frame.maxY ?? 0.0
        let rlt:UICollectionView = UICollectionView.init(frame: CGRect.init(x: 0,
                                                                            y: y_off,
                                                                            width: UIScreen.main.bounds.width,
                                                                            height: UIScreen.main.bounds.height - y_off),
                                                         collectionViewLayout: clvLayout)
        rlt.register(CustomItem.self, forCellWithReuseIdentifier: "CellID")
        rlt.register(CollectionReusableHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "CLVHeader")
        rlt.delegate = self
        rlt.dataSource = self
        return rlt
    }();
    
    lazy var data:NSMutableArray = {
        let rlt = NSMutableArray.init()
        let thems:[String] = ["我的应用","便民生活","数据测试","出行方式","幸福生活"]
        for idx in 0...thems.count-1 {
            let f:ZFBFuncGroup = ZFBFuncGroup.init()
            f.groupThem = thems[idx]
            let tmp:Int = Int((arc4random() % 30) + 2)
            for cou in 1...tmp {
                let itm:FuncItem = FuncItem.init()
                itm.icon = "\((tmp%3 + 1)).jpg"
                itm.title = "FT\(idx) - \(cou)"
                f.funcs.add(itm)
            }
            rlt.add(f)
        }
        return rlt
    }();
    
}
