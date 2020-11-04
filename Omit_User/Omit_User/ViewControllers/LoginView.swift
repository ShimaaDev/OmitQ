//
//  Login.swift
//  Omit_User
//
//  Created by shimaa alwaney on 5/9/20.
//  Copyright © 2020 Shimaa Alwaney. All rights reserved.
//

import UIKit
//import Alamofire
import SwiftyJSON
import FBSDKLoginKit
import FBSDKCoreKit
class LoginView: UIViewController {
    //All outlets.
    
    @IBOutlet weak var Spinner: UIActivityIndicatorView!
    @IBOutlet weak var omitimg: UIImageView!
    @IBOutlet weak var facebttn: UIButton!
    @IBOutlet weak var goglbttn: UIButton!
    @IBOutlet weak var creatbttn: UIButton!
    @IBOutlet weak var loginbttn: UIButton!
    @IBOutlet weak var orlabel: UILabel!
    @IBOutlet weak var createlabel: UILabel!
    @IBOutlet weak var emailtf: UITextField!
    @IBOutlet weak var passwordtf: UITextField!
    @IBOutlet weak var faceimg: UIImageView!
    @IBOutlet weak var googleimg: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // HIDDING THE SPINNER//
        Spinner.hidesWhenStopped = true
        // buttns corrners
        facebttn.layer.cornerRadius = 11
        goglbttn.layer.cornerRadius = 11
        creatbttn.layer.cornerRadius = 8
        loginbttn.layer.cornerRadius = 8
        creatbttn.layer.cornerRadius = 8
        
        // tevtfields corrners
        emailtf.layer.cornerRadius = 8
        passwordtf.layer.cornerRadius = 8
        
        let loginButton = FBLoginButton()
        loginButton.permissions = ["public_profile", "email"]
        loginButton.layer.cornerRadius = 8
        loginButton.frame = CGRect(x: 71, y: 118, width: 235, height: 40)
        loginButton.backgroundColor =  UIColor (red: 59, green: 89, blue: 152, alpha: 1)
        view.addSubview(loginButton)
        NotificationCenter.default.addObserver(forName: .AccessTokenDidChange, object: nil, queue: OperationQueue.main) { (notification) in
            
            print("FB Access Token: \(String(describing: AccessToken.current?.tokenString))")
            let fbtoken = "AccessToken.current?.tokenString"
            Helper.savetoken(token: fbtoken )
            let stb = UIStoryboard(name: "Main" ,bundle:nil).instantiateViewController(withIdentifier: "home")
            self.present(stb, animated: true, completion: nil)
            stb.modalPresentationStyle = .overFullScreen
            stb.modalTransitionStyle = .flipHorizontal
        }
    }
    //}
    // Action Buttns
    @IBAction func faceaction(_ sender: UIButton) {
        //        let loginButton = FBLoginButton()
        //        loginButton.permissions = ["public_profile", "email"]
        //        loginButton.center = view.center
        //        view.addSubview(loginButton)
        
        //        if let token = AccessToken.current,
        //            !token.isExpired {
        //
        ////          //   User is logged in, do work such as go to next view controller.
        ////            let stb = UIStoryboard(name: "Main" ,bundle:nil).instantiateViewController(withIdentifier: "home")
        ////                               self.present(stb, animated: true, completion: nil)
        //
        //        }
        
    }
    
    
    @IBAction func googleaction(_ sender: UIButton) {
    }
    
    
    @IBAction func createaccountaction(_ sender: UIButton) {
        //        let board = UIStoryboard(name: "Main" ,bundle:nil).instantiateViewController(withIdentifier: "signup")
        //                  self.present(board, animated: true, completion: nil)
    }
    
    
    @IBAction func termsaction(_ sender: UIButton) {
    }
    
    
    @IBAction func loginaction(_ sender: UIButton) {
        
        guard let username = emailtf.text, !username.isEmpty else {
            // create the alert
            
            Validation.AlertValidation(view: self, msg: "Please Enter Email", title: "Omit")
            return}
        
        if Validation.isValidEmail(username: username) == false{
            // create the alert
            Validation.AlertValidation(view: self, msg:"Should contain @ and .com" , title: "Inalid")
        }
        
        guard let password = passwordtf.text?.trimed, !password.isEmpty else {
            // create the alert
            //            Validation.AlertValidation(view: self, msg: "Please Enter Password", title: "Inalid")
            return}
        if (password.count) < 8 {
            // create the alert
            Validation.AlertValidation(view: self, msg:"Password must be greater than 8 characters" , title:"Inalid")
            
        } else{
            //STARTING THE SPINNER//
            Spinner.startAnimating()
            Api.login(username: username, password: password) {(error:Error?,success: Bool) in
                // STOPING SPINNER
                self.Spinner.stopAnimating()
                if success{
                    guard let UserId = Helper.getid() else{return}
                     print("UserId: \(UserId)")
                    if(Helper.getid() == 0) {
                        Validation.AlertValidation(view:self, msg:"invalid mail or password", title:"omit")
                        
                    }else{
                        print("succeded")
                        guard let window = UIApplication.shared.keyWindow else{return}
                        let sb = UIStoryboard(name: "Main", bundle: nil)
                        var vc:UIViewController
                        vc = sb.instantiateViewController(withIdentifier: "home")
                        window.rootViewController = vc
                        UIView.transition(with: window, duration: 0.7, options: .transitionCurlUp, animations: nil, completion: nil)
                    }
                }
            }
        }
    }
    
    @IBAction func forgetpasswdaction(_ sender: UIButton) {
        guard let uname = emailtf.text, !uname.isEmpty else {return}
        guard let uemail =  emailtf.text, !uemail.isEmpty else {return}
        
        Api.forgetpassword(uemail: uemail, uname: uname) { (error:Error?,success:Bool) in
            if success{
                // create the alert
                            Validation.AlertValidation(view: self, msg: "New Password sent successfully to your Email", title: "Omit")
                
                            }else{
                                Validation.AlertValidation(view: self, msg: "Sorry Some Thing Went Wrong Please Try Again", title: "Omit")
            }
        }
        
    }
}








