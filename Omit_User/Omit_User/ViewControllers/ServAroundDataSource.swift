//
//  ServAroundDataSource.swift
//  Omit_User
//
//  Created by shimaa alwaney on 6/21/20.
//  Copyright © 2020 Shimaa Alwaney. All rights reserved.
//

import UIKit

class ServAroundDataSource: NSObject,UITableViewDataSource,UITableViewDelegate{
    fileprivate var cellheight:CGFloat = 40
    var services = [Service]()
    var homeRef: HomeScreen
         init(homevc: HomeScreen) {
             homeRef = homevc
         }
    // Table view data source
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Configure the cell...
        let ServAcell = tableView.dequeueReusableCell(withIdentifier: "SACell", for: indexPath)
        // labl...
        let SN:UILabel = ServAcell.viewWithTag(4)as! UILabel
        SN.text = services[indexPath.row].englishName
        //img...
        let SAgimg: UIImageView = ServAcell.viewWithTag(3) as! UIImageView
        let fnalimg = Helper.convertImage(logo: services[indexPath.row].smallLogo!)
        SAgimg.image = fnalimg
        /// round image:
             SAgimg.layer.cornerRadius = SAgimg.frame.height/2
             SAgimg.clipsToBounds = true
        //        //labl...
        //        let branch_name:UILabel = ServAcell.viewWithTag(5)as! UILabel
        //        branch_name.text = BNArr[indexPath.row]
        //        //labl...
        //        let open_status :UILabel = ServAcell.viewWithTag(6) as! UILabel
        //        open_status.text = OpenStateArr[indexPath.row]
        //        //labl...
                let distance_km:UILabel = ServAcell.viewWithTag(7) as! UILabel
//        distance_km.text = DistanceArr[indexPath.row]
        
        
        
        return ServAcell
    }
    
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.homeRef.selectedCell(row: indexPath.row)
        let myv = homeRef.storyboard?.instantiateViewController(withIdentifier: "brnch") as! ViewController
        myv.BrnchLrgLogo = Helper.convertImage(logo: services[indexPath.row].largeLogo!)!
        myv.myspname = services[indexPath.row].englishName ?? ""
        homeRef.navigationController?.pushViewController(myv,animated: true)
    }
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return services.count
    }
    
     func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellheight
    }
    
     func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
//    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return 20
//    }
//    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//      let header_title = "Services arround you"
//        return header_title
//    }
//   override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let table_header = UIView()
//    table_header.backgroundColor = UIColor.white
//  let label = UILabel()
////  label.frame = CGRect.init(x: 5, y: 5, width: table_header.frame.width-10, height: table_header.frame.height-10)
//  label.text = "Notification Times"
////    label.fonts = (12) // my custom font
////    label.textColor = UIColor.init(cgColor: "#1D4F69" as! CGColor) // my custom colour
//
////  headerView.addSubview(label)
//
//
//        return table_header
//  }
     func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0
        
    }
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        
//        // Get the new view controller using segue.destination.
//        // Pass the selected object to the new view controller.
//    }
    
    
}
