//
//  WeatherAPI.swift
//  HW44
//
//  Created by Macintosh HD on 6/18/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import Foundation

struct WeatherResponse: Codable {
    let coord: Coord
    let weather: [Weather]
    let base: String
    let main: Main
    let visibility: Int
    let wind: Wind
    let clouds: Clouds
    let dt: Int
    let sys: Sys
    let timezone, id: Int
    let name: String
    let cod: Int
}

// MARK: - Clouds
struct Clouds: Codable {
    let all: Int
}

// MARK: - Coord
struct Coord: Codable {
    let lon, lat: Double
}

// MARK: - Main
struct Main: Codable {
    let temp, feelsLike, tempMin, tempMax: Double
    let pressure:Double
    let humidity: Int
    
    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case pressure, humidity
    }
}

// MARK: - Sys
struct Sys: Codable {
    let type, id: Int
    let country: String
    let sunrise, sunset: Int
}

// MARK: - Weather
struct Weather: Codable {
    let id: Int
    let main, weatherDescription, icon: String
    
    enum CodingKeys: String, CodingKey {
        case id, main
        case weatherDescription = "description"
        case icon
    }
}

// MARK: - Wind
struct Wind: Codable {
    let speed: Double
    let deg: Int
}



struct getAPI {
    func parseWeater<T:Codable>(lat:Double,lon:Double)-> T{
        let url = URL(string: "http://api.openweathermap.org/data/2.5/weather?lat=\(lat)&lon=\(lon)&appid=8f20dce1cb8568bef98332f9e23996fc&fbclid=IwAR3DoswZkSaLpdXi3MFsfYESRxbRjGryjTg6ftj3tsVH0om4DAkn3u5QeT8")!
        
        guard let data = try? Data(contentsOf: url)else{
            fatalError("RATOO")
        }
        
        let decode = JSONDecoder()
        
        guard let res = try? decode.decode(T.self, from: data) else{
            fatalError("RATOO1")
        }
        
        return res
        
    }
}
//struct getAPI {
//    func parseWeater<T:Codable>(lat:Double,lon:Double,completion: @escaping (T)->Void ){
//        let url = URL(string: "http://api.openweathermap.org/data/2.5/weather?lat=\(lat)&lon=\(lon)&appid=8f20dce1cb8568bef98332f9e23996fc&fbclid=IwAR3DoswZkSaLpdXi3MFsfYESRxbRjGryjTg6ftj3tsVH0om4DAkn3u5QeT8")!
//        URLSession.shared.dataTask(with: url) { (data, res, err) in
//            guard let data = data else{return}
//
//            do{
//                let decoder = JSONDecoder()
//                let userRseponse = try decoder.decode(T.self, from: data)
//
//
//                completion(userRseponse)
//
//            }
//            catch{print(error)}
//            }.resume()
//    }
//}

