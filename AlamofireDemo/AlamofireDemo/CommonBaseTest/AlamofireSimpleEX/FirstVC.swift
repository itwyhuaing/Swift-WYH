//
//  FirstVC.swift
//  AlamofireDemo
//
//  Created by hnbwyh on 2018/2/2.
//  Copyright © 2018年 ZhiXingJY. All rights reserved.
//

import UIKit
import Alamofire

class FirstVC: UITableViewController {

    
    var dataSource = ["简单网络请求","简单数据解析",
                      "响应序列化类型","链式响应(同一请求的不同序列化)",
                      "响应队列","响应队列 - 组队列、同一队列 (notify)",
                      "下载","上传"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "FirstVC"
        
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cellID")
        if cell == nil {
            cell = UITableViewCell.init(style: .default, reuseIdentifier: "cellID");
        }
        cell?.textLabel?.text = dataSource[indexPath.row]
        return cell!
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            self.simpleReqExample()
            
            break
            
        case 1:
            self.simpleJsonParserExample()
            
            break
            
        case 2:
            self.responseType()

            break
        case 3:
            self.seriesResponse()
            
            break
        case 4:
            self.responseQueue()
            
            break
        case 5:
            self.responseGroupTheQueue()
            
            break
        case 6:
            self.downLoadSource()
            
            break
        case 7:
            self.uploadSource()
            
            break
        case 8:
            
            
            break
        default:
            break
        }
    }
    
    //  MARK: - inner method
    func simpleReqExample() -> Void {
        let URLString = "https://m.ctrip.com/restapi/soa2/10290/GetAppConfig.json"
        let para:Parameters = ["head": [
            "sauth": "",
            "extension": [[
                "name": "appid",
                "value": "99999999"
                ]],
            "lang": "01",
            "syscode": "12",
            "sid": "8890",
            "auth": "",
            "cver": "710.002",
            "ctok": "c27f42e37491cc656ec3f79a468f671018c5ed6d524fcf1bde9a245e02272cd7",
            "cid": "12001131710060559645"
            ]]
        
        let isMainQueue = true
        if isMainQueue {
            // 回调在主线程
            Alamofire.request(URLString, method: .post, parameters: para).responseJSON { (resJson) in
                
                switch resJson.result {
                case .success:
                    print(" \n 数据测试 - success - \(Thread.current) \n ")
                    break
                    
                case .failure:
                    print(" \n 数据测试 - failure - \(Thread.current) \n ")
                    break
                    
                }
                
            }
            
        }else{
            // 回调在子线程
            let utQueue = DispatchQueue.global(qos: .utility)
            Alamofire.request(URLString, method: .post, parameters: para).responseJSON(queue:utQueue) { (resJson) in
                switch resJson.result {
                case .success:
                    print(" \n 数据测试 - success - \(Thread.current) \n ")
                    break
                    
                case .failure:
                    print(" \n 数据测试 - failure - \(Thread.current) \n ")
                    break
                    
                }
                
            }

        }
        
        
    }
    
    func simpleJsonParserExample() -> Void {
        let URLString = "https://www.hinabian.com/user_register/appGetMobileNation88"
        Alamofire.request(URLString, method: .post).responseJSON { (resJson) in
            switch resJson.result {
            case .success:
                print(" \n 数据测试 - resJon : \(resJson)\n ")
                break;
                
            case .failure:
                print(" \n 数据测试 - error : \(resJson.error)\n ")
                break;
            }
            
        }
        
        
    }
    
    func responseType() -> Void {
        // 单个响应
        let URLString = "https://www.hinabian.com/user_register/appGetMobileNation"
        
        // 响应数据 Handler - 未序列化的响应
        Alamofire.request(URLString).response(completionHandler: { (res) in
            print(" \n 未序列化的响应 - response : \(res)\n ")
        })
        
        // 响应数据 Handler - 序列化成数据类型
        Alamofire.request(URLString).responseData(completionHandler: { (resData) in
            print(" \n 序列化成数据类型 - responseData : \(resData)\n ")
        })
        
        // 响应 JSON Handler - 序列化成 Any 类型
        Alamofire.request(URLString).responseJSON(completionHandler: { (resJSON) in
            print(" \n 序列化成 JSON 类型 - responseJSON : \(resJSON)\n ")
        })
        
        // 响应字符串 Handler - 序列化成字符串类型
        Alamofire.request(URLString).responseString(completionHandler: { (resString) in
            print(" \n 序列化成字符串类型 - responseString : \(resString)\n ")
        })
        
        // 响应 PropertyList (plist) Handler - 序列化成 Any 类型
        Alamofire.request(URLString).responsePropertyList(completionHandler: { (resList) in
            print(" \n PropertyList - resList : \(resList)\n ")
        })
        
    }
    
    func seriesResponse() -> Void {
        // 链式响应 - 同一请求的多次序列化
        let URLString = ""
        Alamofire.request(URLString)
            .responseData(completionHandler: { (resData) in
                
            })
            .responseJSON(completionHandler: { (resJson) in
                
            })
        
    }
    
    func responseQueue() -> Void {
        // 响应队列
        let URLString1 = "http://api.mison.cn/v1/live/onetoone"
        let URLString2 = "https://www.hinabian.com/user_register/appGetMobileNation"
        let URLString3 = "http://api.mison.cn/v1/banners"
        let queue = DispatchQueue.global(qos:.utility)
        Alamofire.request(URLString1).responseJSON(queue: queue,completionHandler: { (resJson) in
            print(" \n 数据测试 URLString1 \n ")
        })
        
        Alamofire.request(URLString2).responseJSON(queue: queue) { (resJson) in
            print(" \n 数据测试 URLString2 \n ")
        }
        
        Alamofire.request(URLString3).response(queue: queue) { (resJson) in
            print(" \n 数据测试 URLString3 \n ")
        }
        print(" \n == 测试 == \n ")
        
    }
    
    
    func responseGroupTheQueue() -> Void {
        // 响应队列 - 组队列、同一队列 (notify)
        let URLString1 = "http://api.mison.cn/v1/live/onetoone"
        let URLString2 = "https://www.hinabian.com/user_register/appGetMobileNation"
        let URLString3 = "http://api.mison.cn/v1/banners"
        
        let group  = DispatchGroup()
        let queue = DispatchQueue.global()
        group.enter()
        Alamofire.request(URLString1).responseJSON (queue:queue ,completionHandler: { (resJson) in
            print(" \n 数据测试 URLString1 \n ")
            group.leave()
        })
        
        group.enter()
        Alamofire.request(URLString2).responseJSON(queue:queue ,completionHandler:{ (resJson) in
            print(" \n 数据测试 URLString2 \n ")
            group.leave()
        })
        
        group.enter()
        Alamofire.request(URLString3).responseJSON (queue:queue ,completionHandler:{ (resJson) in
            print(" \n 数据测试 URLString3 \n ")
            group.leave()
        })
        group.notify(queue: queue) {
            print(" \n == notify 测试 ==  \n ")
        }
        
    }
    
    func downLoadSource() -> Void {
        // 下载
        Alamofire.download("https://httpbin.org/image/png")
            .downloadProgress { progress in
                print("Download Progress: \(progress.fractionCompleted)")
            }
            .responseData { response in
                if let data = response.result.value {
                    let image = UIImage(data: data)
                }
        }
        
    }
    
    func uploadSource() -> Void {
        
        
    }
    
    
}
