//
//  AddFolder.swift
//  HW19
//
//  Created by Macintosh HD on 5/11/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit
protocol passDataToFirst {
    func passDirectory(folder:String)
}

class AddFolder: UIViewController {
    static let identifier = "AddFolder"
    @IBOutlet weak var folderNameField: UITextField!
    
    var directoryProtocol:passDataToFirst?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    

    @IBAction func onAddFolder(_ sender: UIButton) {
//        let cfm = CustomFileManager.shared
//        let folderName = folderNameField.text ?? ""
//        if !cfm.dirExists(dir: folderName){
//        cfm.createDirectory(name: folderName)
        
        //ALERT IS NEEDED
        let folder = folderNameField.text ?? ""
        directoryProtocol?.passDirectory(folder: folder)
        }
    
        
        
        
        
    }
    


