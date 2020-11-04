//
//  Extra Informations.swift
//  Omit_User
//
//  Created by shimaa alwaney on 6/17/20.
//  Copyright © 2020 Shimaa Alwaney. All rights reserved.
//

import Foundation
//  *  *   *   *   *   *    Changing transitions type When using Navigation Controller   *  *   *   *   *   *

//        let transition:CATransition = CATransition()
//        transition.duration = 0.5
//        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
//        transition.type = CATransitionType.push
//        transition.subtype = CATransitionSubtype.fromTop
//        self.navigationController!.view.layer.add(transition, forKey: kCATransition)

//*   *   *  *   *   *   *   *   *    *   *   *  *   *   *   *   *   *    *   *   *  *   *   *   *   *   *  *   *//
//Comment  *   *   *  *   *   *   *   *   *   type of transition you can use are   *   *   *  *   *   *   *   *   *

//kCATransitionFromLeft
//kCATransitionFromBottom
//kCATransitionFromRight
//kCATransitionFromTop

//*   *   *  *   *   *   *   *   *    *   *   *  *   *   *   *   *   *    *   *   *  *   *   *   *   *   *  *   *//

//Comment    To push To specific View Controller Using  Navigation Controller
//let ut = self.storyboard? .instantiateViewController(withIdentifier: "ft")as! FinalTicket
//        self.navigationController?.pushViewController(ut,animated: true)

//*   *   *  *   *   *   *   *   *    *   *   *  *   *   *   *   *   *    *   *   *  *   *   *   *   *   *  *   *//

//Comment //  To pop(back) To specific View Controller Using  Navigation Controller//write the index number of the view i want go to it// the rootview's index number is [o]

//                  *   *   *  *   *   *   *   *   * USE *   *   *  *   *   *   *   *   *
//let controllers : Array = self.navigationController!.viewControllers
//self.navigationController!.popToViewController(controllers[1], animated: true)

//                  *   *   *  *   *   *   *   *   * OR *   *   *  *   *   *   *   *   *
// self.navigationController!.popToViewController(self.navigationController!.viewControllers[0] as UIViewController, animated: true)

//*   *   *  *   *   *   *   *   *    *   *   *  *   *   *   *   *   *    *   *   *  *   *   *   *   *   *  *   *//

