//
//  SignUp.swift
//  Omit_User
//
//  Created by shimaa alwaney on 5/9/20.
//  Copyright © 2020 Shimaa Alwaney. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
class SignUp: UIViewController {
    
    @IBOutlet weak var Spinner: UIActivityIndicatorView!
    @IBOutlet weak var signupbttn: UIButton!
    @IBOutlet weak var omitimg: UIImageView!
    @IBOutlet weak var fnametf: UITextField!
    @IBOutlet weak var mobiletf: UITextField!
    @IBOutlet weak var emailtf: UITextField!
    @IBOutlet weak var passwordtf: UITextField!
    @IBOutlet weak var confirmpasstf: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Looks for single or multiple taps.
            let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))

               //Uncomment the line below if you want the tap not not interfere and cancel other interactions.
               tap.cancelsTouchesInView = false

               view.addGestureRecognizer(tap)
        
        // HIDDING THE SPINNER//
        Spinner.hidesWhenStopped = true
        signupbttn.layer.cornerRadius = 8
        fnametf .layer.cornerRadius = 8
        mobiletf.layer.cornerRadius = 8
        emailtf.layer.cornerRadius = 8
        passwordtf.layer.cornerRadius = 8
        confirmpasstf.layer.cornerRadius = 8
        
    }
    //Calls this function when the tap is recognized.
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }

    
    @IBAction func signupaction(_ sender: UIButton) {
        
        guard let displayname = fnametf.text?.trimed, !displayname.isEmpty else{
            // create the alert
            Validation.AlertValidation(view: self, msg: "Please Enter Username", title: "Invalid")
            return}
        if (displayname.count) < 8{
            Validation.AlertValidation(view: self, msg: "Username must be greater than 5 characters", title: "Invalid")
        }
        
        
        guard let phone = mobiletf.text?.trimed, !phone.isEmpty else{
            // create the alert
            Validation.AlertValidation(view: self, msg: "Please Enter Phone Number", title: "Invalid")
            return}
        
        
        if Validation.isValidPhone(phone: phone) == false{
            // create the alert
            Validation.AlertValidation(view: self, msg:"Should Contain 11 Number" , title: "Invalid Phone Number")
        }
        // EMAIl
        guard let username = emailtf.text?.trimed, !username.isEmpty else{
            // create the alert
            Validation.AlertValidation(view: self, msg: "Please Enter Email", title:"Invalid")
            return}
        
        if Validation.isValidEmail(username: username) == false{
            // create the alert
            Validation.AlertValidation(view: self, msg:"Should contain @ and .com" , title: "Inalid Email")
        }
        //        var Email = username
        // PASSWORD
        guard let password = passwordtf.text?.trimed, !password.isEmpty else{
            // create the alert
            Validation.AlertValidation(view: self, msg: "Please Enter Password", title: "Invalid")
            return}
//        if (password.count) < 8 {
//
//            Validation.AlertValidation(view: self, msg:"Password must be greater than 8 characters" , title:"Inalid Password")
//        }
        
        guard let confpasswd = confirmpasstf.text?.trimed,!confpasswd.isEmpty else{
            // create the alert
            Validation.AlertValidation(view: self, msg: "Please Enter Confirmpassword", title: "Invalid")
            return}
       
        if password != confpasswd{
            
            // create the alert
            Validation.AlertValidation(view: self, msg: "Password And Confirm password Not Matching", title: "Invalid")
        }else{
            
            //   STARTING THE SPINNER//
            self.Spinner.startAnimating()
            // Signup API Method..
            Api.signup(displayname: displayname, username: username, phone: phone, password: password) { (error:Error?, success:Bool) in
                // STOPING SPINNER
                // self.Spinner.stopAnimating()
                if success {
                    let Email = Helper.getusername()
                    if Email == nil{
                        Validation.AlertValidation(view: self, msg: "UserName Already Exist, Login Or Enter another email", title: "Omit")
                        print("This Email Is Exist")
                    }else{
                        print(" verification Link sent successfully to your Email")
                        
                        let stb = UIStoryboard(name: "Main" ,bundle:nil).instantiateViewController(withIdentifier: "login")
                        self.present(stb, animated: true, completion: nil)
                        stb.modalPresentationStyle = .overFullScreen
                        stb.modalTransitionStyle = .flipHorizontal
                    }
                    
                }
                
            }
            
        }
    }
}



