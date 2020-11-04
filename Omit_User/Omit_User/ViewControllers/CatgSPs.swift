//
//  CatgSPs.swift
//  Omit_User
//
//  Created by shimaa alwaney on 7/28/20.
//  Copyright © 2020 Shimaa Alwaney. All rights reserved.
//

import UIKit
import Foundation
protocol VcprptocolDelegate: class {
    func selectedCell(row: Int)
}
class CatgSPs: UIViewController,VcprptocolDelegate{
    func selectedCell(row: Int) {
        print("Row: \(row)")
    }
    var str = String()
    var Cimg = UIImage()
    var CatgSpS = [CatgSp]()
    @IBOutlet weak var SPTable: UITableView!
    fileprivate var cellheight:CGFloat = 50
    
    // var str: String!
    // var img:String?
    
    
    @IBOutlet weak var CatgName: UILabel!
    @IBOutlet weak var CatgLogo: UIImageView!
    @IBOutlet weak var myview: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //        guard let UserId = Helper.getid() else{return}
        //                          print("UserId: \(UserId)")
        SPTable.layer.cornerRadius = 33
        SPTable.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        myview.layer.cornerRadius = 33
        myview.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
        CatgLogo.image = Cimg
        CatgName.text = str
        
        SPTable.dataSource = self
        SPTable.delegate = self
        SPHandleRefresh()
    }
    
    func SPHandleRefresh(){
        ApiSp.CatgSpS{(error: Error?,CatgSpS : [CatgSp]?) in
            if let CatgSpS = CatgSpS{
                self.CatgSpS = CatgSpS
                self.SPTable.reloadData()
            }
        }
    }
    
    
}

extension CatgSPs: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let SpCell = tableView.dequeueReusableCell(withIdentifier: "spcell", for: indexPath)
        let SpName: UILabel = (SpCell.viewWithTag(12) as! UILabel)
        SpName.text = CatgSpS[indexPath.row].englishName
        
        let Spgimg: UIImageView = SpCell.viewWithTag(13) as! UIImageView
        let finalimg = Helper.convertImage(logo: CatgSpS[indexPath.row].logo)
        Spgimg.image = finalimg
        return SpCell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return CatgSpS.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
}



extension CatgSPs :UITableViewDelegate{
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
        
        Helper.SaveSPId(spid:CatgSpS [indexPath.row].id)
        guard let SpId = Helper.GetspId() else{return}
        print("SPID: \(SpId)")
        ///create obj of vc which in storyboard:
        let myvc = self.storyboard?.instantiateViewController(withIdentifier: "brnchs") as! SevPBrnchs
        ///set data in vc:
        myvc.bimg = Helper.convertImage(logo: CatgSpS[indexPath.row].logo)!
        myvc.lbl = CatgSpS[indexPath.row].englishName
        ///navigate to vc:
        self.navigationController?.pushViewController(myvc,animated: true)
    }
    
}



//        CatgLogo = UIImage(named: img!)
//        print ("CatgName?.text:\(String(describing: CatgName?.text))")
//        CatgLogo.image = UIImage(named: Cimg)
//       print(Cname)
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        CatgName?.text = str
//        //  print ("CatgName?.text:\(String(describing: CatgName?.text))")
//    }
