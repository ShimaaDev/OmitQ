//
//  BranchService.swift
//  Omit_User
//
//  Created by shimaa alwaney on 8/5/20.
//  Copyright © 2020 Shimaa Alwaney. All rights reserved.
//

import Foundation
class BranchServices: NSObject{
     public var id : Int?   // Service ID
     public var englishName : String?
     public var timeElapsed : Double?
     public var cost : Double?
  
    public var branchID : Int?
    public var arabicName : String?
    
//    
//     var IsExpandable: Bool = false
//     var HeaderName: String?
//    

//    public class func modelsFromDictionaryArray(array:NSArray) -> [BranchServices]
//       {
//           var models:[BranchServices] = []
//           for item in array
//           {
//               models.append(BranchServices(dictionary: item as! NSDictionary)!)
//           }
//           return models
//       }
//
//
//
//        required public init?(dictionary: NSDictionary) {
//
//            id = dictionary["id"] as? Int
//            branchID = dictionary["branchID"] as? Int
//            arabicName = dictionary["arabicName"] as? String
//            englishName = dictionary["englishName"] as? String
//            timeElapsed = dictionary["timeElapsed"] as? Int
//            cost = dictionary["cost"] as? Double
//        }
//
//
//    /**
//        Returns the dictionary representation for the current instance.
//
//        - returns: NSDictionary.
//    */
//        public func dictionaryRepresentation() -> NSDictionary {
//
//            let dictionary = NSMutableDictionary()
//
//            dictionary.setValue(self.id, forKey: "id")
//            dictionary.setValue(self.branchID, forKey: "branchID")
//            dictionary.setValue(self.arabicName, forKey: "arabicName")
//            dictionary.setValue(self.englishName, forKey: "englishName")
//            dictionary.setValue(self.timeElapsed, forKey: "timeElapsed")
//            dictionary.setValue(self.cost, forKey: "cost")
//
//            return dictionary
//        }
 
}
