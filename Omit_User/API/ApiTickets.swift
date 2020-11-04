//
//  ApiTickets.swift
//  Omit_User
//
//  Created by shimaa alwaney on 8/9/20.
//  Copyright © 2020 Shimaa Alwaney. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
class ApiTickets: NSObject {
    static var api_booking_time = String()
    static var Paramcost = Double()
    static var MyTicketCost = Double()
    static var TicketNum = String()
    static var api_timeelapsed = Double()
//    static var ApiCost = Double()
    static var NumberOfPersons = Int()
//    static var WaitingTime = Int()
    
    class func GetPersonsAndWaitingTime(completion:@escaping (_ error:Error?, _ ArrServiceTicket: [ServiceTicket]?)-> Void){
        
        let url = URLS.getserviceq
        guard let ServiceId = Helper.GetServiceId()else{return}
        print(ServiceId)
        let params: Parameters = ["sid":ServiceId] as[String: Any]
        
        AF.request(url, method: .get, parameters: params ,encoding: URLEncoding.queryString, headers: nil)
            .responseJSON { response in
                switch response.result {
                case  .failure(let error):
                    completion(error,nil)
                    print(error)
                case .success(let value):
                    // print("value;\(value)")
                    let json = JSON(value )
                    //print("json: \(json)")
                    // NumberOfPersons..
                    NumberOfPersons = json.array!.count
                    //   print("NumberOfPersons\(NumberOfPersons)")
                    //     var ServTimeElapsed =
                    //                          WaitingTime =
                    print("NumberOfPersons\(String(describing: NumberOfPersons))")
                    let ArrTickets = [ServiceTicket]()
                    
                    //                            for item in json.arrayValue{
                    //                        let Service = ServiceTicket()
                    //
                    //                                ApiCost =  json["ticketCost"].double ?? 0.0
                    //
                    //                          ArrTickets.append(Service)
                    //                          }
                    
                    completion(nil,ArrTickets)
                    
                }
        }
    }
    
    
    
    //     /   /   /   /   /     /   /   /    /   /   /   /   /   /   /   /   /   /   / /   /   /   /   /   /   //
    
    
    
    class func TakeQue (completion: @escaping(_ error:Error?, _ success:Bool)->Void){
        let url = "http://hammad1995-001-site1.itempurl.com/API/tickets/takeaturn"
//            URLS.TakeQ
        
        guard let UserId = Helper.getid() else{return}
        print("UserId\(UserId)")
        guard let BranchId = Helper.GetBrnchId() else{return}
        print("BranchId\(BranchId)")
        guard let ServiceId = Helper.GetServiceId()else{return}
        print("ServiceId\(ServiceId)")
        let Cost =  Paramcost //ApiCost
        print("Cost: \(Cost)")
        let Time = self.api_timeelapsed
        
        let params: Parameters = ["bid":BranchId,"uid":UserId,"cost": Cost,"time": Time,"sid":ServiceId, "bookingtime": api_booking_time] as[String: Any]
        AF.request(url, method: .post, parameters: params ,encoding: URLEncoding.queryString, headers: nil)
            .responseJSON { response in
                switch response.result {
                case  .failure(let error):
                    completion(error,false)
                    print("berror is:\(error)")
                case .success(let value):
                    // print("value;\(value)")
                    let json = JSON(value )
                    print("json: \(json)")
                    
                    let TicketID =  json["TicketID"].int ?? 0
                    Helper.SaveTicketId(TicketId: TicketID)
                    if let SavedTicketID = Helper.GetTicketId(){
                        print("SavedTicketID: \(String(describing: SavedTicketID))")
                    }
                    MyTicketCost =  json["TicketCost"].double ?? 0.0
                    print("MyTicketCost: \(String(describing: MyTicketCost))")
                    
                    let TicketTime = json["TicketTime"].string ?? ""
                    print("TicketTime: \(String(describing: TicketTime))")
                    
                    TicketNum = json["TicketNo"].string ?? ""
                    print("TicketNumber: \(String(describing: TicketNum))")
                    
                        completion(nil,true)
                    
                }
        }
    }
    
    
    class func CancelTicket(completion: @escaping(_ error:Error?, _ success:Bool)->Void)
    {
        let url = URLS.CancelTicket
        guard let TicketID = Helper.GetTicketId() else{return}
        let params : Parameters = ["tid":TicketID] as [String : Any]
        
        AF.request(url, method: .post, parameters: params, encoding: URLEncoding.queryString,headers: nil, interceptor: nil)
            .validate(statusCode: 200..<300)
            .responseJSON { response in
                switch response.result
                {
                    
                case  .failure(let error):           //failure
                    completion(error,false)
                    print(error)
                    
                case .success(let value):           //SUCCESS
                    //print(value)
                    let json = JSON(value)
                    print("json: \(json)")
                    print("Ticket Canceled")
                    completion(nil,true)
                }
        }
    }
    
}
