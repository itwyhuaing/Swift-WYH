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

    var dataSource = ["11","12","13","14","15"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "FirstVC"
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
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
            // https://www.hinabian.com/user_register/appGetMobileNation
            // https://m.ctrip.com/restapi/soa2/10290/GetAppConfig.json
        case 0:
            let URLString = "https://m.ctrip.com/restapi/soa2/10290/GetAppConfig.json";
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
            
            // 回调在主现场
            //Alamofire.request(URLString,method:.post,parameters:para).responseJSON{ resJson in
            
            // 回调在子线程
            let utQueue = DispatchQueue.global(qos:.utility)
            Alamofire.request(URLString, method: .post, parameters: para).responseJSON(queue:utQueue){ resJson in
            
                //print(" 携程数据请求 次数：\(0) resJson: \(resJson)")
                
                    switch resJson.result{
                        case .success:
                            print(" 携程数据请求 次数：\(0) resJson: \(resJson), 当前线程 :\(Thread.current)")
                        case .failure(let error):
                            print(" 携程数据请求 - failure : \(error) ")
                    }
                    
                }

            break
            
        case 1:
            let URLString = "https://www.hinabian.com/user_register/appGetMobileNation";
            
//            Alamofire.request(URLString).responseJSON{ resJson in
//                print(" \n 携程数据请求 次数：resJson: \(resJson) \n")
//                print(" \n 原始的URL请求：request: \(resJson.request) \n")
//                print(" \n HTTP URL响应：response: \(resJson.response) \n")
//                print(" \n 服务器返回的数据：data: \(resJson.data) \n")
//                print(" \n 响应序列化结果，在这个闭包里，存储的是JSON数据：result: \(resJson.result) \n")
//            }
            
            Alamofire.request(URLString).responseJSON(completionHandler: { (resJson) in
                print(" \n 携程数据请求 次数：resJson: \(resJson) \n")
                print(" \n 原始的URL请求：request: \(resJson.request) \n")
                print(" \n HTTP URL响应：response: \(resJson.response) \n")
                print(" \n 服务器返回的数据：data: \(resJson.data) \n")
                print(" \n 响应序列化结果，在这个闭包里，存储的是JSON数据：result: \(resJson.result) \n")
            })
            
            break
            
        case 2:
            
            // 单个响应
            let URLString = ""
            Alamofire.request(URLString).response(completionHandler: { (res) in
                
            })
            
            Alamofire.request(URLString).responseData(completionHandler: { (resData) in
                
            })
            
            Alamofire.request(URLString).responseJSON(completionHandler: { (resJsON) in
                
            })
            
            Alamofire.request(URLString).responseString(completionHandler: { (resString) in
                
            })
            
            Alamofire.request(URLString).responsePropertyList(completionHandler: { (resList) in
                
            })
            
            
            // 链式响应
            Alamofire.request(URLString)
                .responseData(completionHandler: { (resData) in
                
            })
                .responseJSON(completionHandler: { (resJson) in
                    
                })
            
            
            // 响应队列
            let queue = DispatchQueue.global(qos:.utility)
            Alamofire.request(URLString).responseJSON(queue: queue,completionHandler: { (resJson) in
                
            })
            
            
            
            break
        case 3:
            
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
            
            
            break
        default:
            break
        }
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
