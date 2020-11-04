//
//  categories_datasource.swift
//  Omit_User
//
//  Created by shimaa alwaney on 10/6/20.
//  Copyright © 2020 Shimaa Alwaney. All rights reserved.
//

import UIKit
import Foundation
// fileprivate var cellheight:CGFloat = 85
 private let reuseIdentifier = "catigories"
class categories_datasource: NSObject ,UICollectionViewDelegateFlowLayout, UICollectionViewDataSource,UICollectionViewDelegate{
    
        // Creat Obj From HomeScreen Class..
    var homeRef = HomeScreen()
         init(homev: HomeScreen) {
             homeRef = homev
         }
    
//  func selectedCell(row: Int) {
//     }
    
        
var categories_arr = [Catigory]()
  
//            self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        
         func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let catigories_cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
        
            // Configure the cell
                  //labl...
                  let CatgName: UILabel = (catigories_cell.viewWithTag(1) as! UILabel)
                  CatgName.text = categories_arr[indexPath.row].englishName
                  // moi = CatgName.text
                  //image...
//                   cell.textLabel?.text = "MovieReview\(indexPath.row)"
//                  Create Image From byte Array..
                  let catgimg: UIImageView = catigories_cell.viewWithTag(2) as! UIImageView
                  let finalimg = Helper.convertImage(logo: categories_arr [indexPath.row].logo)
                  catgimg.image = finalimg
            /// round image:
                 catgimg.layer.cornerRadius = catgimg.frame.height/2
                 catgimg.clipsToBounds = true
            let cell_view :UIView = catigories_cell.viewWithTag(54)!
                  cell_view.layer.cornerRadius = 8
            return catigories_cell
        }
    
     func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
              homeRef.selectedCell(row: indexPath.row)

                  print("cell selected")
        Helper.SaveCatgId(Catgid:categories_arr[indexPath.row].id)

                  guard let catid = Helper.GetCatgId() else{
                      return
                  }
                  print("CatgID: \(catid)")
                 
        let vc = homeRef.storyboard?.instantiateViewController(withIdentifier: "storyBoardVC") as! CatgSPs
                  vc.Cimg = Helper.convertImage(logo: categories_arr [indexPath.row].logo)!
                vc.str = categories_arr[indexPath.row].englishName
        homeRef.navigationController?.pushViewController(vc,animated: true)
    }
    
        // return the number of sections()
            func numberOfSections(in collectionView: UICollectionView) -> Int {
             
               return 1
           }
           // return the number of items
         func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return categories_arr.count
      
        }
        ///spce between cells:
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
            return 5
        }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
          return CGSize(width: 90, height: 80)
    }
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
            return CGSize(width: 0, height: 0)
        }
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
            return CGSize(width: 0, height: 0)
        }

//        override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//
//            self.selectedCell(row: indexPath.row)
//            print("cell selectedb")
//            Helper.SaveCatgId(Catgid:Catigories[indexPath.row].id)
//
//            guard let catid = Helper.GetCatgId() else{
//                return
//            }
//            print("CatgID: \(catid)")
//
//
//            let vc = self.storyboard?.instantiateViewController(withIdentifier: "storyBoardVC") as! CatgSPs
//            vc.Cimg = Helper.convertImage(logo: Catigories [indexPath.row].logo)!
//            vc.str = Catigories[indexPath.row].englishName
//            self.navigationController?.pushViewController(vc,animated: true)
//            //
//        }
//        }
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        // Uncomment the following line to preserve selection between presentations
//        // self.clearsSelectionOnViewWillAppear = false
//
//        // Register cell classes
//        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
//
//        // Do any additional setup after loading the view.
//    }
//
//    /*
//    // MARK: - Navigation
//
//    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        // Get the new view controller using [segue destinationViewController].
//        // Pass the selected object to the new view controller.
//    }
//    */
//
//    // MARK: UICollectionViewDataSource
//
//    override func numberOfSections(in collectionView: UICollectionView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }
//
//
//    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        // #warning Incomplete implementation, return the number of items
//        return 0
//    }
//
//    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
//
//        // Configure the cell
//
//        return cell
//    }

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
