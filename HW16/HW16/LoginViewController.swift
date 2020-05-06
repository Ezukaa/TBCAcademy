//
//  LoginViewController.swift
//  HW16
//
//  Created by Macintosh HD on 5/6/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var login_name_field: UITextField!
    @IBOutlet weak var login_pass_field: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print(UDManager.getEmail())
        print(UDManager.getFirstName())
        print(UDManager.getPassword())
        
        if UDManager.getIsOnMainPage(){
            let mainPage = StoryBoard().instantiateViewController(withIdentifier: "ViewControllerID")
            self.navigationController?.pushViewController(mainPage, animated: true)
        }
    }
    
    @IBAction func onLogin(_ sender: UIButton) {
        let mainPage = StoryBoard().instantiateViewController(withIdentifier: "ViewControllerID")
        if(login_pass_field.text == "" || login_name_field.text == ""){
            LoginViewController.showAlert(title: "Error", message: "გთხოვთ ჩაწეროთ რამე", newSelf: self)
        }else if UDManager.getFirstName() != login_name_field.text || UDManager.getPassword() != login_pass_field.text{
            LoginViewController.showAlert(title: "Error", message: "არასწორი პაროლი ან სახელი", newSelf: self)
        }else{
        self.navigationController?.pushViewController(mainPage, animated: true)
        }
    }
    
    @IBAction func onRegister(_ sender: UIButton) {
        let regPage = StoryBoard().instantiateViewController(withIdentifier: "RegViewControllerID")
        
        self.navigationController?.pushViewController(regPage, animated: true)
    }
    
    func StoryBoard()->UIStoryboard{
        return UIStoryboard(name: "Main", bundle: nil)
    }
    
    
    
    static func showAlert(title:String, message:String, newSelf:UIViewController){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "გასაგებია", style: .cancel, handler: nil))
        newSelf.present(alert,animated: true)
    }

}
