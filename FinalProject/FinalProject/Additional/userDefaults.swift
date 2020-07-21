//
//  userDefaults.swift
//  FinalProject
//
//  Created by Macintosh HD on 7/5/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import Foundation
import UIKit

class UDManager {
    internal static let KEY_SAVE_PASS = "KEY_SAVE_PASS"
    internal static let KEY_USER_PASS = "KEY_USER_PASS"
    internal static let KEY_USER_Email = "KEY_USER_Email"

    
    static func getUD()->UserDefaults{
        return UserDefaults.standard
    }
    
    
    // KEY_SAVE_PASS
    static func changeSavePass(state:Bool){
//        var current:Bool = getUD().bool(forKey: KEY_SAVE_PASS)
//        current = !current
//       getUD().set(current, forKey: KEY_SAVE_PASS)
        getUD().set(state, forKey: KEY_SAVE_PASS)
    }
    
    static func getSavePass() -> Bool{
        return getUD().bool(forKey: KEY_SAVE_PASS)
    }
    
    // KEY_USER_PASS
    static func setUserPass(userPass:String){
        getUD().set(userPass, forKey: KEY_USER_PASS)
    }
    
    static func getUserPass()->String{
        return getUD().string(forKey: KEY_USER_PASS) ?? ""
    }
    
    // KEY_USER_Email
    static func setUserEmail(userEmail:String){
        getUD().set(userEmail, forKey: KEY_USER_Email)
    }
    
    static func getUserEmail()->String{
        return getUD().string(forKey: KEY_USER_Email) ?? ""
    }
    // USER IMAGE

    
}
