//
//  EditProfile.swift
//  Omit_User
//
//  Created by shimaa alwaney on 5/9/20.
//  Copyright © 2020 Shimaa Alwaney. All rights reserved.
//

import UIKit

class EditProfile: UIViewController {
    
    @IBOutlet weak var fnametf: UITextField!
    @IBOutlet weak var mobtf: UITextField!
    @IBOutlet weak var emailtf: UITextField!
    @IBOutlet weak var savebttn: UIButton!
    @IBOutlet weak var MyBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
       MyBtn.layer.cornerRadius = 8
        fnametf.layer.cornerRadius = 8
        mobtf.layer.cornerRadius = 8
        emailtf.layer.cornerRadius = 8
       // savebttn.layer.cornerRadius = 8
    }
    

    @IBAction func savebtn(_ sender: UIButton) {
         guard let phone = mobtf.text,!phone.isEmpty else{return}
         guard let fname = fnametf.text,!fname.isEmpty else{return}
         guard let email = emailtf.text,!email.isEmpty else{return}
        Api.Editprofile(phone: phone, fname: fname, email: email) { (error:Error?, success:Bool) in
            if success{
                 self.navigationController?.popViewController(animated: true)
            }
            
        }
    }
   
//    
//    @IBAction func Bacsktomenu(_ sender: UIBarButtonItem) {
//       // self.navigationController?.popViewController(animated: true)
//        let ut = self.storyboard? .instantiateViewController(withIdentifier: "resv")as! Reservation1
//        self.navigationController?.pushViewController(ut,animated: true)
//            }
    
}
