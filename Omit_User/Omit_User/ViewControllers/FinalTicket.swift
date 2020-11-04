//
//  FinalTecket.swift
//  Omit_User
//
//  Created by shimaa alwaney on 5/6/20.
//  Copyright © 2020 Shimaa Alwaney. All rights reserved.
//

import UIKit

class FinalTicket: UIViewController {
    var ticket_booking_time = String()
    var currentCost = Double()
    var TNum = String()
    var SelctedServName = String()
    var BLogo =  UIImage()
    var ServProvName = String()
  //  var ServCost = String()
    var NumPersons = Int()
    var WTime = String()
    
    @IBOutlet weak var BranchLabl: UILabel!
    @IBOutlet weak var BranchImg: UIImageView!
    @IBOutlet weak var BrachName: UILabel!
    @IBOutlet weak var myview: UIView!
       //Ticket..
    @IBOutlet weak var SpName: UILabel!
    @IBOutlet weak var TicketBranchName: UILabel!
    @IBOutlet weak var TicketBranchLogo: UIImageView!
    @IBOutlet weak var mytecket: UIView!
    @IBOutlet weak var WaitingTimelabl: UILabel!
    @IBOutlet weak var NumberOfPersonsLabel: UILabel!
    @IBOutlet weak var TicketNumber: UILabel!
    @IBOutlet weak var BookingTime: UILabel!
    @IBOutlet weak var map: UIButton!
    @IBOutlet weak var CancelQueue: UIButton!
    @IBOutlet weak var ServiceName: UILabel!
    @IBOutlet weak var ServiceCost: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
//        guard let UserId = Helper.getid() else{return}
//            print("UserId: \(UserId)")
        BookingTime.text = ticket_booking_time
        TicketNumber.text = TNum
        SpName.text = ServProvName
        WaitingTimelabl.text = String (WTime)
        NumberOfPersonsLabel.text = String (NumPersons)
        TicketBranchLogo.image = BLogo
        BrachName.text = ApiSp.BrnchName
        BranchLabl.text = ApiSp.BrnchName
        BranchImg.image = BLogo
        TicketBranchName.text = ApiSp.BrnchName
         ServiceName.text = SelctedServName
//        ServiceName.text = Helper.GetSelectedServiceName()
        ServiceCost.text = String (ApiTickets.MyTicketCost) //String(currentCost)
        map.layer.cornerRadius = 8
        CancelQueue.layer.cornerRadius = 8
        myview.layer.cornerRadius = 33
        myview.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        mytecket.layer.cornerRadius = 15
        map.layer.cornerRadius = 7
    
    }
    
    @IBAction func CancelQueue(_ sender: Any) {
        //Cancel Ticket Api..
        ApiTickets.CancelTicket { (error:Error?,success: Bool)  in
            if success{
                print("T Canceled")
                 self.navigationController!.popToViewController(self.navigationController!.viewControllers[0] as UIViewController, animated: true)
            }
        }
           
    }
    
    
    @IBAction func GoogleMapDirections(_ sender: Any) {
    }
    
    
}
