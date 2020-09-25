//
//  TeamViewController.swift
//  Wandio
//
//  Created by Macintosh HD on 9/24/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

class TeamViewController: UIViewController {

    @IBOutlet weak var rating: UILabel!
    @IBOutlet weak var win: UILabel!
    @IBOutlet weak var loose: UILabel!
    @IBOutlet weak var lastMatchTime: UILabel!
    @IBOutlet weak var name: UILabel!
    var teamID:String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        JSONParse.Shared.parseJson(id: teamID!) { (teamInfo:TeamDetailedResponse) in
            DispatchQueue.main.async {
                self.rating.text        = "Rating: \(teamInfo.rating)"
                self.win.text           = "Win: \(teamInfo.wins)"
                self.loose.text         = "Loose: \(teamInfo.losses)"
                self.lastMatchTime.text = "LMT: \(teamInfo.lastMatchTime)"
                self.name.text          = "Name: \(teamInfo.name)"
                print(teamInfo.lastMatchTime)
            }
        }

        
    }
    


}
