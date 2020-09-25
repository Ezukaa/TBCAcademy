//
//  DetailedViewController.swift
//  Wandio
//
//  Created by Macintosh HD on 9/22/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

class DetailedViewController: UIViewController {
    @IBOutlet weak var victorious: UILabel!
    @IBOutlet weak var radiantScore: UILabel!
    @IBOutlet weak var gameDuration: UILabel!
    @IBOutlet weak var direScore: UILabel!
    @IBOutlet weak var firstKillTime: UILabel!
    @IBOutlet weak var gameMode: UILabel!
    @IBOutlet weak var radiantName: UILabel!
    @IBOutlet weak var direName: UILabel!
    @IBOutlet weak var radiantIcon: UIImageView!
    @IBOutlet weak var direIcon: UIImageView!
    var radiantID:Int?
    var direID:Int?
    
    
    var gameDetailsVM:DetailsViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        guard let textToDisplay = gameDetailsVM else{return}
        
        self.victorious.text    = textToDisplay.victorius
        self.radiantScore.text  = textToDisplay.radiantScore
        self.gameDuration.text  = textToDisplay.gameDuration
        self.direScore.text     = textToDisplay.direScore
        self.firstKillTime.text = textToDisplay.firstKillTime
        self.gameMode.text      = textToDisplay.realGameMode
        self.radiantName.text   = textToDisplay.radiantName
        self.direName.text      = textToDisplay.direName
        self.direID             = textToDisplay.direID
        self.radiantID          = textToDisplay.radiantID
        
        if textToDisplay.radiantImage == nil{
            self.radiantIcon.removeFromSuperview()
        }
        if textToDisplay.direImage == nil{
            self.direIcon.removeFromSuperview()
        }
        
        textToDisplay.radiantImage?.downloadImage(completion: { (image) in
            guard let image = image else{return}

            DispatchQueue.main.async {
                self.radiantIcon.image = image
            }
        })
        textToDisplay.direImage?.downloadImage { (image) in
            guard let image = image else{return}
            DispatchQueue.main.async {
                self.direIcon.image = image
            }
        }
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        let radiantTapGesture = UITapGestureRecognizer(target: self, action: #selector(radiantTapGestureHandler))
        let direTapGesture = UITapGestureRecognizer(target: self, action: #selector(direTapGestureHandler))
        
        radiantIcon.isUserInteractionEnabled = true
        radiantIcon.addGestureRecognizer(radiantTapGesture)
        
        direIcon.isUserInteractionEnabled = true
        direIcon.addGestureRecognizer(direTapGesture)
        
        
    }
    
    @objc func radiantTapGestureHandler(){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let teamPage = storyboard.instantiateViewController(withIdentifier: "TeamViewController") as! TeamViewController
        teamPage.teamID = "teams/\(String(radiantID!))"
        
        self.navigationController?.pushViewController(teamPage, animated: true)
    }
    @objc func direTapGestureHandler(){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let teamPage = storyboard.instantiateViewController(withIdentifier: "TeamViewController") as! TeamViewController
        teamPage.teamID = "teams/\(String(direID!))"
        
        self.navigationController?.pushViewController(teamPage, animated: true)
    }
    
    
    


}

