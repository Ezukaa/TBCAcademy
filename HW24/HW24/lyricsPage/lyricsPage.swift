//
//  lyricsPage.swift
//  HW24
//
//  Created by Macintosh HD on 5/19/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

class lyricsPage: UIViewController {
    @IBOutlet weak var lyricsText: UILabel!
    var artist = ""
    var songTitle = ""
    var lyrics = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        artist = artist.replacingOccurrences(of: " ", with: "%20")
        songTitle = songTitle.replacingOccurrences(of: " ", with: "%20")
        artist = artist.replacingOccurrences(of: "/", with: "", options: .literal, range: nil)

        print(artist)
        print(songTitle)
        getLyrics()
    }
    
    
    func getLyrics(){
        let url = URL(string: "https://api.lyrics.ovh/v1/\(artist)/\(songTitle)")!
        
        print("https://api.lyrics.ovh/v1/\(artist)/\(songTitle)")
        URLSession.shared.dataTask(with: url){ (data,res,err) in
            guard let data = data else{return}

            do{
                let decoder = JSONDecoder()
                let lyricsResponse = try decoder.decode(Lyrics.self, from: data)
                self.lyrics = lyricsResponse.lyrics
                
                DispatchQueue.main.async {
                    self.lyricsText.text = lyricsResponse.lyrics
                }
                
            }catch{print(error.localizedDescription)}


        }.resume()

    }
    



}
