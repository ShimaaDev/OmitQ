//
//  menu.swift
//  Omit_User
//
//  Created by shimaa alwaney on 5/9/20.
//  Copyright © 2020 Shimaa Alwaney. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import FBSDKCoreKit
class menu: UIViewController {
    
    @IBOutlet weak var pay: UIButton!
    @IBOutlet weak var res: UIButton!
    @IBOutlet weak var terms: UIButton!
    @IBOutlet weak var lang: UIButton!
    @IBOutlet weak var help: UIButton!
    
    @IBOutlet weak var bttn2: UIButton!
    @IBOutlet weak var bttn1: UIButton!
    @IBOutlet weak var about: UIButton!
    @IBOutlet weak var priv: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pay.layer.cornerRadius = 6 ;
        res.layer.cornerRadius = 6 ;
        terms.layer.cornerRadius = 6 ;
        priv.layer.cornerRadius = 6 ;
        about.layer.cornerRadius = 6 ;
        lang.layer.cornerRadius = 6 ;
        help.layer.cornerRadius = 6 ;
       bttn1 .layer.cornerRadius = 6 ;
       bttn2 .layer.cornerRadius = 6 ;
    }
    
    @IBAction func backhomebtn(_ sender: UIBarButtonItem) {
        
       let stbor = UIStoryboard(name: "Main" ,bundle:nil).instantiateViewController(withIdentifier: "home")
       self.present(stbor, animated: true, completion: nil)
    }
    
    
    @IBAction func utecketsbtn(_ sender: UIButton) {
//        
//        guard let uid = Helper.getid() else{return}
//        Api.getusertickets(uid: uid) { (error:Error?, success:Bool) in
//            if success{
//                print("succeded")
//
////                let stbor = UIStoryboard(name: "Main" ,bundle:nil).instantiateViewController(withIdentifier: "uteckets")
////                      self.present(stbor, animated: true, completion: nil)
////
////                let vc = UIStoryboard?.instantiateViewController(identifier: "utickets") as? Tickets se lf.navigationController?.pushViewController(vc!, animated: true)
//        let ut = self.storyboard? .instantiateViewController(withIdentifier: "alltickets")as! Tickets
//        self.navigationController?.pushViewController(ut,animated: true)
//           }
//        }
    }
    
    
    @IBAction func logout(_ sender: UIButton) {
        print("logout buttontaped")
          LoginManager().logOut()
     //   LoginManager.logIn()
        UserDefaults.standard.removeObject(forKey: "id")
    UserDefaults.standard.removeObject(forKey: "token")
//        let vc = UIStoryboard.instantiateViewController(withIdentifier: "login")
//        let AppDelegate = UIApplication.shared.keyWindow
//       window.rootViewController = vc
            guard let window = UIApplication.shared.keyWindow else{return}
                  let sb = UIStoryboard(name: "Main", bundle: nil)
                  var vc:UIViewController
              vc = sb.instantiateViewController(withIdentifier: "login")
             window.rootViewController = vc
        UIView.transition(with: window, duration: 0.7, options: .transitionFlipFromLeft, animations: nil, completion: nil)
        
    }
}
