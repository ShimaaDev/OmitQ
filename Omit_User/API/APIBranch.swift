//
//  APIBranch.swift
//  Omit_User
//
//  Created by shimaa alwaney on 8/5/20.
//  Copyright © 2020 Shimaa Alwaney. All rights reserved.
//

import UIKit
import Alamofire
import  SwiftyJSON

class APIBranch: NSObject {
    static var TimeElapsed = Double()
    class func Branch (completion:@escaping (_ error:Error?, _ ArrBranchServices: [BranchServices]?,_ ArrTimes:[branchTimes]?)-> Void){
        let url = URLS.GetBrancheData
        guard let BranchId = Helper.GetBrnchId() else{
            return
        }
        let params: Parameters = ["bid":BranchId] as[String: Any]
        AF.request(url, method: .get, parameters: params ,encoding: URLEncoding.default, headers: nil)
            .responseJSON { response in
                switch response.result {
                case  .failure(let error):
                    completion(error,nil, nil)
                    print(error)
                case .success(let value):
                    // print("value;\(value)")
                    let json = JSON(value )
                    // print("json: \(json)")
                    var ArrBranch = [BranchServices]()
                    var ArrTime = [branchTimes]()
                    
                    for item in json["BranchTimes"].arrayValue{
                        let Time = branchTimes()
                        Time.englishDay = item["EnglishDay"].string ?? ""
                       // print("englishDay\( String(describing: Time.englishDay))")
                        Time.hFrom = item["HFrom"].string ?? ""
                       // print("hFrom\( String(describing: Time.hFrom))")
                        Time.hTo = item["HTo"].string ?? ""
                       // print("hTo\( String(describing: Time.hTo))")
                        ArrTime.append(Time)
                    }
                    
                    for item in json["BranchServices"].arrayValue
                    {
                        let Branch = BranchServices()
                        Branch.id = item["ID"].int ?? 0
                       // print("Service ID:\(Branch.id!)")
                        
                        Branch.englishName = item["EnglishName"].string ?? ""
                    
                        //print("service englishName\(String(describing: Branch.englishName)))")
                        
                        Branch.timeElapsed = item["TimeElapsed"].double ?? 0
                        TimeElapsed =  Branch.timeElapsed!
                        //print("Service TimeElapsed :\(Branch.timeElapsed!)")
                        
                        Branch.cost = item["Cost"].double ?? 0
                       // print("Service cost :\(Branch.cost!)")
                        
                        
                        ArrBranch.append(Branch)
                        
                    }
                    
                    
                    completion(nil,ArrBranch, ArrTime)
                    
                }
        }
    }
    
}
