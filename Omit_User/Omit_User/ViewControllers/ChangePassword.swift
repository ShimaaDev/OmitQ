//
//  ChangePassword.swift
//  Omit_User
//
//  Created by shimaa alwaney on 6/2/20.
//  Copyright © 2020 Shimaa Alwaney. All rights reserved.
//

import UIKit

class ChangePassword: UIViewController {

    @IBOutlet weak var npasswdtf: UITextField!
    @IBOutlet weak var confpasswdtf: UITextField!
    @IBOutlet weak var savebtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
           //Looks for single or multiple taps.
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))

           //Uncomment the line below if you want the tap not not interfere and cancel other interactions.
           //tap.cancelsTouchesInView = false

           view.addGestureRecognizer(tap)
       }

       //Calls this function when the tap is recognized.
       @objc func dismissKeyboard() {
           //Causes the view (or one of its embedded text fields) to resign the first responder status.
           view.endEditing(true)
       }
    
    
    @IBAction func savebtn(_ sender: UIButton) {
        guard let newpasswd = npasswdtf.text,!newpasswd.isEmpty else{return}
        guard let confpasswd = confpasswdtf.text,!confpasswd.isEmpty else{return}
        guard let userid = Helper.getid() else{return}
        Api.Changepassword(userid: userid, newpassword: newpasswd) { (error:Error?, success:Bool) in
            if success{
                 // Validation.AlertValidation(view: self, msg: "Password Saved Successfully", title: "Omit")

                 self.navigationController?.popViewController(animated: true)

            }else{
                 Validation.AlertValidation(view: self, msg: "Sorry Some Thing Went Wrong Please Try Again", title: "Omit")
                
            }
           
        }
        
    }
    
//    @IBAction func Backbtn(_ sender: UIBarButtonItem) {
//       
//            self.navigationController?.popViewController(animated: true)
//    }
  
}
