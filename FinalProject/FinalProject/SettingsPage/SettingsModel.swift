//
//  SettingsModel.swift
//  FinalProject
//
//  Created by Macintosh HD on 7/8/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import Foundation

import UIKit

class SettingsModel {
    let imageArray:[UIImage]
    let textArray:[String]
    
    init(images:[UIImage], texts:[String]) {
        self.imageArray = images
        self.textArray = texts
    }
}
