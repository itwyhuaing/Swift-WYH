//
//  DatePickViewVC.swift
//  SwiftUIDemo
//
//  Created by wangyinghua on 2018/1/6.
//  Copyright © 2018年 ZhiXing. All rights reserved.
//

import UIKit

class DatePickViewVC: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {

    var dpk = UIPickerView()
    var dataSource = NSMutableArray()
    
    var sw = UIScreen.main.bounds.width
    var sh = UIScreen.main.bounds.height
    let rowWidth : CGFloat = UIScreen.main.bounds.width / 3.0
    let rowHeight : CGFloat = 50.0
    let xoffset : CGFloat = 30.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        dpk.frame = CGRect(x:0,y:100,width:sw,height:300.0)
        dpk.delegate = self
        dpk.dataSource = self
        
        var rect = CGRect.zero
        rect.size.width = sw / 2.0
        rect.size.height = rect.width / 3.0
        rect.origin.x = sw / 2.0 - rect.size.width / 2.0
        rect.origin.y = dpk.frame.maxY + 30.0
        let btn = UIButton()
        btn.frame = rect
        btn.setTitle("修改最新时间", for: .normal)
        btn.setTitleColor(UIColor.blue, for: .normal)
        btn.setTitleColor(UIColor.red, for: .highlighted)
        btn.layer.cornerRadius = btn.frame.height / 2.0
        btn.layer.borderColor = UIColor.white.cgColor
        btn.layer.borderWidth = 0.5
        btn.addTarget(self, action: #selector(s), for: .touchUpInside)
        
        let arr1 = ["上午","下午"]
        let arr2 = ["1","2","3","4","5","6","7","8","9","10","11","12"]
        let arr3 = NSMutableArray()
        for i in 0...59{
            var cou = String(i)
            if i < 10 {
                cou = "0" + String(i)
            }
            arr3.add(cou)
        }
        //dataSource.addObjects(from: arr1,arr2,arr3)
        dataSource.add(arr1)
        dataSource.add(arr2)
        dataSource.add(arr3)
        print(dataSource)
        
        
        
        self.view.addSubview(dpk)
        self.view.addSubview(btn)
        
    }

    override func viewWillAppear(_ animated: Bool) {
        // 移除导航栏底部线条
        self.view.backgroundColor = UIColor.black
        self.navigationController?.navigationBar.barTintColor = UIColor.black
        self.navigationController?.navigationBar.tintColor    = UIColor.white
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor:UIColor.white]
        self.navigationController?.navigationBar.shadowImage  = UIImage.init()
        self.navigationController?.navigationBar.tintColor    = UIColor.white
        self.title = "编辑闹钟"
        
    }
    
    
/**<UIPickerViewDelegate>*/
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        var tmp : CGFloat = rowWidth
        if component == 0 {
            tmp = rowWidth + xoffset
        }else{
            tmp = rowWidth - xoffset/2.0
        }
        return tmp
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return rowHeight
    }
    
//    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
//        let atbs = NSAttributedString(string: "title", attributes: nil)
//
//        return atbs
//    }
    
//    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//        return (dataSource[component] as! Array)[row]
//    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let l = UILabel()
        var w = rowWidth
        if component == 0 {
            w = rowWidth + xoffset
        }else{
            w = rowWidth - xoffset/2.0
        }
        l.frame = CGRect(x:0,y:0,width:w,height:rowHeight)
        //l.backgroundColor = UIColor.red
        l.font = UIFont.systemFont(ofSize: 18.0)
        l.textColor = UIColor.white
        l.textAlignment = .center
        if component == 0 {
            l.textAlignment = .right
        }else if component == 2{
            l.textAlignment = .left
        }
        l.text = (dataSource[component] as! Array)[row]
        return l
    }
    
/**<UIPickerViewDataSource>*/
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return dataSource.count
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return (dataSource[component] as AnyObject).count
    }
    
    
/**<点击事件>*/
    @objc func s(btn:UIButton) {
        print(" 点击事件 ")
    }
    
}
