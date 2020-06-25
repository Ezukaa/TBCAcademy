//
//  LogInPage.swift
//  FinalProject
//
//  Created by Macintosh HD on 6/21/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit
import FirebaseAuth

class LogInPage: UIViewController {
    

    @IBOutlet weak var onGoogle: UIButton!
    @IBOutlet weak var onFacebook: UIButton!
    @IBOutlet weak var onLogIn: UIButton!
    
    
    @IBOutlet weak var userEmail: UITextField!
    @IBOutlet weak var userPassword: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        onGoogle.layer.cornerRadius = 10
        onFacebook.layer.cornerRadius = 10
        onLogIn.layer.cornerRadius = 10
        
    }
    

    @IBAction func goToSignUp(_ sender: UIButton) {
        let storyBaord = UIStoryboard(name: "Main", bundle: nil)
        
        
        let signUpPage = storyBaord.instantiateViewController(withIdentifier: "SignUpView")
        self.navigationController?.pushViewController(signUpPage, animated: true)
    }
    
    @IBAction func onUserLogin(_ sender: UIButton) {
        
        
    }
}
