//
//  myAPI.swift
//  Proj_N1_v2
//
//  Created by Macintosh HD on 5/27/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import Foundation

struct JobsResponseElement: Codable {
    let id: String
    let type: TypeEnum
    let url: String
    let createdAt, company: String
    let companyURL: String?
    let location, title, jobsResponseDescription, howToApply: String
    let companyLogo: String?
    
    enum CodingKeys: String, CodingKey {
        case id, type, url
        case createdAt = "created_at"
        case company
        case companyURL = "company_url"
        case location, title
        case jobsResponseDescription = "description"
        case howToApply = "how_to_apply"
        case companyLogo = "company_logo"
    }
}

enum TypeEnum: String, Codable {
    case contract = "Contract"
    case fullTime = "Full Time"
    case partTime = "Part Time"
}

typealias JobsResponse = [JobsResponseElement]




struct APIResponse {
   
    
    mutating func getWholeInfo(completion: @escaping ([JobsResponseElement])->()){
        
        
        guard let url = URL(string: "https://jobs.github.com/positions.json?") else{return}
        
        URLSession.shared.dataTask(with: url){(data,res,err) in
            
            guard let data = data else{return}
            do{
                let decoder = JSONDecoder()
                let response = try decoder.decode([JobsResponseElement].self, from: data)
                
                completion(response)
            }catch{print(error.localizedDescription)}
            }.resume()
        
    }
    
    
    
}

