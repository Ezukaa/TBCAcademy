//
//  File.swift
//  HW24
//
//  Created by Macintosh HD on 5/19/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import Foundation


struct BandsResponse: Codable {
    let bands: [Band]
}

// MARK: - Band
struct Band: Codable {
    let name: String
    let imgURL, thumb1, thumb2, thumb3: String
    let info, genre: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case imgURL = "img_url"
        case thumb1, thumb2, thumb3, info, genre
    }
}
