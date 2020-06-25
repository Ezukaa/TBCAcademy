//
//  SignUpView.swift
//  FinalProject
//
//  Created by Macintosh HD on 6/21/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit
import FirebaseAuth

class SignUpView: UIViewController {
    @IBOutlet weak var onGoogle: UIButton!
    @IBOutlet weak var onFacebook: UIButton!
    @IBOutlet weak var onSignUp: UIButton!
    
    @IBOutlet weak var userEmail: UITextField!
    @IBOutlet weak var userPassword: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        onGoogle.layer.cornerRadius = 10
        onFacebook.layer.cornerRadius = 10
        onSignUp.layer.cornerRadius = 10
    }
    

    @IBAction func onLogInTap(_ sender: UIButton) {
        let storyBaord = UIStoryboard(name: "Main", bundle: nil)
        let logInPage = storyBaord.instantiateViewController(withIdentifier: "LogInPage")
        
        self.navigationController?.pushViewController(logInPage, animated: true)

    }
    
    @IBAction func onUserSignUo(_ sender: UIButton) {
        
        guard let email = userEmail.text, !email.isEmpty,
            let password = userPassword.text, !password.isEmpty else {
                print("alert gaakete ro aklia texti")
                return
        }
        
                self.showCreateAccount(email: email,password: password)

        print("daregistrirda")
    }
    
    func showCreateAccount(email:String,password:String){
        let alert = UIAlertController(title: "Create Account", message: "Would you like to create account", preferredStyle: .alert
        )
        alert.addAction(UIAlertAction(title: "Continue", style: .default, handler: { _ in
            FirebaseAuth.Auth.auth().createUser(withEmail: email, password: password, completion: { result,error in

                guard error == nil else{
                    print("ar aketebs")
                    return
                }
                print("shevida")
            })
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: {_ in
            print("ratoo")
        }))
        present(alert,animated: true)
    }
}
