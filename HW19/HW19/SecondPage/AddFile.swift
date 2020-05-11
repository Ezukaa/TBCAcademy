//
//  AddFile.swift
//  HW19
//
//  Created by Macintosh HD on 5/11/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

class AddFile: UIViewController {
    @IBOutlet weak var textField: UITextView!
    @IBOutlet weak var nameField: UITextField!
    var folder:String?
    var fileToEdit:String?
    
    @IBOutlet weak var buttonTitle: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonTitle.setTitle("Add", for: .normal)
        if fileToEdit != nil{
            nameField.isUserInteractionEnabled = false
            buttonTitle.setTitle("Edit", for: .normal)
            let file = fileToEdit ?? ""
            nameField.text = file.components(separatedBy: ".")[0]
            
            
            
            
        }
        
    }
    
    @IBAction func onFileAdd(_ sender: UIButton) {
        let cfm = CustomFileManager.shared
        cfm.addFile(text: textField.text ?? "", name: nameField.text ?? "",folder: folder ?? "" )
        if fileToEdit != nil{
            self.navigationController?.popViewController(animated: true)
        }
    }
    

}
