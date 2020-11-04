//
//  Helper.swift
//  Omit_User
//
//  Created by shimaa alwaney on 5/30/20.
////  Copyright © 2020 Shimaa Alwaney. All rights reserved.
////
//
import UIKit
import CoreLocation
class Helper: NSObject {
    var shimaa:String?
  static var distanceInMeters = 0
    /////////////////////////////////////////////////////////////////////////------- USERDEFAULTS -------///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    
//    class func restartApp(){
//        guard let window = UIApplication.shared.keyWindow else{return}
//        let sb = UIStoryboard(name: "Main", bundle: nil)
//        var vc:UIViewController
//
//        if (getid() == nil || getid() == 0) {
//            //go to Auth screen
//              // vc = sb.instantiateInitialViewController()!
//                print("Helper Invalid mail or password")
//          //  Validation.AlertValidation(view:window.rootViewController!, msg:"invalid mail or password", title:"omit")
//
//
//
//        }else{
//            //goto home screen
//            vc = sb.instantiateViewController(withIdentifier: "home")
//        }
//      // vc = sb.instantiateInitialViewController()!
//       window.rootViewController = vc
//        UIView.transition(with: window, duration: 0.7, options: .transitionCurlUp, animations: nil, completion: nil)
//
//    }
    
    
    // Saving username in userdefaults
    class func saveusername(uname:String)
    {
        let name = UserDefaults.standard
        name.setValue(uname, forKey: "userName")
        name.synchronize()
    }
    
    // check if username  saved in userdefaults
    class func getusername() -> String?
    {
        let name = UserDefaults.standard
        return name.object(forKey: "userName") as? String
        
    }
    
    // saving useremail saved in userdefaults
    class func saveuseremail(useremail:String)
    {
        let mail = UserDefaults.standard
        mail.setValue(useremail, forKey: "email")
        mail.synchronize()
    }
    
    // check if useremail saved in userdefaults
    class func getuseremail() -> String?
    {
        let mail = UserDefaults.standard
        return mail.object(forKey: "email") as? String
    }
    
    // saving display_name saved in userdefaults
     class func save_display_name(display_name:String)
     {
         let mail = UserDefaults.standard
         mail.setValue(display_name, forKey: "displayName")
         mail.synchronize()
     }
     
     // check if display_name saved in userdefaults
     class func get_display_name() -> String?
     {
         let display_name = UserDefaults.standard
         return display_name.object(forKey: "displayName") as? String
     }
    
    // saving facebook token saved in userdefaults
    class func savetoken(token:String?)
    {
        let fbtoken = UserDefaults.standard
        fbtoken.setValue(token, forKey: "token")
        fbtoken.synchronize()
    }
    
    // check if  facebook token saved in userdefaults
    class func gettoken() -> String?
    {
        let token = UserDefaults.standard
        return token.object(forKey: "token") as? String
    }
    
    // Saving ID in userdefaults
     class func saveuid(uid:Int)
     {
         let Uid = UserDefaults.standard
         Uid.setValue(uid, forKey: "uid")
         Uid.synchronize()
         //        restartApp()
     }
     
     // check if uid  saved in userdefaults
     class func getid() -> Int64?
     {
         let GUid = UserDefaults.standard
         return GUid.object(forKey: "uid") as? Int64
     }
    
    // Saving ID in userdefaults
      class func SaveCatgId(Catgid:Int)
      {
          let Cid = UserDefaults.standard
          Cid.setValue(Catgid, forKey: "Cid")
          Cid.synchronize()
          //        restartApp()
      }
      
      // check if uid  saved in userdefaults
      class func GetCatgId() -> Int?
      {
          let GCid = UserDefaults.standard
          return GCid.object(forKey: "Cid") as? Int
      }
    
    // Saving ID in userdefaults
       class func SaveSPId(spid:Int)
       {
           let Spid = UserDefaults.standard
           Spid.setValue(spid, forKey: "Spid")
          Spid.synchronize()
           //        restartApp()
       }
       
       // check if Sp id  saved in userdefaults
       class func GetspId() -> Int?
       {
           let GSpid = UserDefaults.standard
           return GSpid.object(forKey: "Spid") as? Int
       }
       // Saving Branch ID in userdefaults
    
        class func SaveBrnchId(Branchid:Int)
           {
               let Bid = UserDefaults.standard
               Bid.setValue(Branchid, forKey: "Bid")
               Bid.synchronize()
               //        restartApp()
           }
           
           // check if Branch id  saved in userdefaults
           class func GetBrnchId() -> Int?
           {
               let GBid = UserDefaults.standard
               return GBid.object(forKey: "Bid") as? Int
           }
    
        // Saving Service Id in userdefaults
          class func SaveServiceId(ServiceId:Int)
             {
                 let Sid = UserDefaults.standard
                 Sid.setValue(ServiceId, forKey: "Servid")
                 Sid.synchronize()
                 //        restartApp()
             }
             
             // check if Service Id  saved in userdefaults
             class func GetServiceId() -> Int?
             {
                 let GSid = UserDefaults.standard
                 return GSid.object(forKey: "Servid") as? Int
             }
    
    
    // Saving Ticket ID in userdefaults
    class func SaveTicketId(TicketId:Int)
    {
        let Tid = UserDefaults.standard
        Tid.setValue(TicketId, forKey: "TicketID")
       Tid.synchronize()
        //        restartApp()
    }
    
    // check if Sp id  saved in userdefaults
    class func GetTicketId() -> Int?
    {
        let GTid = UserDefaults.standard
        return GTid.object(forKey: "TicketID") as? Int
    }
    
//        // Saving Service Cost in userdefaults
//                class func SaveServiceCost(ServiceCost:Double)
//                   {
//                       let Cost = UserDefaults.standard
//                       Cost.setValue(ServiceCost, forKey: "cost")
//                       Cost.synchronize()
//                       //        restartApp()
//                   }
//
//                   // check if Service Cost  saved in userdefaults
//                   class func GetServiceCost() -> Double?
//                   {
//                       let ServiceCost = UserDefaults.standard
//                       return ServiceCost.object(forKey: "cost") as? Double
//                   }
//
//        // Saving Service Time in userdefaults
//                class func SaveServiceTime(ServiceTime:Double)
//                   {
//                       let Time = UserDefaults.standard
//                       Time.setValue(ServiceTime, forKey: "timeElapsed")
//                       Time.synchronize()
//                       //        restartApp()
//                   }
//
//                   // check if Service Time  saved in userdefaults
//                   class func GetServiceTime() -> Double?
//                   {
//                       let Servicetime = UserDefaults.standard
//                       return Servicetime.object(forKey: "timeElapsed") as? Double
//                   }
    
    
    
//  //save Selected Service Name in userdefaults..
//                  class func SaveSelectedServiceName(ServiceName:String)
//                     {
//                         let Time = UserDefaults.standard
//                         Time.setValue(ServiceName, forKey: "englishname")
//                         Time.synchronize()
//                         //        restartApp()
//                     }
//
//                     // check if Selected Service Name  saved in userdefaults..
//                     class func GetSelectedServiceName() -> String?
//                     {
//                         let ServiceName = UserDefaults.standard
//                         return ServiceName.object(forKey: "englishname") as? String
//                     }
      /// spliting func:
      class func split_string(string_to_split: String) -> String? {
        let str = string_to_split.components(separatedBy: "T")
        let first_str = str[0] //First
        let last_str = str[1] //Last
        return first_str
    }
    
    
    
     //Convert byte Array To UImage..
    class func convertImage(logo: String) -> UIImage? {
           let dataDecoded : Data = Data(base64Encoded: logo, options: .ignoreUnknownCharacters)!
           let FinalImage = UIImage(data: dataDecoded)
           return FinalImage
     }
    //calculateDistance Beytween Tow Points..
    class func calculateDistance(mobileLocationX:Double,mobileLocationY:Double,DestinationX:Double,
    DestinationY:Double) -> Double {
 
             let coordinate₀ = CLLocation(latitude: mobileLocationX, longitude: mobileLocationY)
             let coordinate₁ = CLLocation(latitude: DestinationX, longitude: DestinationY)
     
            distanceInMeters = Int(coordinate₀.distance(from: coordinate₁)) // / 1000 to Be In KM..
             print("distanceInMeters:\(distanceInMeters)")

                return Double(distanceInMeters)
         }
    
    // Convert Hexa Color To UIColor..
    class func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }

        if ((cString.count) != 6) {
            return UIColor.gray
        }

        var rgbValue:UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)

        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
}

