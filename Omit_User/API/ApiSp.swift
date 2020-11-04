//
//  ApiSp.swift
//  Omit_User
//
//  Created by shimaa alwaney on 7/27/20.
//  Copyright © 2020 Shimaa Alwaney. All rights reserved.
//

import UIKit
import Alamofire
import  SwiftyJSON

class ApiSp: NSObject {
    static var SpName = ""
    static var BrnchName = ""
    static var branch_address = ""
    //CatgSp TableView..
    class func CatgSpS (completion:@escaping (_ error:Error?, _ CatgSpS: [CatgSp]?)-> Void){
        let url = URLS.getcategorysp
        guard let catid = Helper.GetCatgId() else{
            return
        }
        let params: Parameters = ["catid":catid] as[String: Any]
        AF.request(url, method: .get, parameters: params ,encoding: URLEncoding.default, headers: nil)
            .responseJSON { response in
                switch response.result {
                case  .failure(let error):
                    completion(error,nil)
                    print(error)
                case .success(let value):
                    // print("value;\(value)")
                    let json = JSON(value )
                    //print("json: \(json)")
                    
                    var CatgSpS = [CatgSp]()
                    
                    for item in json.arrayValue{ 
                        let CSp = CatgSp()
                        CSp.id = item["ID"].int ?? 0
                        
                        // print("categoryID:\(CSp.id!)")
                        CSp.englishName = item["EnglishName"].string ?? ""
                        // print("englishName:\(CSp.englishName!)")
                        CSp.logo = item["Logo"].string ?? ""
                        //  print("logo:\(CSp.logo!)")
                        CatgSpS.append(CSp)
                        
                    }
                    
                    completion(nil,CatgSpS)
                    
                }
        }
    }
    
    
    
    //CatgSp TableView..
    class func SpBrnches (completion:@escaping (_ error:Error?, _ SpBranches: [SpBranch]?)-> Void){
        let url = URLS.getSpBranches
        guard let SpId = Helper.GetspId() else{
            return
        }
        let params: Parameters = ["SpId":SpId] as[String: Any]
        AF.request(url, method: .get, parameters: params ,encoding: URLEncoding.default, headers: nil)
            .responseJSON { response in
                switch response.result {
                case  .failure(let error):
                    completion(error,nil)
                    print(error)
                case .success(let value):
                    // print("value;\(value)")
                    let json = JSON(value )
                    //print("json: \(json)")
                    
                    var SpBranches = [SpBranch]()
                    for item in json.arrayValue{
                        let SpB = SpBranch()
                        SpB.id = item["ID"].int ?? 0
                         //print("categoryID:\(SpB.id!)")
                        SpB.englishName = item["EnglishName"].string ?? ""
                        print("englishName:\(SpB.englishName!)")
                         BrnchName =  SpB.englishName
//                        let splitedBranchName = BName!.components(separatedBy: [","])
//                           print("splitedBranchName:\(splitedBranchName)")
//                        SpName = String(splitedBranchName[0].trimed)
//                        BrnchName = String(splitedBranchName[1].trimed)
//                         print("SpName:\( SpName)")
//                         print("BrnchName:\(BrnchName)")
                        SpB.Address = item["Address"].string ?? ""
                        branch_address = SpB.Address
                        SpB.largelogo = item["LargeLogo"].string ?? ""
                         //print("logo:\(String(describing: SpB.largelogo))")
                        SpB.smalllogo = item["SmallLogo"].string ?? ""
                        //print("logo:\(String(describing: SpB.smalllogo))")
                        SpBranches.append(SpB)
                        
                    }
                   
                    
                    completion(nil,SpBranches)
                    
                }
        }
    }
    
    
}
