//
//  MVVM.swift
//  HW44
//
//  Created by Macintosh HD on 6/19/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import Foundation

struct სწორად_ვაკეთებ_კითხვაა {
    let countryName:String
    var currTemp:String
    var skyCondition: String
    var humidity: String
    var pressure: String
    var maxTemp: String
    var minTemp: String
    
    
    init(displayInfo:WeatherResponse) {
                self.countryName = displayInfo.name
                self.currTemp = "\(displayInfo.main.temp)℃"
                self.skyCondition = displayInfo.weather[0].weatherDescription.uppercased()
        self.humidity = "Humidity: \(displayInfo.main.humidity) %"
        self.pressure = "Pressure: \(displayInfo.main.pressure)"
        self.maxTemp = "Maximum Temp: \(displayInfo.main.tempMax)℃"
        self.minTemp = "Minumum Temp: \(displayInfo.main.tempMin)℃"
    }
}
