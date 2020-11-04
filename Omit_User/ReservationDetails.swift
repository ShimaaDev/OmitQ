////
////  ReservationDetails.swift
////  Omit_User
////
////  Created by shimaa alwaney on 8/1/20.
////  Copyright © 2020 Shimaa Alwaney. All rights reserved.
////
//
//import UIKit
//
//class ReservationDetails: UIViewController{
////
////    @IBOutlet weak var TimeTable: UITableView!
////    @IBOutlet weak var timbtn: UIButton!
////    @IBOutlet weak var SelctServBtn: UIButton!
////    @IBOutlet weak var detailsTable: UITableView!
////    var timearray = ["mema","mema","mema","lklklk","mema","kjhga","mema","mema","mema","mema","mema","mema","mema","mema","mema","mema"]
////    var servicesarray = ["mema","mema","mema","mema","mema","mema","mema","mema","mema","mema","mema","mema","mema","mema","mema","mema"]
//    override func viewDidLoad() {
//        super.viewDidLoad()
//         Myview.layer.cornerRadius = 33
//         Myview.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
//         TimeTable.layer.cornerRadius = 11
//         SlctSrvceBtn.layer.cornerRadius = 11
////        TimeTable.layer.cornerRadius = 11
////        timbtn.layer.cornerRadius = 11
////        detailsTable.layer.cornerRadius = 11
////        SelctServBtn.layer.cornerRadius = 11
////        self.TimeTable.isHidden = true
////        self.detailsTable.isHidden = true
////        //           self.detailsTable.isHidden = true
////        TimeTable.dataSource = self
////        TimeTable.delegate = self
////                   detailsTable.dataSource = self
////                   detailsTable.delegate = self
//    }
////
////    @IBAction func TimeBtnAction(_ sender: Any) {
//////        if TimeTable.isHidden {
//////            TimeTable.isHidden = false
//////        } else {
//////            TimeTable.isHidden = true
//////        }
////        if TimeTable.isHidden{
////
////                  Animate(toggle: true, type: timbtn )
////              }else{
////                  Animate(toggle: false,type: timbtn)
////              }
////   }
////
////
////    @IBAction func SlctServActionBtn(_ sender: Any) {
////        //
////        //        UIView.transition(with: detailsTable, duration: 0.3, options:.beginFromCurrentState, animations: nil, completion: nil)
////        //        if detailsTable.isHidden {
////        //            detailsTable.isHidden = false
////        //          } else {
////        //            detailsTable.isHidden = true
////        //          }
////        if detailsTable.isHidden{
////
////            Animate(toggle: true, type: SelctServBtn )
////        }else{
////            Animate(toggle: false,type: SelctServBtn)
////        }
////
////    }
////
////    func Animate(toggle:Bool,type: UIButton){
////        if type == SelctServBtn{
////        if toggle{
////            UIView.animate(withDuration: 0.3){
////                self.detailsTable.isHidden = false
////            }
////        }  else{
////            UIView.animate(withDuration: 0.3){
////                self.detailsTable.isHidden = true
////            }
////        }
////    }else{
////    if toggle{
////              UIView.animate(withDuration: 0.3){
////                  self.TimeTable.isHidden = false
////              }
////          }  else{
////              UIView.animate(withDuration: 0.3){
////                  self.TimeTable.isHidden = true
////              }
////          }
////    }
////    }
//
//}
////
////
////extension ReservationDetails: UITableViewDataSource,UITableViewDelegate{
////    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
////        var NumberOfRow = 1
////        switch tableView {
////        case TimeTable:
////            NumberOfRow = timearray.count
////        case detailsTable:
////            NumberOfRow = servicesarray.count
////        default:
////            print("Error")
////        }
////        return NumberOfRow
////        //  return timearray.count
////    }
////
////    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
////        var Cell = UITableViewCell()
////        switch tableView {
////        case TimeTable:
////             Cell = tableView.dequeueReusableCell(withIdentifier: "timcell", for: indexPath)
////            let Name: UILabel = (Cell.viewWithTag(32) as! UILabel)
////            Name.text = timearray [indexPath.row]
////        case detailsTable:
////             Cell = tableView.dequeueReusableCell(withIdentifier: "servcell", for: indexPath)
////            let Name: UILabel = (Cell.viewWithTag(31) as! UILabel)
////            Name.text = servicesarray[indexPath.row]
////        default:
////            print("Error")
////        }
////
////
////        return Cell
////    }
////}
//
//
////extension ReservationDetails: UITableViewDataSource,UITableViewDelegate{
////    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
////      return servicesarray.count
////    }
////
////    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
////        let ServCell = tableView.dequeueReusableCell(withIdentifier: "servcell", for: indexPath)
////        let Name: UILabel = (ServCell.viewWithTag(31) as! UILabel)
////                      Name.text = servicesarray[indexPath.row]
////
////        return ServCell
////    }
//
//
////    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
////
////    }
//
////  }
//
//
//
////    let tableViewData = [
////        ["adam","yara","body","tamtam","mema"],
////        ["1","2","3","4","5"],
////        ["1","2","3","4","5"],
//////        ["1","2","3","4","5"],
//////        ["1","2","3","4","5"],
////    ]
////    var hiddenSections = Set<Int>()
////
//
////
////    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
////           let cell = UITableViewCell()
////           cell.textLabel?.text = self.tableViewData[indexPath.section][indexPath.row]
////
////           return cell
////      }
////    // numberOfSections..
////    func numberOfSections(in tableView: UITableView) -> Int {
////          return self.tableViewData.count
////    }
////    // numberOfRowsInSection
////    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
////     // 1
////       if self.hiddenSections.contains(section) {
////           return 0
////       }
////
////       // 2
////       return self.tableViewData[section].count
////    }
////    // viewForHeaderInSection
////    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
////        // 1
////        let sectionButton = UIButton()
////
////        // 2
////            if section == 0 {
////            sectionButton.setTitle ("Select Time",for: .normal)
////            }
////            else if section == 1 {
////            sectionButton.setTitle ("Select Service",for: .normal)
////            }
////            else if section == 2 {
////            sectionButton.setTitle ("Select Service",for: .normal)
////            }
////        // 3
////        sectionButton.backgroundColor = .purple
////
////        // 4
////        sectionButton.tag = section
////
////        UIView.animate(withDuration:0.3){
////            self.detailsTable.isHidden = false
////        }
////
////        // 5
////        sectionButton.addTarget(self,
////                                action: #selector(self.hideSection(sender:)),
////                                for: .touchUpInside)
////
////        return sectionButton
////    }
////
////
////
////    @objc private func hideSection(sender: UIButton) {
////        // Create section let..
////        let section = sender.tag
////        // Add indexPathsForSection method..
////        func indexPathsForSection() -> [IndexPath] {
////            var indexPaths = [IndexPath]()
////
////            for row in 0..<self.tableViewData[section].count {
////                indexPaths.append(IndexPath(row: row,
////                                            section: section))
////            }
////
////            return indexPaths
////        }
////        // Logic to add/remove sections to/from hiddenSections, and delete and insert functionality for tableView..
////        if self.hiddenSections.contains(section) {
////            self.hiddenSections.remove(section)
////            self.detailsTable.insertRows(at: indexPathsForSection(),
////                                      with: .fade)
////        } else {
////            self.hiddenSections.insert(section)
////            self.detailsTable.deleteRows(at: indexPathsForSection(),
////                                      with: .fade)
////        }
////    }
//
///*
// MARK: - Navigation
//
// In a storyboard-based application, you will often want to do a little preparation before navigation
// override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
// Get the new view controller using segue.destination.
// Pass the selected object to the new view controller.
// }
// */
//
