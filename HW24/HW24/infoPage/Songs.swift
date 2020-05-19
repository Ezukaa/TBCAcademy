//
//  Songs.swift
//  HW24
//
//  Created by Macintosh HD on 5/19/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import Foundation

struct SongsResponse: Codable {
    let data: [Datum]
}

// MARK: - Datum
struct Datum: Codable {
    let band: String
    let songs: [Song]
}

// MARK: - Song
struct Song: Codable {
    let title: String
}
struct Sooong {
    let QI:String
}
