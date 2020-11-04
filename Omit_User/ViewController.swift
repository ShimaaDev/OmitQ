//
//  ViewController.swift
//  Omit_User
//
//  Created by shimaa alwaney on 8/4/20.
//  Copyright © 2020 Shimaa Alwaney. All rights reserved.
//
//protocol HeaderDelegate{
//func CellHeader(Idx: Int)
//}
import UIKit
//  print(":\()")
class ViewController: UIViewController,VcprptocolDelegate{
    func selectedCell(row: Int) {
        print("Row: \(row)")
        
    }
    fileprivate var cellheight:CGFloat = 30
    var booking_time = String()
    var Hours = Int()
    var Minutes = Int()
    var ServCost = Double()
    var myWTime = String()
    var myspname = String()
    var ServName = String()
    var WaitingHours = 0.0
    //    var IsExpandable: Bool = false
    var BrnchLrgLogo = UIImage()
    var TimeBranches = [branchTimes]()
    var ServBranchs = [BranchServices]()
    @IBOutlet weak var WaitingTimelabl: UILabel!
    @IBOutlet weak var NumberOfPersons: UILabel!
    @IBOutlet weak var brnchlabl: UILabel!
    @IBOutlet weak var branchImg: UIImageView!
    @IBOutlet weak var MyView: UIView!
    @IBOutlet weak var TakQ: UIButton!
    @IBOutlet weak var TableView: UITableView!
    @IBOutlet weak var BranchName: UILabel!
    
    override func viewDidLoad(){
        super.viewDidLoad()

//        TableView.isHidden = true
        BranchName.text = ApiSp.branch_address
        brnchlabl.text = ApiSp.BrnchName
        branchImg.image = BrnchLrgLogo
        //for rounded corners
        TableView.layer.cornerRadius = 10
        TableView.layer.masksToBounds = true
        self.view.addSubview(MyView)
        MyView.addSubview(TableView)
        MyView.layer.cornerRadius = 33
        MyView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        TakQ.layer.cornerRadius = 8
        //TableView.tableFooterView = UIView()
        BranchHandleRefresh()
    }
    
    
    @IBAction func HideTimeBtn(_ sender: Any) {
        
        if TableView.isHidden == true{
            TableView.isHidden = false
        }else{
            TableView.isHidden = true
        }
    }
    
    
    //    @objc func HideTable() {
    //             //Causes the view (or one of its embedded text fields) to resign the first responder status.
    //            TableView.isHidden = false
    //         }
    
    
    func BranchHandleRefresh(){
        APIBranch.Branch { (error :Error?, ArrBranchServices:[BranchServices]?, ArrBranchTimes:[branchTimes]?) in
            
            if let MyArrBranch = ArrBranchServices{
                self.ServBranchs = MyArrBranch
                self.TableView.reloadData()
            }
            
            if let MyArrTime = ArrBranchTimes{
                self.TimeBranches = MyArrTime
                self.TableView.reloadData()
            }
        }
    }
    
    @IBAction func TQAction(_ sender: Any) {
        print("Start")
        //current date..
        let date = Date()
        let dateFormatter = DateFormatter()
        //        dateFormatter.setLocalizedDateFormatFromTemplate("hh,mmm")
        //        let current_date_time = dateFormatter.string(from: date)
        //        print("current_date_time-->",current_date_time)
        //adding waiting time..
        let addminutes = date.addingTimeInterval(WaitingHours * 60)
        //time formate..
        dateFormatter.setLocalizedDateFormatFromTemplate("hh,mmm")
        booking_time = dateFormatter.string(from: addminutes)
        print("booking_time-->",booking_time)
        //pass booking time to use it as param..
        ApiTickets.api_booking_time = booking_time
        // APi Take Que..
        ApiTickets.TakeQue{(error:Error?,success: Bool) in
            print("Go")
            if success{
                print("TakeQue")
                let myv = self.storyboard?.instantiateViewController(withIdentifier: "ft") as! FinalTicket
                myv.SelctedServName = self.ServName
                myv.ServProvName = self.myspname
                myv.BLogo = self.BrnchLrgLogo
                myv.NumPersons = ApiTickets.NumberOfPersons
                myv.WTime = self.myWTime
                myv.TNum = ApiTickets.TicketNum
                myv.currentCost =  self.ServCost
                myv.ticket_booking_time = self.booking_time
                //            print("currentCost\( myv.currentCost)")
                // myv.WTime = (self.WaitingHours)
                self.navigationController?.pushViewController(myv,animated: true)
            }
        }
    }
    
}

extension ViewController :UITableViewDataSource,UITableViewDelegate{
    
    // numberOfSections..
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    // numberOfRowsInSection..
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch section {
        case 0:
            return TimeBranches.count
        case 1:
            return ServBranchs.count
        default:
            return 0
        }
    }
    // cellForRowAt indexPath..
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let Cell = UITableViewCell()
        switch indexPath.section {
        case 0:
            guard let Tcell = tableView.dequeueReusableCell(withIdentifier: "tcell") else{return UITableViewCell()}
            let DayName: UILabel = (Tcell.viewWithTag(46) as! UILabel)
            DayName.text = TimeBranches[indexPath.row].englishDay
            let From: UILabel = (Tcell.viewWithTag(47) as! UILabel)
            From.text = "From"
            let FromHour: UILabel = (Tcell.viewWithTag(48) as! UILabel)
            FromHour.text = TimeBranches[indexPath.row].hFrom
            let To: UILabel = (Tcell.viewWithTag(49) as! UILabel)
            To.text = "To"
            let ToHour: UILabel = (Tcell.viewWithTag(50) as! UILabel)
            ToHour.text = TimeBranches[indexPath.row].hTo
            //  Tcell.textLabel?.text = TimeBranches [indexPath.row].englishDay
            return Tcell
        case 1:
            guard let Scell = tableView.dequeueReusableCell(withIdentifier: "scell") else{return UITableViewCell()}
            let ServName: UILabel = (Scell.viewWithTag(41) as! UILabel)
            ServName.text = ServBranchs[indexPath.row].englishName
            let ServTime: UILabel = (Scell.viewWithTag(42) as! UILabel)
            ServTime.text = String(ServBranchs[indexPath.row].timeElapsed ?? 0)
            let ServCost: UILabel = (Scell.viewWithTag(43) as! UILabel)
            ServCost.text = String(ServBranchs[indexPath.row].cost ?? 0)
            return Scell
        //   Cell.textLabel?.text = ServBranchs[indexPath.row].englishName
        default:
            Cell.textLabel?.text = "This Shouldn't Happen"
        }
        return Cell
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Opening Times"
        case 1:
            return "Select Service"
        default:
            return nil
        }
    }
    
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectedCell(row: indexPath.row)
        if indexPath.section == 1 {
            print("Branch:Service cell selected")
            
            Helper.SaveServiceId(ServiceId: ServBranchs[indexPath.row].id!)
            guard let SrviceID = Helper.GetServiceId() else{return}
            print("SrviceID: \(SrviceID)")
            
            
            ApiTickets.GetPersonsAndWaitingTime { (error: Error?, ArrTickets: [ServiceTicket]?) in
                print("Succed")
                ApiTickets.api_timeelapsed = self.ServBranchs[indexPath.row].timeElapsed ?? 0
                // Calculate WaitingTime in Hours..
                self.WaitingHours = ( Double (ApiTickets.NumberOfPersons ) * self.ServBranchs[indexPath.row].timeElapsed!) // / 60
                print("Waiting Hours:\(self.WaitingHours)")
                //                var Hours: Int
                //                var Minutes: Int
                self.Hours = Int(floor(self.WaitingHours / 60))
                //                print("Hours:\(Hours)")
                self.Minutes = Int(round(self.WaitingHours - Double(self.Hours) * 60))
                //                print("Minutes: \(Minutes)")
                // Set WaitingTime in labl..
                self.WaitingTimelabl.text = "\(self.Hours):\(self.Minutes)"
                self.myWTime = ("\(self.Hours):\(self.Minutes)")
                print("waiting Time :\("\(self.Hours):\(self.Minutes)")")
                
                // set NumberOfPersons in labl..
                self.NumberOfPersons.text = String (ApiTickets.NumberOfPersons)
                print("NumberOfPersons\( String(describing: self.NumberOfPersons.text))")
                // Put ServeName in Global Var to Parse it to next ViewController..
                self.ServName = self.ServBranchs[indexPath.row].englishName!
                print("ServName: \(self.ServName)")
                self.ServCost = Double(self.ServBranchs[indexPath.row].cost!)
                //     print("Cost: \(self.ServCost)")
                ApiTickets.Paramcost = self.ServCost
                print("Paramcost: \(ApiTickets.Paramcost)")
                //                guard let catid = Helper.GetCatgId() else{return}
                //                           print("CatgID: \(catid)")
                //                guard let BrnchId = Helper.GetBrnchId() else{return}
                //                     print("Branch ID: \(BrnchId)")
                //
                //                guard let UserId = Helper.getid() else{return}
                //                    print("UserId: \(UserId)")
                
                //   Put ServCost in Global Var to Parse it to next ViewController;And send it as param to API Taketurn..
                
                
                //                ApiTickets.ApiCost = self.ServBranchs[indexPath.row].cost!
                //                 print("ApiCost: \(ApiTickets.ApiCost)")
                //                Helper.SaveSelectedServiceName(ServiceName: self.ServBranchs[indexPath.row].englishName!)
                //                guard let GetSelectedServiceName = Helper.GetSelectedServiceName() else{return}
                //                print("SaveSelectedServiceName: \(GetSelectedServiceName)")
                
                
            }
        }else{
            print("Branch:Service Cell selected")
            print("Only See")
            
        }
        
        //        ApiSp.CatgSpS { (error:Error?, ArrSp:[CatgSp]?) in
        //          //  var SpName = ArrSp.
        //        }
        //            Helper.SaveServiceCost(ServiceCost: ServBranchs[indexPath.row].cost!)
        //            guard let SrviceCost = Helper.GetServiceCost() else{return}
        //                            print("SrviceCost: \(SrviceCost)")
        //
        //            Helper.SaveServiceTime(ServiceTime: ServBranchs[indexPath.row].timeElapsed ?? 0)
        //            guard let SrviceTime = Helper.GetServiceTime() else{return}
        //                   print("SrviceTime: \(SrviceTime)")
    }
    
    
    
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return cellheight
    }
    
    //
    //    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    //        let Btn = UIButton(type: .custom) as UIButton
    //        Btn.addTarget(self, action: Selector(("buttonActionFromCode:")), for: UIControl.Event.touchUpInside)
    //// let uiButton    = UIButton.buttonWithType(UIButtonType.System) as UIButton
    ////      uiButton.frame  = CGRectMake(16, 116, 288, 30)
    ////      uiButton.setTitle("Second", forState: UIControlState.Normal);
    ////      uiButton.addTarget(self, action: "buttonActionFromCode:", forControlEvents: UIControlEvents.TouchUpInside)
    ////      self.view.addSubview(uiButton)
    //        func buttonActionFromCode(sender:UIButton)
    //        {
    //                if tableView.isHidden == true{
    //                    tableView.isHidden = false
    //                }else{
    //                    tableView.isHidden = true
    //            }
    //
    //                    }
    //
    //    }
}



