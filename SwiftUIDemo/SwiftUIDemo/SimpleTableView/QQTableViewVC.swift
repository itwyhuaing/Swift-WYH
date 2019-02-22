//
//  QQTableViewVC.swift
//  SwiftUIDemo
//
//  Created by wangyinghua on 2018/1/6.
//  Copyright © 2018年 ZhiXing. All rights reserved.
//

import UIKit

class QQTableViewVC: BaseVC,UITableViewDelegate,UITableViewDataSource {

    // MARK: - 私有属性
    var sectionsData            = NSMutableArray()
    var cellsData               = NSMutableArray()  // 保存原始数据
    var cellsListData           = NSMutableArray()  // 列表数据
    var btnsData                = NSMutableArray()  // section header
    
    // MARK: - life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(table!)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // 移除导航栏底部线条
        self.view.backgroundColor = UIColor.white
        self.navigationController?.navigationBar.shadowImage = UIImage.init()
        self.sectionsData.addObjects(from: ["1 section","2 section","3 section","4 section","5 section","6 section"])
        for t in 0...sectionsData.count {
            // cell - content
            let cntsData = NSMutableArray()
            let randomCount:Int = Int(arc4random()%12) + 1
            for i in 0...randomCount {
                let cnt:String = String(format: "cnt : %ld section,%ld cell", t,i)
                cntsData.add(cnt)
            }
            self.cellsData.add(cntsData)
            
            
            
            // header - button
            let btn:UIButton = UIButton(type: .custom)
            btnsData.add(btn)
        }
        cellsListData.addObjects(from: self.cellsData as! [Any])
        
    }
    

    //MARK: - TableViewDelegate TableViewDataSource
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionsData.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (cellsListData[section] as AnyObject).count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 56
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "CellID68")
        if cell==nil {
            cell = UITableViewCell.init(style: .default, reuseIdentifier: "CellID68")
        }
        //cell?.textLabel?.text = String(format: "%ld", indexPath.row)
        let tmpArr:NSMutableArray  = cellsListData[indexPath.section] as! NSMutableArray
        let cnt:String = tmpArr[indexPath.row] as! String
        cell?.textLabel?.text = cnt
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let vi:UIButton         = btnsData[section] as! UIButton
        var rect                = CGRect.zero
        rect.size.width         = self.view.bounds.size.width
        rect.size.height        = 30
        vi.frame                = rect
        let ti = String(format: "%ld section", section)
        vi.setTitle(ti, for: .normal)
        vi.titleLabel?.font     = UIFont.systemFont(ofSize: 12.0)
        vi.backgroundColor      = UIColor.purple
        vi.tag                  = 100 + section
        vi.addTarget(self, action: #selector(clickBtn(btn:)), for: .touchUpInside)
        return vi
    }
    
    // MARK: - click
    @objc func clickBtn(btn:UIButton) -> Void {
        btn.isSelected = !btn.isSelected
        print("\n \(#function) : btn.tag =  \(btn.tag)  btn.isSelected = \(btn.isSelected)\n")
        let location:Int = btn.tag - 100
        let nothingArr = NSMutableArray()
        let theArr     = cellsData[location]
        if btn.isSelected {
            cellsListData.replaceObject(at: location, with: nothingArr)
        }else{
            cellsListData.replaceObject(at: location, with: theArr)
        }
        table?.reloadData()
    }
    
    
    // MARK: - lazy load
    lazy var table: UITableView? = {
        let rltTable             = UITableView(frame: self.view.bounds, style: .plain)
        rltTable.delegate        = self
        rltTable.dataSource      = self
        rltTable.backgroundColor = UIColor.orange
        rltTable.separatorStyle  = .singleLine
        return rltTable
    }()
    

}
