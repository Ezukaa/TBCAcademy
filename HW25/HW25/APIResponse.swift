//
//  APIResponse.swift
//  HW25
//
//  Created by Macintosh HD on 5/20/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import Foundation

struct CountriesResponse: Codable {
    let name:String
    let capital:String
    let currencies:[Currency]
    let borders:[String]

}

struct Currency: Codable {
    let code, name, symbol: String?
}



struct APIResponse {
    func getCountryInfo(countryName:String, completion: @escaping ([CountriesResponse])->()){
        
        guard let url = URL(string: "https://restcountries.eu/rest/v2/name/\(countryName)") else{return}
        
    URLSession.shared.dataTask(with: url){(data,res,err) in
        guard let data = data else{return}
        
        do{
            let decoder = JSONDecoder()
            let response = try decoder.decode([CountriesResponse].self, from: data)
            
            completion(response)
            
        }catch{print(error.localizedDescription)}
        
        
        }.resume()
}
    func getCountryInfo2(countryName:String, completion: @escaping ([CountriesResponse])->()){
        
        guard let url = URL(string: "https://restcountries.eu/rest/v2/capital/\(countryName)") else{return}
        
        URLSession.shared.dataTask(with: url){(data,res,err) in
            guard let data = data else{return}
            
            do{
                let decoder = JSONDecoder()
                let response = try decoder.decode([CountriesResponse].self, from: data)
                
                completion(response)
                
            }catch{
                completion([])
                print(error.localizedDescription)}
            
            
            }.resume()
    }
    func statusCode(countryName:String, completion: @escaping ([CountriesResponse])->()){
        guard let url = URL(string: "https://restcountries.eu/rest/v2/name/\(countryName)") else{return}
        let request = URLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: request) {data, response, error in
            
            guard let response = response as? HTTPURLResponse else{return}
            
            if response.statusCode == 200{
                self.getCountryInfo(countryName: countryName, completion: { (countries) in
                    completion(countries)
                })
            }else{
                self.getCountryInfo2(countryName: countryName, completion: { (countries) in
                    completion(countries)
                })
            }
            
            
            
        }
        task.resume()
}
}


