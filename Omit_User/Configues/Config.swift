//
//  Config.swift
//  Omit_User
//
//  Created by shimaa alwaney on 5/30/20.
//  Copyright © 2020 Shimaa Alwaney. All rights reserved.
//
import Foundation

struct URLS {
    //Main
//      static let main = "http://omite.somee.com/api/"
    static let main = "http://hammad1995-001-site1.itempurl.com/API/"
    //    // post {username}
    //    static let isexist = main +  "/users/Isexist"
    
    // post {username, password}
    static let signin = main + "users/signin"
    
    // post {username, password, displayname, phone}
    static let signup = main + "users/SignUp"
    
    // post {uemail, uid}
    static let sendcode = main + "users/SendVerificationCode"
    
    // post {uemail, uname}
    static let verifyemail = main + "users/verifyuseremail"
    
    // post {uemail, uid,code}
    static let forgetpassword = main + "users/forgetpassword"
    
    // get {uid}
//    static let getusertickets = main + "users/getusertickets"
    
    // post {newpassword, uid}
    static let changepassword = main + "users/changepassword"
    
    // post {username,phone,profilepic, displayname}
    static let edituser = main + "users/edituser"
    
    // GET {}
    static let ServicesAround = main + "/Branches/getallbranches"
    
    // GET {}
    static let Catigories = main + "categories/getAllcategories"
    
     // GET {id}
   static let getcategorysp = main + "ServiceProviders/getcategorysp"
    
    // GET {id}
    static let getSpBranches = main + "ServiceProviders/getspbranches"
    
    static let GetBrancheData = main + "branches/getbranch"
    
    static let getserviceq = main + "tickets/getserviceq"
    
    static let get_all_tickets = main + "tickets/GetAllPendingTickets"
    
    static let GetTicketById = main + "tickets/geticket"
    
    static let TakeQ = main + "tickets/takeaturn"
    
    static let CancelTicket = main + "tickets/cancelticket"
    
}
