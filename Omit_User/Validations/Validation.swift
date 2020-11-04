//
//  Validation.swift
//  Omit_User
//
//  Created by shimaa alwaney on 6/4/20.
//  Copyright © 2020 Shimaa Alwaney. All rights reserved.
//

import UIKit

class Validation: NSObject {

   class func isValidEmail(username : String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        let result = emailTest.evaluate(with: username)
                        return result
    }
    
   class func isValidPassword(password: String) -> Bool {
        let passwordRegEx = "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{8,}$"
        let passwordTest = NSPredicate(format:"SELF MATCHES %@", passwordRegEx)
        let result = passwordTest.evaluate(with: password)
                                        return result
    }
    class func isValidPhone(phone:String)-> Bool{
        let phonenumRegEx = "^[0-9]{11}$"
        let phoneTest = NSPredicate(format:"SELF MATCHES %@", phonenumRegEx)
        let result = phoneTest.evaluate(with: phone)
                    return result
    }
  //  <input type="text" name="phone" pattern="01[0-9]{9}" title="Egypt Phone numbers">
                                // alert
    
    class func AlertValidation(view: UIViewController, msg: String, title: String ){
                    // create the alert
        let alert = UIAlertController(title: title, message: msg, preferredStyle: UIAlertController.Style.alert)

                  //alert.view.tintColor = UIColor.red

                      // add an action (button)
                      alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        
                      // show the alert
                     view.present(alert, animated: true, completion: nil)
    }

}
