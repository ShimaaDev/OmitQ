//
//  HomeTickets.swift
//  Omit_User
//
//  Created by shimaa alwaney on 6/28/20.
//  Copyright © 2020 Shimaa Alwaney. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"
// fileprivate var cellheight:CGFloat = 85
class TicketsDataSource: NSObject,UICollectionViewDelegate,UICollectionViewDataSource ,UICollectionViewDelegateFlowLayout{
    var homeRef: HomeScreen
    init(homevvc:HomeScreen) {
        homeRef = homevvc
    }
    //    var ServCost = Double()
    //      var fWTime = String()
    //      var myspname = String()
    //      var ServName = String()
    var WaitingHours = 0.0
    var splited_branch_name = String()
    var splited_service_name = String()
    func selectedCell(row: Int) {
        print("Row: \(row)")
    }
    
    var ArrTickets = [TicketCollection]()
    
    // Configure the cell
     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
        //        if (ArrTickets[indexPath.row].isCanceled == false && ArrTickets[indexPath.row].isApproved == false){
        let waiting_time: UILabel = cell.viewWithTag(55) as! UILabel
        //        waiting_time.text = String(ArrTickets[indexPath.row].waitingMintues ?? 0.0 )
        let total_waiting_time = ArrTickets[indexPath.row].waitingMintues
        let Hours = Int(floor(total_waiting_time! / 60))
        print("Hours: \(Hours)")
        let Minutes = Int(round(total_waiting_time! - Double(Hours) * 60))
        print("Minutes: \(Minutes)")
        waiting_time.text = "\(Hours):\(Minutes)"
        ///branch_logo:
        let branch_logo: UIImageView = cell.viewWithTag(200) as! UIImageView
        let finalimg = Helper.convertImage(logo: ArrTickets [indexPath.row].branchLogo!)
        /// round image:
        branch_logo.layer.cornerRadius = branch_logo.frame.height/2
        branch_logo.clipsToBounds = true
        branch_logo.image = finalimg
        /// number_persons:
        let number_persons :UILabel = cell.viewWithTag(56) as! UILabel
        number_persons.text = String(ArrTickets[indexPath.row].persons ?? 0)
        /// ticket_number:
        let ticket_number :UILabel = cell.viewWithTag(52) as! UILabel
        ticket_number.text = ArrTickets[indexPath.row].ticketNo ?? ""
        /// booking_date:
        let booking_date :UILabel = cell.viewWithTag(100) as! UILabel
        /// split booking_time:
        //    booking_date.text = Helper.split_string(string_to_split: ArrTickets[indexPath.row].bookingDate ?? "")
        let str = ArrTickets[indexPath.row].bookingDate!.components(separatedBy: "T")
       let splited_booking_date = str[0]   /// First(dte)
        //        let splited_booking_time = str[1]   /// Last(time)
        booking_date.text = splited_booking_date
        ///branch name lable..81
        let branch_name :UILabel = cell.viewWithTag(81) as! UILabel
        //        branch_name.text = ArrTickets[indexPath.row].branchName ?? ""
        let branch_str = ArrTickets[indexPath.row].branchName?.components(separatedBy: "@")
         splited_branch_name = branch_str![0]
        print("splited_branch_name :\(String(describing: splited_branch_name))")
        branch_name.text = splited_branch_name
        /// service name labl..
        let service_name :UILabel = cell.viewWithTag(82) as! UILabel
        let service_str = ArrTickets[indexPath.row].serviceName?.components(separatedBy: "@")
         splited_service_name = service_str![0]
        print("splited_service_name :\(String(describing: splited_service_name))")
        service_name.text = splited_service_name
        let TView :UIView = cell.viewWithTag(54)!
        TView.layer.cornerRadius = 18
        //}
        return cell
        
    }
    
     func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        homeRef.selectedCell(row: indexPath.row)
        print("hiiiiiiii")
        ///save ticket id in userdefaults to send it as param:
        Helper.SaveTicketId(TicketId:ArrTickets[indexPath.row].ticketID! )
        if let SavedTicketid = Helper.GetTicketId(){
            print("SavedTicketID: \( SavedTicketid)")
        }
        
        ApiTicketsTableAndCollection.GetCertainTicket { (error:Error?,success: Bool) in
            if success{
        let myv = self.homeRef.storyboard?.instantiateViewController(withIdentifier: "ft") as! FinalTicket
                myv.BLogo = Helper.convertImage(logo: self.ArrTickets [indexPath.row].branchLogo!)!
                myv.NumPersons = self.self.ArrTickets[indexPath.row].persons ?? 0
                myv.TNum = self.ArrTickets[indexPath.row].ticketNo ?? ""
                let time = ApiTicketsTableAndCollection.WaitingMintues
                let wait_hours = Int(floor(time / 60))
                let wait_minutes = Int(round(time - Double(wait_hours) * 60))
                myv.WTime = "\(wait_hours):\(wait_minutes)"
                let befor = ApiTicketsTableAndCollection.BookingDate.components(separatedBy: "T")
//               let splited_date = befor[0]   /// First(dte)
               let splited_time = befor[1]   /// Last(time)
                myv.ticket_booking_time = splited_time
                myv.SelctedServName = self.splited_service_name
                myv.ServProvName = self.splited_branch_name
                self.homeRef.navigationController?.pushViewController(myv,animated: true)

            }
            
        }
        
    }
    //
    //    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    //      {
    //         return CGSize(width: 325, height: 206)
    //      }
    // return the number of sections()
     func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return 1
    }
    // return the number of items
     func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ArrTickets.count
        
    }
    ///spce between cells:
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    //    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
    //         return 10
    //    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 168, height: 105)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: 0, height: 0)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize(width: 0, height: 0)
    }
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using [segue destinationViewController].
     // Pass the selected object to the new view controller.
     }
     */
    
    // MARK: UICollectionViewDelegate
    
    /*
     // Uncomment this method to specify if the specified item should be highlighted during tracking
     override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
     return true
     }
     */
    
    /*
     // Uncomment this method to specify if the specified item should be selected
     override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
     return true
     }
     */
    
    /*
     // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
     override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
     return false
     }
     
     override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
     return false
     }
     
     override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
     
     }
     */
    
}
