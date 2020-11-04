//
//  Payment.swift
//  Omit_User
//
//  Created by shimaa alwaney on 5/9/20.
//  Copyright © 2020 Shimaa Alwaney. All rights reserved.
//

import UIKit

class Payment: UIViewController {
    
    @IBOutlet weak var card1: UIView!
    
    @IBOutlet weak var card2: UIView!
    @IBOutlet weak var addbttn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        card1.layer.cornerRadius = 15 ;
        
        card2.layer.cornerRadius = 15 ;
        
        addbttn.layer.cornerRadius = 8 ;

    }
    


}
