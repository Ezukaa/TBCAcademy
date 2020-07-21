//
//  JSONParse.swift
//  FinalProject
//
//  Created by Macintosh HD on 7/5/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import Foundation
import UIKit


struct JSONParse {
    
    private init(){}
    
    static let Shared = JSONParse()
    
    func parseJson<T:Codable>(result: @escaping (T)->()){

        let url = URL(string: "https://run.mocky.io/v3/436f1d81-9932-4049-be41-07cadd49eadc")!
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


extension String{
    func downloadImage(completion: @escaping(UIImage?)->()){
        guard let url = URL(string: self) else{return}
        URLSession.shared.dataTask(with: url){(data,res,err)in
            guard let data = data else{return}
            completion(UIImage(data: data))
        }.resume()
    }
}
