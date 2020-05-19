//
//  infoPage.swift
//  HW24
//
//  Created by Macintosh HD on 5/19/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

class infoPage: UIViewController {
    //kide sheidzleba saxelebis gamowodeba da ifit shemowmeba magram index ufro martivia
    @IBOutlet weak var tableView: UITableView!
    var index:Int?
    var info:String?
    var artist:String?
    var songs = [Song]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(infoPageCell.nib(), forCellReuseIdentifier: infoPageCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
        
        let songInfo = Song(title: info ?? "NO INFO")
        songs.append(songInfo)
        
        
        getSongs()
    }
    
    func getSongs(){
        let url = URL(string: "http://www.mocky.io/v2/5ec3ca1c300000e5b039c407")!
        URLSession.shared.dataTask(with: url){ (data,res,err) in
            guard let data = data else{return}
            
            do{
                let decode = JSONDecoder()
                let usersResponse = try decode.decode(SongsResponse.self, from: data)
                
                self.songs += usersResponse.data[self.index!].songs
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                
            }catch{print(error.localizedDescription)}
            
        }.resume()
        
    }
    func showAlert(title:String,message:String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        self.present(alert,animated: true)
    }

    

}


extension infoPage:UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            showAlert(title: "Careful!", message: "This isn't a song")
        }
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let lyricsPage = storyboard.instantiateViewController(withIdentifier: PageId.lyricsPage) as! lyricsPage
        lyricsPage.artist = self.artist ?? ""
        lyricsPage.songTitle = songs[indexPath.row].title
        self.navigationController?.pushViewController(lyricsPage, animated: true)
    }

     
    
}
extension infoPage:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: infoPageCell.identifier, for: indexPath) as! infoPageCell
        cell.myTextLabel?.text = songs[indexPath.row].title
        return cell
    }
    
    
}
