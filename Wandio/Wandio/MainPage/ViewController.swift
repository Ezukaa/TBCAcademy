//
//  ViewController.swift
//  Wandio
//
//  Created by Macintosh HD on 9/22/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    
    final var recentMatches = [5625868867,
                               5625904068,
                               5625846816,
                               5625873442,
                               5625860305,
                               5589100152,
                               5603016696]

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(RecentGamesTableCell.nib(), forCellReuseIdentifier: RecentGamesTableCell.id)
        
        
        
        
    }


}


extension ViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recentMatches.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: RecentGamesTableCell.id, for: indexPath) as! RecentGamesTableCell
        cell.gameID.text = String(recentMatches[indexPath.row])
        
        return cell
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {


        JSONParse.Shared.parseJson(id: "matches/\(recentMatches[indexPath.row])") { (jsonResponse:GameDetailedResponse) in
            DispatchQueue.main.async {
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let secondPage = storyboard.instantiateViewController(withIdentifier: "DetailedViewController") as! DetailedViewController
                
                let dataToPass = DetailsViewModel(details: jsonResponse)
                secondPage.gameDetailsVM = dataToPass
                
                self.navigationController?.pushViewController(secondPage, animated: true)
            }
        }
        
        
    }

}

