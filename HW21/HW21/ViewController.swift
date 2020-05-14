//
//  ViewController.swift
//  HW21
//
//  Created by Macintosh HD on 5/14/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    @IBOutlet weak var createEmail: UITextField!
    @IBOutlet weak var createPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func save(){
        let context = AppDelegate.CoreDataContainer.viewContext
        let entityDescription = NSEntityDescription.entity(forEntityName: "RegisteredUser", in: context)
        let registeredUser = RegisteredUser(entity: entityDescription!,insertInto:context)
        registeredUser.email = createEmail.text ?? ""
        registeredUser.password = createPassword.text ?? ""
        do{
            try context.save()
            print("SAVED!")
        }catch{}
    
    }

    @IBAction func onRegisterTap(_ sender: UIButton) {
        save()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let loginPage = storyboard.instantiateViewController(withIdentifier: "logInView")
        
        self.navigationController?.pushViewController(loginPage, animated: true)
    }
    
}

