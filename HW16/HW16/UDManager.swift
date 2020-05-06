//
//  UDManager.swift
//  HW16
//
//  Created by Macintosh HD on 5/6/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import Foundation

class UDManager{
    internal static let KEY_FIRST_NAME = "KEY_FIRST_NAME"
    internal static let KEY_Password = "KEY_Password"
    internal static let KEY_EMAIL = "KEY_EMAIL"
    internal static let KEY_BACK_COLOR = "KEY_BACK_COLOR"
    internal static let KEY_SAVE_MESSAGE = "KEY_SAVE_MESSAGE"
    internal static let KEY_IS_ON_MainPage = "KEY_IS_ON_MainPage"
    
    static func getUD() -> UserDefaults {
        return UserDefaults.standard
    }
    
    //-------FIRST AND Password AND EMAIL------------
    
    static func saveFirstName(value:String){
        getUD().set(value, forKey: KEY_FIRST_NAME)
    }
    static func savePassword(value:String){
        getUD().set(value, forKey: KEY_Password)
    }
    static func saveEmail(value:String){
        getUD().set(value, forKey: KEY_EMAIL)
    }
    static func saveBackColor(value:String){
        getUD().set(value, forKey: KEY_BACK_COLOR)
    }
    static func saveMessage(value:String){
        getUD().set(value, forKey: KEY_SAVE_MESSAGE)
    }
    static func isOnMainPageTrue(){
        getUD().set(true, forKey: KEY_IS_ON_MainPage)
    }
    static func isOnMainPageFalse(){
        getUD().set(false, forKey: KEY_IS_ON_MainPage)
    }
    
    
    static func getFirstName()-> String{
        return getUD().string(forKey: KEY_FIRST_NAME) ?? ""
    }
    static func getPassword()-> String{
        return getUD().string(forKey: KEY_Password) ?? ""
    }
    static func getEmail()-> String{
        return getUD().string(forKey: KEY_EMAIL) ?? ""
    }
    static func getBackColor()->String{
        return getUD().string(forKey: KEY_BACK_COLOR) ?? ""
    }
    static func getSavedMessage()->String{
        return getUD().string(forKey: KEY_SAVE_MESSAGE) ?? ""
    }
    static func getIsOnMainPage() -> Bool{
        return getUD().bool(forKey: KEY_IS_ON_MainPage)
    }
    
    
    
    
    //---------GG BUFFON-------------------
    
    
    
    
    
    
    
 
    
    
}
