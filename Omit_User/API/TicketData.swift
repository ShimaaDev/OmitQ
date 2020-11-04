//
//  TicketData.swift
//  Omit_User
//
//  Created by shimaa alwaney on 8/9/20.
//  Copyright © 2020 Shimaa Alwaney. All rights reserved.
//

import Foundation
class TicketData: NSObject{
    
    public var ticketID : Int?
    public var userID : Int?
    public var branchID : Int?
    public var serviceID : Int?
    public var ticketNo : String?
    public var ticketCost : Double?
    public var ticketTime : String?  // BookingTime That I sent As a Parameter after i calculated it..
    public var isApproved : Bool?
    public var isCanceled : Bool?
    
}

