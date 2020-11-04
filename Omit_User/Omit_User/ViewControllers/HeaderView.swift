//
//  HeaderView.swift
//  Omit_User
//
//  Created by shimaa alwaney on 8/4/20.
//  Copyright © 2020 Shimaa Alwaney. All rights reserved.
//

import UIKit
protocol HeaderDelegate{
   func CellHeader(Idx: Int)
}
class HeaderView: UIView{
    
//     var SecIndx: Int?
//    var delgate : HeaderDelegate?
//override init(frame: CGRect) {
//        super.init(frame: frame)
//        self.addSubview(btn)
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    //F5ECEC
//    lazy var btn: UIButton = {
//        let btn = UIButton(frame: CGRect(x: self.frame.origin.x, y: self.frame.origin.y, width:                    self.frame.width, height: self.frame.height))
//        btn.backgroundColor = hexStringToUIColor(hex: "#F5ECEC")
//        btn.setTitleColor(hexStringToUIColor(hex:"#305E75"), for: .normal)
//        btn.layer.cornerRadius = 11
//        btn.clipsToBounds = true
//        btn.addTarget(self, action:#selector(OnClichHeaderView), for: .touchUpInside)
//        return btn
//    }()
//    @objc func OnClichHeaderView(){
//        if let idx = SecIndx {
//            delgate?.CellHeader(Idx: idx)
//
//            }
//
//     }


}

