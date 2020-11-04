
//
//  SevPBrnchs.swift
//  Omit_User
//
//  Created by shimaa alwaney on 7/29/20.
//  Copyright © 2020 Shimaa Alwaney. All rights reserved.
//

import UIKit
import Foundation
class SevPBrnchs: UIViewController,VcprptocolDelegate {
    func selectedCell(row: Int) {
        print("Row: \(row)")
    }
    var lbl = String()
    var bimg = UIImage()
    var SpBranches = [SpBranch]()
    fileprivate var cellheight:CGFloat = 70
    @IBOutlet weak var LrgView: UIView!
    @IBOutlet weak var BranchTable: UITableView!
    @IBOutlet weak var brnchlbl: UILabel!
    @IBOutlet weak var brnchimg: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        BranchTable.layer.cornerRadius = 33
        BranchTable.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        LrgView.layer.cornerRadius = 33
        LrgView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        brnchlbl.text = lbl
        brnchimg.image = bimg
        BranchTable.dataSource = self
        BranchTable.delegate = self
        SPBHandleRefresh()
    }
    
    func SPBHandleRefresh(){
        ApiSp.SpBrnches{(error: Error?,SpBranches : [SpBranch]?) in
            if let SpBranches = SpBranches{
                self.SpBranches = SpBranches
                self.BranchTable.reloadData()
            }
        }
    }
    
    
}

extension SevPBrnchs: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let BCell = tableView.dequeueReusableCell(withIdentifier: "spbranch", for: indexPath)
        let SpName: UILabel = (BCell.viewWithTag(20) as! UILabel)
        SpName.text = SpBranches[indexPath.row].englishName
        
        let Spgimg: UIImageView = BCell.viewWithTag(21) as! UIImageView
        let finalimg = Helper.convertImage(logo: SpBranches[indexPath.row].smalllogo)
        Spgimg.image = finalimg
        print("Spgimg: \(String(describing: Spgimg.image))")
        
        return BCell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SpBranches.count
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
}


extension SevPBrnchs :UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return cellheight
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectedCell(row: indexPath.row)
        print("cell selectedsp")
        guard let catid = Helper.GetCatgId() else{
            return
        }
        print("CatgID: \(catid)")
        Helper.SaveBrnchId(Branchid:SpBranches [indexPath.row].id)
        guard let BrnchId = Helper.GetBrnchId() else{return}
        print("Branch ID: \(BrnchId)")
        
        let myv = self.storyboard?.instantiateViewController(withIdentifier: "brnch") as! ViewController
        myv.BrnchLrgLogo = Helper.convertImage(logo: SpBranches[indexPath.row].largelogo)!
        myv.myspname = lbl
        self.navigationController?.pushViewController(myv,animated: true)
        
    }
    
    
    
}



//class branches: UIViewController {
//    var SpBranches = [SpBranch]()
//    @IBOutlet weak var ScndView: UIView!
//    @IBOutlet weak var FView: UIView!
//    @IBOutlet weak var SpName: UILabel!
//    @IBOutlet weak var LrgLogo: UIImageView!
//    @IBOutlet weak var BrnchsTable: UITableView!
//
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
////      BrnchsTable.dataSource = self
////      BrnchsTable.delegate = self
//        ScndView.layer.cornerRadius = 33
//        ScndView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
//       // SpBrnchsHandleRefresh()
//   }
//    func SPHandleRefresh(){
//          ApiSp.SpBrnches{(error: Error?,SpBranches : [SpBranch]?) in
//                    if let SpBranches = SpBranches{
//                    self.SpBranches = SpBranches
//                    self.BrnchsTable.reloadData()
//                    }
//            }
//      }
//}
//
//extension CatgSPs: UITableViewDataSource{
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let SpCell = tableView.dequeueReusableCell(withIdentifier: "brcell", for: indexPath)
//        let SpName: UILabel = (SpCell.viewWithTag(20) as! UILabel)
//        SpName.text = CatgSpS [indexPath.row].englishName
//
//        let Spimg: UIImageView = SpCell.viewWithTag(21) as! UIImageView
////        let finalimg = Helper.convertImage(logo: CatgSpS [indexPath.row])
////        Spimg.image = finalimg
//
//        return SpCell
//        }
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return SpBranches.count
//    }
//
//    func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 1
//    }
//}
//
//////extension CatgSPs:UITableViewDelegate{
//////    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//////
//////        return cellheight
//////    }
//////    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//////
//////        Helper.SaveSPId(spid: CatgSpS[indexPath.row].id)
//////
//////        guard let catid = Helper.GetspId() else{
//////            return
//////        }
//////        print("SPID: \(catid)")
//////    }
