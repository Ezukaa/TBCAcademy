//
//  RegViewController.swift
//  HW16
//
//  Created by Macintosh HD on 5/6/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

class RegViewController: UIViewController {
    @IBOutlet weak var reg_mail_field: UITextField!
    @IBOutlet weak var reg_name_field: UITextField!
    @IBOutlet weak var reg_pass_field: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    

    @IBAction func onRegister(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let mainPage = storyboard.instantiateViewController(withIdentifier: "ViewControllerID")
        
        if reg_mail_field.text == "" || reg_name_field.text == "" || reg_pass_field.text == ""{
            LoginViewController.showAlert(title: "Error", message: "შეავსე ბოლომდე", newSelf: self)
        }else{
            UDManager.saveFirstName(value: reg_name_field.text ?? "")
            UDManager.savePassword(value: reg_pass_field.text ?? "")
            UDManager.saveEmail(value: reg_mail_field.text ?? "")
        }
    
        
        print(UDManager.getEmail())
        print(UDManager.getFirstName())
        print(UDManager.getPassword())
        
        self.navigationController?.pushViewController(mainPage, animated: true)
    }
    

    

}
