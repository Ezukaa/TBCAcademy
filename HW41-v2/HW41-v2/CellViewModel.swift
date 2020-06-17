//
//  CellViewModel.swift
//  HW41-v2
//
//  Created by Macintosh HD on 6/17/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit


struct CellInfo{
    
    var imageDisplayed:UIImage
    var textDisplayed:String
    
    
    init(a:String,b:UIImage) {
        imageDisplayed = b
        textDisplayed = a
    }
    
}
