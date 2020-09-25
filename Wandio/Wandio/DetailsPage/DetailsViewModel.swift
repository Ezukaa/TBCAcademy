//
//  DetailsViewModel.swift
//  Wandio
//
//  Created by Macintosh HD on 9/23/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import Foundation
import UIKit

struct DetailsViewModel{
    let victorius:String
    let radiantScore:String
    let direScore:String
    let gameDuration:String
    let firstKillTime:String
    let realGameMode:String
    let direName:String
    let radiantName:String
    let radiantImage:String?
    let direImage:String?
    let direID:Int
    let radiantID:Int
    

    
    
    init(details:GameDetailedResponse) {
        self.victorius      = details.radiantWin ? "Radiant Victory" : "Dire Victory"
        self.radiantScore   = String(details.radiantScore)
        self.direScore      = String(details.direScore)
        
        self.radiantName    = details.radiantTeam?.name ?? "The Radiant"
        self.direName       = details.direTeam?.name ?? "The Dire"
        self.radiantImage   = details.radiantTeam?.logoURL
        self.direImage      = details.direTeam?.logoURL
        self.direID         = details.direTeam?.teamID ?? 0
        self.radiantID      = details.radiantTeam?.teamID ?? 0
        
        
        
        
        

        
                switch details.gameMode {
                case 0:
                    self.realGameMode = "UNKNOWN"
                case 1:
                    self.realGameMode = "All Pick"
                case 2:
                    self.realGameMode = "Captains Mode"
                case 3:
                    self.realGameMode = "Random Draft"
                case 4:
                    self.realGameMode = "Single Draft"
                case 5:
                    self.realGameMode = "All Random"
                case 6:
                    self.realGameMode = "Intro"
                case 7:
                    self.realGameMode = "Diretide"
                case 8:
                    self.realGameMode = "Reverse Captains Mode"
                case 9:
                    self.realGameMode = "Greeviling"
                case 10:
                    self.realGameMode = "Tutorial"
                case 11:
                    self.realGameMode = "Mid Only"
                case 12:
                    self.realGameMode = "Least Played"
                case 13:
                    self.realGameMode = "Limited Heroes"
                case 14:
                    self.realGameMode = "Compendium Matchmaking"
                case 15:
                    self.realGameMode = "Custom"
                case 16:
                    self.realGameMode = "Captains Draft"
                case 17:
                    self.realGameMode = "Balanced Draft"
                case 18:
                    self.realGameMode = "Ability Draft"
                case 19:
                    self.realGameMode = "Event"
                case 20:
                    self.realGameMode = "All Random Death Match"
                case 21:
                    self.realGameMode = "1v1 Mid"
                case 22:
                    self.realGameMode = "All Draft"
                case 23:
                    self.realGameMode = "Trubo"
                case 24:
                    self.realGameMode = "Mutation"
                default:
                    self.realGameMode = "Shegeshala"
                }
        
        var minutes = details.duration % 3600/60
        var seconds = details.duration % 3600%60
        self.gameDuration = "\(minutes) : \(seconds)"
        
        minutes = details.firstBloodTime % 3600/60
        seconds = details.firstBloodTime % 3600%60
        
        self.firstKillTime = "FKT: \(minutes) : \(seconds)"
        
        
        
        
    }
    
    
}



