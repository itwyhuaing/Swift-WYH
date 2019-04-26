//
//  SecondVC.swift
//  AlamofireDemo
//
//  Created by hnbwyh on 2018/2/28.
//  Copyright © 2018年 ZhiXingJY. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import HandyJSON

class SecondVC: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    
    
    
    
    
    // MARK: -life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(self.table)
        self.navigationItem.largeTitleDisplayMode = .never
        
    }

    
    override func viewWillAppear(_ animated: Bool) {
        self.view.backgroundColor = UIColor.white
        self.title = NSStringFromClass(self.classForCoder).components(separatedBy: ".").last
        
    }
    
    // MARK -UITableViewDataSource,UITableViewDelegate
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.thems.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "CellID")!
        cell.textLabel?.text = self.thems[indexPath.row]
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        switch indexPath.row {
        case 0:
            self.simpleJsonParserExample()
            break
            
        case 1:
            self.valueWithDicInfo()
            break
            
        case 2:
            self.deCodableModelExample()
            break
            
        case 3:
            self.handyJsonToModelExample()
            break
            
        default:
            break
        }
    }
    
    
    // MARK: -lazy load
    lazy var table:UITableView = {
        () -> UITableView in
        let scn = UIScreen.main.bounds.size
        let rltV = UITableView.init(frame: CGRect.init(x: 0, y: 64.0, width: scn.width, height: scn.height-64.0), style: .plain)
        rltV .register(UITableViewCell.classForCoder(), forCellReuseIdentifier: "CellID")
        rltV.delegate   = self
        rltV.dataSource = self
        return rltV
    }()
    
    lazy var thems:[String] = {
        () -> [String] in
        let rlt:[String] = ["SwiftyJSON:链式取值并非转Model","Dic(setValuesForKeys)Model",
                            "Dic(原生实现/Decodable)Model","Dic(HandyJSON)Model",
                            "Dic(ObjectMapper)Model"]
        return rlt
    }()
    
    
    // MARK -inner method
    func valueWithDicInfo() -> Void {
        let datas = NSMutableArray.init()
        for index in 1...2 {
            let tmpD = "\(index)"
            let tmpS = "showstring\(index)"
            let dict = [
                "tid":tmpD,
                "showstring":tmpS
                ] as [String : Any]
            datas.add(dict)
            
            let f:ExInfoModel  = ExInfoModel.init()
            f.setValuesForKeys(dict)
            print(" \n f.tid = \(f.tid) f.showstring = \(f.showstring) \n ")
            
        }
        
        print(" \n 数据测试结束 \n ")
        
    }
    
    
    func simpleJsonParserExample() -> Void {
        let URLString = "https://www.hinabian.com/user_register/appGetMobileNation"
        Alamofire.request(URLString, method: .post).responseJSON { (resJson) in
            switch resJson.result {
            case .success:
                let json = JSON(resJson.value)
                print(" \n 数据测试 - resJon : \(json["data","country_telid",0,"id"]) \n ") // .rawDictionary["data","country_telid"]
                break
                
            case .failure:
                print(" \n 数据测试 - error : \(resJson.error)\n ")
                break
            }
            
        }
    }
    
    
    func deCodableModelExample() -> Void {
        // [swift json转模型](https://www.jianshu.com/p/c4147745776c)
        guard let url = Bundle.main.path(forResource: "decodabledata", ofType: "json") else {
                                                                                print("  \n url 没有数据  \n ")
                                                                                return }
        let data = try?Data(contentsOf: URL(fileURLWithPath: url), options: Data.ReadingOptions.alwaysMapped)
        guard let arr = try?JSONDecoder().decode([CodableModel].self, from: data!) else {
            print("  \n Arr 没有数据  \n ")
            return
        }
        print(" \n 数据测试 \n Arr = \(arr)  \n  Arr[0] = \(arr[0]) \n Arr[1] = \(arr[1]) \n Arr[0].id = \(arr[0].id) \n Arr[1].model = \(String(describing: arr[1].model))  \n ")
        
    }
    
    
    func handyJsonToModelExample() -> Void {
        guard let url = Bundle.main.path(forResource: "handyjsondata", ofType: "json") else {
                                                                                print("  \n url 没有数据  \n ")
                                                                                return }
        let jsonString = try?String.init(contentsOf: URL(fileURLWithPath: url))
        if let hjd = HandyJsonModel.deserialize(from:jsonString) {
            print("\n \(Bool(hjd.alv)) \n \(hjd.frd) \n \(hjd.clr) \n \(hjd.wgt) \n")
        }
    }
    
    
    func objectMapperToModelExample() -> Void {
        
    }
    
    
}
