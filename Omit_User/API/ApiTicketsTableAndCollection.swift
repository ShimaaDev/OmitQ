//
//  ApiTicketsTableAndCollection.swift
//  Omit_User
//
//  Created by shimaa alwaney on 8/17/20.
//  Copyright © 2020 Shimaa Alwaney. All rights reserved.
//

import UIKit
import Alamofire
import  SwiftyJSON
class ApiTicketsTableAndCollection: NSObject {
//    static var date = 0.0
//    static var time = 0.0
        static var WaitingMintues = Double()
//        static var TCanceled = Bool()
//        static var TicketCost = Double()
//        static var BranchName = String()
        static var BookingDate = String()
    class func all_tickets (completion:@escaping (_ error:Error?, _ AllTickestCollection: [TicketCollection]?)-> Void){
        print("hello")
        let url = URLS.get_all_tickets //"http://hammad1995-001-site1.itempurl.com/API/tickets/getalltickets?userid=5"
        
                       guard let UserId = Helper.getid() else{return}
                                     print("UserId\(UserId)")
        let params: Parameters = ["userid":UserId] as[String: Any]
        
        AF.request(url, method: .get,parameters: ["userid":UserId],encoding: URLEncoding.default, headers: nil)
            .responseJSON { response in
                switch response.result {
                case  .failure(let error):
                    completion(error,nil)
                    print(error)
                case .success(let value):
                    // print("value;\(value)")
                    let json = JSON(value )
                    print("json: \(json)")
                    var ArrTicket = [TicketCollection]()
                    for item in json.arrayValue{
                        //if  item ["isApproved"] == false && item ["isCanceled"] == false{
                    let MyTicket = TicketCollection()
//                        MyTicket.ticketCost = item ["ticketCost"].double ?? 0.0
//                        print("MyTicketCost: \(String(describing: MyTicket.ticketCost))")
//                        MyTicket.ticketTime = item ["ticketTime"].string ?? ""
//                        print("TicketTime: \(String(describing:  MyTicket.ticketTime))")
                        MyTicket.ticketNo = item ["TicketNo"].string ?? ""
                        print("TicketNumber: \(String(describing: MyTicket.ticketNo))")
//                        MyTicket.isApproved = item ["isApproved"].bool
//                        print("isApproved: \(String(describing: MyTicket.isApproved))")
//                        MyTicket.isCanceled = item ["isCanceled"].bool
//                        TCanceled = MyTicket.isCanceled!
//                        print("isCanceled: \(String(describing:TCanceled))")
//                        MyTicket.serviceID = item ["serviceID"].int ?? 0// to get service name..
//                        print("serviceID: \( String(describing: MyTicket.serviceID))")
//                        MyTicket.branchID = item ["branchID"].int ?? 0// to get branch logo and name..
//                        print("branchID: \( String(describing: MyTicket.branchID))")
                        MyTicket.ticketID = item ["TicketID"].int ?? 0// to get Certain Ticket..
                        print("ApiticketID: \( String(describing: MyTicket.ticketID))")
                        MyTicket.persons = item["Persons"].int ?? 0
                        MyTicket.bookingDate = item["BookingDate"].string ?? ""
                        MyTicket.branchName = item["BranchName"].string ?? ""
                        MyTicket.serviceName = item["ServiceName"].string ?? ""
                        MyTicket.branchLogo = item["BranchLogo"].string ?? ""
                        MyTicket.waitingMintues = item["WaitingMintues"].double ?? 0.0

                        ArrTicket.append(MyTicket)
                       
                        }
                   // }
                    
                    completion(nil,ArrTicket)
                    
                }
        }
    }
    
                      
    
    
    
    
    class func GetCertainTicket (completion: @escaping(_ error:Error?, _ success:Bool)->Void){
        let url = URLS.GetTicketById

        guard let ParamTicketId = Helper.GetTicketId()else{return}
        print("TicketID: \(ParamTicketId)")
        
        let params: Parameters = ["tid":ParamTicketId] as[String: Any]
        AF.request(url, method: .get, parameters: params ,encoding: URLEncoding.default, headers: nil)
            .responseJSON { response in
                switch response.result {
                case  .failure(let error):
                    completion(error,false)
                    print("berror is:\(error)")
                case .success(let value):
                    // print("value;\(value)")
                    let json = JSON(value )
                    print("json: \(json)")
                    
                     BookingDate = json["BookingDate"].string ?? ""
                    let TicketCost = json["TicketCost"].float ?? 0.0
                     WaitingMintues = json["WaitingMintues"].double ?? 0.0
//                  let BranchName = json["BranchName"].string ?? ""
//                    let ServiceName = json["ServiceName"].string ?? ""
//                    let TicketNo = json["TicketNo"].string ?? ""
//                    let Persons = json["Persons"].int ?? 0
//                    let BranchLogo = json["BranchLogo"].string ?? ""
//                    let TicketTime = json["TicketTime"].string ?? ""
                    
                    
                    completion(nil,true)
                    
                }
        }
    }

}
