//
//  String+Extentions.swift
//  Omit_User
//
//  Created by shimaa alwaney on 5/30/20.
//  Copyright © 2020 Shimaa Alwaney. All rights reserved.
//

import Foundation

extension String {
    
    var trimed: String{
        return self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
}
