//
//  jSON.swift
//  paraskevi
//
//  Created by Macintosh HD on 6/12/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import Foundation

struct HouseResponse:Codable{
    let properties: [Property]
}

struct Property:Codable {
    let address: Address
    let beds: Int?
    let bathsFull, baths: Int?
    let buildingSize: Size?
    let agents: [Agent]
}

struct Address:Codable {
    let city: String?

}

struct Size:Codable {
    let size: Int
    let units: String
}

struct Agent:Codable {
    let name: String
}
