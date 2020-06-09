//
//  Pages.swift
//  HW36
//
//  Created by Macintosh HD on 6/8/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import Foundation
import UIKit

struct Pages {
    let imageNamed: String
    let title: String
    let text: String
    
    var image: UIImage? {
        return UIImage(named: imageNamed)
    }
}
