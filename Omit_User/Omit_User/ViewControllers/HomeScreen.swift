//
//  HomeScreen.swift
//  Omit_User
//
//  Created by shimaa alwaney on 6/8/20.
//  Copyright © 2020 Shimaa Alwaney. All rights reserved.
//
import Foundation
import UIKit
import CoreLocation

protocol tableVcprptocolDelegate: class {
       func selectedCell(row: Int)
}

class HomeScreen: UITableViewController,UIPageViewControllerDelegate,tableVcprptocolDelegate{
    func selectedCell(row: Int) {
            print("Row: \(row)")
       }

//  static  var shimaa: Int?
    
    static var current_time = ""
    static var lat = 0
    static var lng = 0
   // var str = String()
    private var locationManager: CLLocationManager?

    //Cell 1...
    @IBOutlet weak var welcome_msg: UILabel!
    @IBOutlet weak var user_name: UILabel!
    //Tickets CollectionView...
    @IBOutlet weak var TicketsCollection: UICollectionView!
    // SA Table...
    @IBOutlet weak var SATable: UITableView!
    @IBOutlet weak var categories_collectionview: UICollectionView!
    var DataSourceCatg: categories_datasource!
    var DataSourceSA: ServAroundDataSource!
    var DataSourceTickets: TicketsDataSource!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        user_name.text = Helper.get_display_name()
        UINavigationBar.appearance().barTintColor = .secondarySystemBackground
        /// allow scrooling in all states and if there isn't elements:
        categories_collectionview.alwaysBounceHorizontal = true
//        //using with time(h,m,s)
////        // get the current date and time
//        let current_date = Date()
//        print("current_date: \(current_date)")
//        let date_formatter = DateFormatter()
//        date_formatter.setLocalizedDateFormatFromTemplate("hh,mm`   m")
////        date_formatter.dateFormat = "yyyy/mm/dd, "
//        HomeScreen.self.current_time = date_formatter.string(from: current_date)
//        print("current_time: \(HomeScreen.current_time)")
//        let final_curr_date = date + time
//             print("final_curr_date: \(final_curr_date)")
        //Determine Calender components..
//        let current_date = Date()
//        //For One Component:
//        let Hour = Calendar.current.component(.hour, from: current_date)
//        print("Hour\(Hour)")
//        //For Many Components:
//        let date_components = Calendar.current.dateComponents([.day,.hour,.minute], from: current_date)
//        let Day = date_components.day
//         print("date_components: \(date_components)")
//        print("Day: : \(String(describing: Day))")
        // using With Date(y,m.d)
        // initialize the date format and set the style and Format:
     
        navigationItem.title = "Home"
        //Get Location From GPS..
        locationManager = CLLocationManager()
        locationManager?.requestAlwaysAuthorization()
        locationManager?.startUpdatingLocation()
        locationManager?.delegate = self as? CLLocationManagerDelegate
        locationManager?.allowsBackgroundLocationUpdates = true
        // Layout..
        // Add the variable that contain Datasource And Delegate of:
        // 1. Tickets CollectionView to this class..
        DataSourceTickets = TicketsDataSource(homevvc: self)
        self.TicketsCollection.dataSource = DataSourceTickets
        self.TicketsCollection.delegate = DataSourceTickets
//        //2. SA TableView to this class..
        DataSourceSA = ServAroundDataSource(homevc: self)
        self.SATable.dataSource = DataSourceSA
        self.SATable.delegate = DataSourceSA
//           //2. Catg TableView to this class..
        DataSourceCatg = categories_datasource(homev: self)
        self.categories_collectionview.dataSource = DataSourceCatg
        self.categories_collectionview.delegate = DataSourceCatg
        //Call Function That put API's Array In Tickets CollectionView..
         TicketsCollectonHandleRefresh()
        //Call Function That put API's Array In SA Table..
        ServArroundHandleRefresh()
        //Call Function That put API's Array In Categories Table..
        CategHandleRefresh()
    }
    
    func TicketsCollectonHandleRefresh(){
        ApiTicketsTableAndCollection.all_tickets{ (error:Error?, ArrTickets:[TicketCollection]?) in
//            if ApiTicketsTableAndCollection.TCanceled == false{
                if ArrTickets != nil{
            self.DataSourceTickets.ArrTickets = ArrTickets!
              self.TicketsCollection.reloadData()
                }else{
                    print("Error:found Nil")
                }
            }
//          }
    }
    // To put API's Array In Categories TableView..
    func CategHandleRefresh(){
        ApiHomeScrn.Catigories { (error:Error?,catigories_arr: [Catigory]?) in
            if catigories_arr != nil{
                    // Load Data In Table..
            self.DataSourceCatg.categories_arr = catigories_arr!
            self.categories_collectionview.reloadData()
            }else{
                print("Error:found Nil")
            }
        }
    }
    
    // To put API's Array In SA Table..
    func ServArroundHandleRefresh(){
        ApiHomeScrn.ServicesAroundTable { (error:Error?,services: [Service]?) in
            let distanceInMeter = Helper.calculateDistance(mobileLocationX: Double(HomeScreen.lat), mobileLocationY: Double(HomeScreen.lng), DestinationX: Double(ApiHomeScrn.lat), DestinationY: Double(ApiHomeScrn.lng))
//            let Km = Measurement(value: 1, unit: UnitLength.kilometers) // 1.0 km
//            print("Km : \(Km)")
            for _ in [services]{
                if distanceInMeter <= 4700_000 {
                    if services != nil{
                      // Load Data In Table..
                    self.DataSourceSA.services = services!
                    self.SATable.reloadData()
                }else{
                    print("Error:found Nil")
                }
            
                print ("Done")
            }
        }
    }
    }
    //Get Location From GPS..
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let Location = locations.last{
            HomeScreen.lat = Int(Location.coordinate.latitude)
            print("GPSLat : \(HomeScreen.lat)")
            HomeScreen.lng = Int(Location.coordinate.latitude)
            print("GPSLng : \(HomeScreen.lng)")
            
            //             let GPSLocation = Location.coordinate.self
            //             print("GPSLocation: \(GPSLocation )")
            
            
        }
    }
}







//
//class ReservationsData: UITableViewController {
//    
//    
//    @IBOutlet weak var timbtn: UIButton!
//     @IBOutlet weak var TimeTable: UITableView!
//    @IBOutlet weak var SelctServBtn: UIButton!
//    @IBOutlet weak var detailsTable: UITableView!
// 
//    var servicesarray = ["mema","mema","mema","mema","mema","mema","mema","mema","mema","mema","mema","mema","mema","mema","mema","mema"]
//    
//   
//  
//    override func viewDidLoad() {
//        super.viewDidLoad()
////       
////             detailsTable.layer.corner Radius = 11
////             SelctServBtn.layer.cornerRadius = 11
//             self.TimeTable.isHidden = true
//             self.detailsTable.isHidden = true
//             //           self.detailsTable.isHidden = true
//             TimeTable.dataSource = self
//             TimeTable.delegate = self
////                        detailsTable.dataSource = self
////                        detailsTable.delegate = self
//    }
//        
//    @IBAction func TimeBtnAction(_ sender: Any) {
//            if TimeTable.isHidden {
//                TimeTable.isHidden = false
//            } else {
//                TimeTable.isHidden = true
//            }
//            if TimeTable.isHidden{
//                      
//                      Animate(toggle: true, type: timbtn )
//                  }else{
//                      Animate(toggle: false,type: timbtn)
//                  }
//       }
//        
//        
//   @IBAction func SlctServActionBtn(_ sender: Any) {
//            //
//            //        UIView.transition(with: detailsTable, duration: 0.3, options:.beginFromCurrentState, animations: nil, completion: nil)
//            //        if detailsTable.isHidden {
//            //            detailsTable.isHidden = false
//            //          } else {
//            //            detailsTable.isHidden = true
//            //          }
//            if detailsTable.isHidden{
//                
//                Animate(toggle: true, type: SelctServBtn )
//            }else{
//                Animate(toggle: false,type: SelctServBtn)
//            }
//            
//        }
//        
//        func Animate(toggle:Bool,type: UIButton){
//            if type == SelctServBtn{
//            if toggle{
//                UIView.animate(withDuration: 0.3){
//                    self.detailsTable.isHidden = false
//                }
//            }  else{
//                UIView.animate(withDuration: 0.3){
//                    self.detailsTable.isHidden = true
//                }
//            }
//        }else{
//        if toggle{
//                  UIView.animate(withDuration: 0.3){
//                      self.TimeTable.isHidden = false
//                  }
//              }  else{
//                  UIView.animate(withDuration: 0.3){
//                      self.TimeTable.isHidden = true
//                  }
//              }
//        }
//        }
////}
//
//
////extension ReservationDetails: UITableViewDataSource,UITableViewDelegate{
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        var NumberOfRow = 1
//        switch tableView {
//        case TimeTable:
//            NumberOfRow = timearray.count
//        case detailsTable:
//            NumberOfRow = servicesarray.count
//        default:
//            print("Error")
//        }
//        return NumberOfRow
//        //  return timearray.count
//    }
//    
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        var Cell = UITableViewCell()
//        switch tableView {
//        case TimeTable:
//             Cell = tableView.dequeueReusableCell(withIdentifier: "timcell", for: indexPath)
//            let Name: UILabel = (Cell.viewWithTag(32) as! UILabel)
//            Name.text = timearray [indexPath.row]
//        case detailsTable:
//             Cell = tableView.dequeueReusableCell(withIdentifier: "servcell", for: indexPath)
//            let Name: UILabel = (Cell.viewWithTag(31) as! UILabel)
//            Name.text = servicesarray[indexPath.row]
//        default:
//            print("Error")
//        }
//        
//        
//        return Cell
//    }
//}
