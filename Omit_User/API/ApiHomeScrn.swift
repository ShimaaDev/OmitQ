//
//  ApiHomeScrn.swift
//  Omit_User
//
//  Created by shimaa alwaney on 7/25/20.
//  Copyright © 2020 Shimaa Alwaney. All rights reserved.
//

import UIKit
import Foundation
import Alamofire
import SwiftyJSON

class ApiHomeScrn: NSObject {
    static var lat = 0.0
    static var lng = 0.0
    
    //Catigories TableView..
    class func Catigories (completion:@escaping (_ error:Error?, _ Catigories: [Catigory]?)-> Void){
        let url = URLS.Catigories
        
        AF.request(url, method: .get, parameters: nil ,encoding: URLEncoding.default, headers: nil)
            .responseJSON { response in
                switch response.result {
                case .failure(let error):
                    completion(error,nil)
                    print(error)
                case .success(let value):
                    // print("value;\(value)")
                    let json = JSON(value )
                    //print("json: \(json)")
                    
                    var Catigories_api = [Catigory]()
                    for item in json.arrayValue{
                        let Catig = Catigory()
                        Catig.id = item["ID"].int ?? 0
//                        Helper.SaveCatgId(uid: Catig.id)
                  //      print("categoryID:\(Catig.id!)")
                    
                        Catig.englishName = item["EnglishName"].string ?? ""
                        print("categoryName:\(Catig.englishName!)")

                        
                        Catig.logo = item["Logo"].string ?? ""
                        
                        Catigories_api.append(Catig)
                        
                             completion(nil,Catigories_api)
                        
                    }
                    
               
                    
                    
                }
                
        }
    }
    
     //ServicesAround TableView..
    class func ServicesAroundTable(completion:@escaping (_ error:Error?, _ Services:[Service]?)->Void){
        let url = URLS.ServicesAround
        
        AF.request(url, method: .get, parameters: nil ,encoding: URLEncoding.default, headers: nil)
            .responseJSON { response in
                switch response.result {
                case  .failure(let error):
                    completion(error,nil)
                    print(error)
                case .success(let value):
                    // print("value;\(value)")
                    let json = JSON(value )
                    // print("json: \(json)")
                    
                    var services = [Service]()
                    for item in json.arrayValue{
                        let Serv = Service()
                        Serv.id = item["ID"].int ?? 0
                        Serv.englishName = item["EnglishName"].string ?? ""
                        Serv.largeLogo = item["LargeLogo"].string ?? ""
                        Serv.smallLogo = item["SmallLogo"].string ?? ""
                        Serv.location = item["Location"].string ?? ""
                        //  print("API Location:\(String(describing: Serv.location))")
                        let location =  Serv.location
                        // print(myInt1!)
                        let splitedlocation = location!.components(separatedBy: [","])
                        //  print("splitedlocation:\(splitedlocation)")
                        lng = Double(splitedlocation[0].trimed)!
                        lat = Double(splitedlocation[1].trimed)!
                        print("lat:\( lat)")
                        print("lng:\(lng)")

                        
                        services.append(Serv)
                        
                        
                        
                        completion(nil,services)
                    }
                
                    
                }
                
        }
        
    }
}

