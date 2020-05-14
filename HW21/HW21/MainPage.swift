//
//  MainPage.swift
//  HW21
//
//  Created by Macintosh HD on 5/14/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit
import CoreData

class MainPage: UIViewController {
    @IBOutlet weak var changeEmail: UITextField!
    @IBOutlet weak var changePass: UITextField!
    var arrayOfUsers = [RegisteredUser]()
    let indexToDlete = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onDeleteTap(_ sender: UIButton) {
        let context = AppDelegate.CoreDataContainer.viewContext
        let request:NSFetchRequest<RegisteredUser> = RegisteredUser.fetchRequest()
        
        
        
            let result = try! context.fetch(request)
            arrayOfUsers = result
        
        for obj in result {
            context.delete(obj)
        }

        do {
            try context.save()
        } catch {}
    }
    
    @IBAction func onChangeTap(_ sender: UIButton) {
    }
    
 

}
