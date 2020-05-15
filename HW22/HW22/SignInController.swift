//
//  ViewController.swift
//  HW22
//
//  Created by Macintosh HD on 5/15/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit
import CoreData

class SignInController: UIViewController {
    @IBOutlet weak var userNameFiled: UITextField!
    @IBOutlet weak var userPasswordField: UITextField!
    var arrayOfUser = [Reg_User]()
    
    var user:Reg_User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        super .viewWillAppear(true)
        fetchUserData()
    }
    
    func fetchUserData(){
        let context = AppDelegate.coreDataContainer.viewContext
        let request:NSFetchRequest<Reg_User> = Reg_User.fetchRequest()
        
        do{
            let result = try context.fetch(request)
            arrayOfUser = result
            
        }catch{}
    }
    
    @IBAction func onSignIn(_ sender: UIButton) {
        arrayOfUser.forEach({
            if $0.userName == userNameFiled.text && $0.userPassword == userPasswordField.text{
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let mainPage = storyboard.instantiateViewController(withIdentifier: "HomePageController") as! HomePageController
                //mainPage.enteredUser = "AAA"
                mainPage.enteredUser = $0
                
                
                
                self.navigationController?.pushViewController(mainPage, animated: true)
            }
            
        })
    }
    


}

