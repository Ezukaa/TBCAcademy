//
//  UDManager.swift
//  HW17
//
//  Created by Macintosh HD on 5/7/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import Foundation

class UDManager{
    internal static let KEY_FIRST_JOIN = "KEY_FIRST_JOIN"
    internal static let KEY_SELETCTED_INDEX = "KEY_SELETCTED_INDEX"
    
    static func getUD()->UserDefaults{
        return UserDefaults.standard
    }
    
    
    
    static func setFirstJoinTrue(){
        getUD().set(true, forKey: KEY_FIRST_JOIN)
    }
    static func getFirstJoin()->Bool{
        return getUD().bool(forKey: KEY_FIRST_JOIN)
    }
    
    
    static func setSelectedIndex(value:Int){
        getUD().set(value, forKey: KEY_SELETCTED_INDEX)
    }
    static func getSelectedIndex()->Int{
        return getUD().integer(forKey: KEY_SELETCTED_INDEX)
    }
}
