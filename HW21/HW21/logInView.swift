//
//  logInView.swift
//  HW21
//
//  Created by Macintosh HD on 5/14/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit
import CoreData
class logInView: UIViewController {
    @IBOutlet weak var emailCheck: UITextField!
    @IBOutlet weak var passwordCheck: UITextField!
    var result = [RegisteredUser]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        fetch()
    }
    
    @IBAction func onLogInTap(_ sender: Any) {
        result.forEach({
            if $0.email == emailCheck.text && $0.password == passwordCheck.text{
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let mainPage = storyboard.instantiateViewController(withIdentifier: "MainPage")
                print($0.index(ofAccessibilityElement: $0))
                
                
                //self.navigationController?.pushViewController(mainPage, animated: true)
            }
        })
    }
    
    func fetch(){
        let context = AppDelegate.CoreDataContainer.viewContext
        let request:NSFetchRequest<RegisteredUser> = RegisteredUser.fetchRequest()
        
        do{
             result = try context.fetch(request)
            
        }catch{}
    }

}
