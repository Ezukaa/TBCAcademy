//
//  APIService.swift
//  Wandio
//
//  Created by Macintosh HD on 9/22/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import Foundation
import UIKit
struct GameDetailedResponse: Codable {
    let matchID: Int
    let duration, firstBloodTime, gameMode: Int
    let direScore: Int
    let radiantScore: Int
    let radiantWin: Bool
//    let direTeamID: Int
    let radiantTeam, direTeam: Team?

    enum CodingKeys: String, CodingKey {
        case matchID = "match_id"
        case firstBloodTime = "first_blood_time"
        case gameMode = "game_mode"
        case duration
        case direScore = "dire_score"
        case radiantScore = "radiant_score"
        case radiantWin = "radiant_win"
//        case direTeamID = "dire_team_id"
        case radiantTeam = "radiant_team"
        case direTeam = "dire_team"
    }
    

    
}
struct Team: Codable {
    let teamID: Int
    let name, tag: String
    let logoURL: String

    enum CodingKeys: String, CodingKey {
        case teamID = "team_id"
        case name, tag
        case logoURL = "logo_url"
    }
}

extension String{
    func downloadImage(completion: @escaping(UIImage?)->()){
        guard let url = URL(string: self) else{return}
        URLSession.shared.dataTask(with: url){(data,res,err)in
            guard let data = data else{return}
            completion(UIImage(data: data))
            }.resume()
    }
}




struct JSONParse {

    private init(){}

    static let Shared = JSONParse()

    func parseJson<T:Codable>(id:String,result: @escaping (T)->()){

        let url = URL(string: "https://api.opendota.com/api//\(id)")!
        URLSession.shared.dataTask(with: url){(data,res,err) in
            guard let data = data else {return}
            do{
                let decoder = JSONDecoder()
                let parsedJSON = try decoder.decode(T.self,from: data)

                result(parsedJSON)

            }catch {print("EEE")}
            }.resume()

    }

}

struct TeamDetailedResponse: Codable {
    let teamID: Int
    let rating: Double
    let wins, losses, lastMatchTime: Int
    let name, tag: String
    let logoURL: String
    
    enum CodingKeys: String, CodingKey {
        case teamID = "team_id"
        case rating, wins, losses
        case lastMatchTime = "last_match_time"
        case name, tag
        case logoURL = "logo_url"
    }
}


