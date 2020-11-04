//
//  Api.swift
//  Omit_User
//
//  Created by shimaa alwaney on 5/27/20.
//  Copyright © 2020 Shimaa Alwaney. All rights reserved.
//

import UIKit
import Alamofire
import  SwiftyJSON
class Api: NSObject {
  
    //  IsExist
    
//    class func IsExist(username:String,completion: @escaping(_ error:Error?, _ success:Bool)->Void)
//    {
//        let url = URLS.isexist
//        let params :Parameters = [username:"username"] as [String : Any]
//
//        AF.request(url, method: .post, parameters: params, encoding: URLEncoding.queryString,headers: nil, interceptor: nil)
//            .validate(statusCode: 200..<300)
//            .responseJSON { response in
//                switch response.result
//                {
//                case  .failure(let error):          //failure
//                    completion(error,false)
//                    print(error)
//
//                case .success(let value):
//                    //SUCCESS
//                    print("value is : \(value)")
//
//                    let json = JSON(value)
//                    print("Json Object : \(json)")
//
//                    if let uid = json ["id"].int64{
//                            print("user id:\(uid)")
//                          Helper.saveuid(uid:uid)
//                    }
//
//                    if let uname = json ["userName"].string{
//                                      print("username:\(uname)")
//
//                    }
//            }
//        }
//          completion(nil,true)
//    }
    
                                                    // SIGNUP...
    class func signup(displayname:String,username:String,phone:String, password:String, completion: @escaping(_ error:Error?, _ success:Bool)->Void)
    {
        let url = URLS.signup
        let params : Parameters = ["username":username, "password":password,"phone":phone,"displayname":displayname] as [String : Any]
        
        AF.request(url, method: .post, parameters: params, encoding: URLEncoding.queryString,headers: nil, interceptor: nil)
           .validate(statusCode: 200..<300)
            .responseJSON { response in
                switch response.result
                {
                case  .failure(let error):          //failure
                    completion(error,false)
                    print(error)
                    
                case .success(let value):
                    //SUCCESS
                    print("value is : \(value)")
                    
                    let json = JSON(value)
                    
                    if let uid = json ["id"].int64{
                        print("user id:\(uid)")
                         //   Helper.saveuid(uid:uid)
                        
                    if let uname = json ["userName"].string{
                        print("username:\(uname)")
//                      Helper.saveusername(uname:uname)
                            completion(nil,true)
                        
                        
                    }
                    
                }
        }
    }
    }
    
    //                                    //SendVerificationCode
    //
    //    class func sendcode(uemail:String,uid:Int64,completion: @escaping(_ error:Error?,_ success:Bool)->Void){
    //
    //        let url = URLS.sendcode
    //        let params: Parameters = ["uemail": uemail,"uid":uid] as[String: Any]
    //
    //        AF.request(url, method: .post, parameters: params, encoding: URLEncoding.queryString,headers: nil, interceptor: nil)
    //           .validate(statusCode: 200..<300)
    //           .responseJSON { response in
    //               switch response.result {
    //                  case  .failure(let error):
    //                      completion(error,false)
    //                       print(error)
    //
    //                  case .success(let value):
    //                 print("value;\(value)")
    //                   completion(nil,true)
    //            }
    //        }
    //    }
    
    //VerifyUserEmail
    
    class func verifyuemail(uemail:String,uid:Int64,code:String,completion: @escaping(_ error:Error?,_ success:Bool)->Void){
        
        let url = URLS.verifyemail
        let params: Parameters = ["uemail": uemail,"uid":uid,"code":code]
        
        AF.request(url, method: .post, parameters: params, encoding: URLEncoding.queryString,headers: nil, interceptor: nil)
            .validate(statusCode: 200..<300)
            .responseJSON { response in
                switch response.result {
                case  .failure(let error):
                    completion(error,false)
                    print(error)
                    
                case .success(let value):
                    let json = JSON(value)
                    print("json: \(json)")
                    //
                    //                   if let useremail = json["email"].string
                    //                   {
                    //                 //   Helper.saveuseremail(useremail: useremail)
                    //                    print("email saved")
                    //                   }
                    completion(nil,true)
                }
        }
    }
    
    // SIGNIN
    
    class func login(username:String,password:String, completion: @escaping(_ error:Error?, _ success:Bool)->Void)
    {
        let url = URLS.signin
        let params : Parameters = ["username":username, "password":password] as [String : Any]
        
        AF.request(url, method: .post, parameters: params, encoding: URLEncoding.queryString,headers: nil, interceptor: nil)
            .validate(statusCode: 200..<600)
            .responseJSON { response in
                switch response.result
                {
                    
                case .failure(let error):
                    switch error {
                       case .sessionTaskFailed(let urlError as URLError) where urlError.code == .timedOut:
                           print("Request timeout!")
                       default:
                           print("Other error!")
                       }//failure
                    completion(error,false)
                    print(error)
                    
                case .success(let value):           //SUCCESS
                    //print(value)
                    let json = JSON(value)
                    print("json:\(json)")
                    if let uid = json ["id"].int64
                    {
                        Helper.saveuid(uid: Int(uid))
                        if let UserId = Helper.getid()
                        {
                            print("user id :\(UserId)")
                            // Helper.restartApp()
                        }
                    }
                    let usermail = json ["email"].string
                    Helper.saveuseremail(useremail: usermail ?? "")
                    if let mail = Helper.getuseremail()
                    {
                        print("user email is: \(mail)")
                    }
                    
                 let  api_display_name = json["displayName"].string ?? ""
                    Helper.save_display_name(display_name: api_display_name)
                    if Helper.get_display_name() != nil{
                         print("Display Name is: \(api_display_name)")
                    }
                    completion(nil,true)
                }
        }
    }
    
    
    // forgetpassword
    class func forgetpassword(uemail:String,uname:String,completion: @escaping(_ error:Error?,_ success:Bool)->Void){
        
        let url = URLS.forgetpassword
        let params: Parameters = ["uemail": uemail,"uname":uname]
        
        AF.request(url, method: .post, parameters: params, encoding: URLEncoding.queryString,headers: nil, interceptor: nil)
            .validate(statusCode: 200..<300)
            .responseJSON { response in
                switch response.result {
                case  .failure(let error):
                    completion(error,false)
                    print(error)
                    
                case .success(let value):
                    print(value)
                    print("pasword sent to your email")
                    completion(nil,true)
                }
        }
    }
    
//    // GetUser Teckets
//    class func getusertickets(uid:Int64,completion: @escaping(_ error:Error?,_ success:Bool)->Void){
//        
//        let url = URLS.getusertickets
//        let params: Parameters = ["uid":uid]
//        
//        AF.request(url, method: .get, parameters: params, encoding: URLEncoding.queryString,headers: nil, interceptor: nil)
//            .validate(statusCode: 200..<500)
//            .responseJSON { response in
//                switch response.result {
//                case  .failure(let error):
//                    completion(error,false)
//                    print(error)
//                    
//                case .success(let value):
//                    let json = JSON(value)
//                    print("json:\(json)")
//                    if let alltickets = json["[tickets]"].string
//                    {
//                        // go to tickets screen
//                        
//                        print("All Tickets:\(alltickets)")
//                    }
//                    
//                    completion(nil,true)
//                }
//        }
//    }
    
    // Change password
    class func Changepassword(userid:Int64,newpassword:String,completion: @escaping(_ error:Error?,_ success:Bool)->Void){
        
        let url = URLS.changepassword
        let params: Parameters = ["uid":userid,"newpassword":newpassword]
        
        AF.request(url, method: .post, parameters: params, encoding: URLEncoding.queryString,headers: nil, interceptor: nil)
            .validate(statusCode: 200..<500)
            .responseJSON { response in
                switch response.result {
                case  .failure(let error):
                    completion(error,false)
                    print(error)
                    
                case .success(let value):
                    let json = JSON(value)
                    print("json:\(json)")
                    
                }
                
                completion(nil,true)
        }
    }
    
    // Edit Pofile
    class func Editprofile(phone:String,fname:String,email:String,completion: @escaping(_ error:Error?,_ success:Bool)->Void){
        
        let url = URLS.edituser
        let params: Parameters = ["displayname":fname,"username":email,"phone":phone]
        
        AF.request(url, method: .post, parameters: params, encoding: URLEncoding.queryString,headers: nil, interceptor: nil)
            .validate(statusCode: 200..<500)
            .responseJSON { response in
                switch response.result {
                case  .failure(let error):
                    completion(error,false)
                    print(error)
                    
                case .success(let value):
                    let json = JSON(value)
                    print("json:\(json)")
                    
                }
                
                completion(nil,true)
        }
    }
    
    
    //
    //    class func Editprofile(phone:String,fname:String,email:String,completion: @escaping(_ error:Error?,_ success:Bool)->Void){
    //
    //             let url = URLS.edituser
    //         let params: Parameters = ["displayname":fname,"username":email,"phone":phone]
    //
    //             AF.request(url, method: .post, parameters: params, encoding: URLEncoding.queryString,headers: nil, interceptor: nil)
    //                .validate(statusCode: 200..<500)
    //                .responseJSON { response in
    //                    switch response.result {
    //                       case  .failure(let error):
    //                           completion(error,false)
    //                            print(error)
    //
    //                       case .success(let value):
    //                         let json = JSON(value)
    //                         print("json:\(json)")
    //
    //                         }
    //
    //                        completion(nil,true)
    //                 }
    //             }
    
}
    
    
    
    
    
    
    





