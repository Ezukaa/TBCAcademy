//
//  ViewController.swift
//  HW11
//
//  Created by Macintosh HD on 4/29/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var userNameField: UITextField!
    @IBOutlet weak var userLastNameField: UITextField!
    @IBOutlet weak var userEmailField: UITextField!
    @IBOutlet weak var userGenderField: UISegmentedControl!
    
    
    var users = [User]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBAction func reisterButton(_ sender: Any) {
        createUser()
    }
    
    
    func createUser() {
        guard let userName = userNameField.text else{return}
        guard let userLastName = userLastNameField.text else{return}
        guard let userEmail = userEmailField.text else{return}
        
        let user = User(name:userName, lName: userLastName, email: userEmail, gender: userGenderField.selectedSegmentIndex)
        users.append(user)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier{
            if identifier == "segue_to_users_page"{
                if let destination = segue.destination as? RegUserViewController{
                    destination.users = self.users
                }
            }
        }
    }
    

}













class User{
    let name:String
    let lName:String
    let email:String
    let gender:Int
    
    init(name:String, lName:String, email:String, gender:Int){
        self.name = name
        self.lName = lName
        self.email = email
        self.gender = gender
    }
}

