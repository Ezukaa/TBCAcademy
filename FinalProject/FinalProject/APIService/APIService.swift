//
//  APIService.swift
//  FinalProject
//
//  Created by Macintosh HD on 7/5/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import Foundation

struct JobsDetailedResponseElement: Codable {
    let name, lastName: String
    let rating: Int
    let latitude, longitude: Double
    let intro, job: String
    let image: String
}

typealias JobsDetailedResponse = [JobsDetailedResponseElement]
