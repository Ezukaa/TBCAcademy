//
//  CustomFileManager.swift
//  HW19
//
//  Created by Macintosh HD on 5/11/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import Foundation


class CustomFileManager{
    let fm = FileManager.default
    
    static let shared = CustomFileManager()
    
    private init(){}
    
    
    
    var mainPath: URL {
        return try! fm.url(for: .applicationSupportDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
    }
    
    
    
    func createDirectory(name: String) {
        let newPath = mainPath.appendingPathComponent(name)
        
        do {
            try fm.createDirectory(at: newPath, withIntermediateDirectories: false, attributes: nil)
        } catch let error {
            print(error)
        }
    }
    
    func dirExists(dir: String) -> Bool {
        let url = mainPath.appendingPathComponent(dir)
        var isDirectory = ObjCBool(true)
        let exists = fm.fileExists(atPath: url.absoluteString, isDirectory: &isDirectory)
        return exists && isDirectory.boolValue
    }
    
    func contentsOfURL(url:URL)->[URL]{
        return try! fm.contentsOfDirectory(at: url, includingPropertiesForKeys: nil, options: .skipsHiddenFiles)
    }
    
    
    func filePath(name:String)-> URL{
        let path = mainPath.appendingPathComponent(name)
        return path
    }
    func addFile(text:String,name:String,folder:String){
        let path = mainPath.appendingPathComponent(folder).appendingPathComponent("\(name).txt")
        do{
            try text.write(to: path, atomically: true, encoding: .utf8)
        }catch let err{
            print(err)
        }
    }
    func removeFile(url: URL){
        try! fm.removeItem(at: url)
    }
    
    
    
    
    
}
