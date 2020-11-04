////
////  VerifyEmail.swift
////  Omit_User
////
////  Created by shimaa alwaney on 5/31/20.
////  Copyright © 2020 Shimaa Alwaney. All rights reserved.
////
//
//import UIKit
//
//class VerifyEmail: UIViewController {
//
//    @IBOutlet weak var vcodetf: UITextField!
//    @IBOutlet weak var omitlabel: UIImageView!
//
//    @IBOutlet weak var sendcodebtn: UIButton!
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        vcodetf.layer.cornerRadius = 8
//        sendcodebtn.layer.cornerRadius = 8
//    }
//
//    @IBAction func sendcode(_ sender: UIButton) {
//
//        guard let code = vcodetf.text,!code.isEmpty else{
//            // create the alert
//            Validation.AlertValidation(view: self, msg: "Please Enter Code", title: "Omit")
//            return
//        }
//        if (code.count) != 6{
//
//                       Validation.AlertValidation(view: self, msg:"InvalidCode" , title:"Inalid")
//        }else{
//        guard let uemail = Helper.getusername()
//            else { return}
//              print("user email \(uemail)")// from userdefaults
//        guard let uid = Helper.getid() else { return}          // from userdefaults
//        Api.verifyuemail(uemail: uemail, uid: uid, code: code) { (error:Error?,success:Bool) in
//            if success{
//
//                print (" Signup succed")
////                                     let sb = UIStoryboard(name: "Main", bundle: nil)
////                                     var vc:UIViewController
////                                     vc = sb.instantiateViewController(withIdentifier: "login")
//
//          let stb = UIStoryboard(name: "Main" ,bundle:nil).instantiateViewController(withIdentifier: "login")
//          self.present(stb, animated: true, completion: nil)
//          stb.modalPresentationStyle = .overFullScreen
//          stb.modalTransitionStyle = .flipHorizontal
//
//
//            }else{
//
//                Validation.AlertValidation(view: self, msg:"InvalidCode" , title:"Inalid")
//
//            }
//    }
//}
//}
//}

