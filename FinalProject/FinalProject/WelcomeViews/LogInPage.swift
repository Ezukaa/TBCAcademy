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
    @IBOutlet weak var savePass: UISwitch!
    
    
    @IBOutlet weak var userEmail: UITextField!
    @IBOutlet weak var userPassword: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        savePass.setOn(UDManager.getSavePass(), animated: false)
        
        if savePass.isOn{
        userEmail.text = UDManager.getUserEmail()
        userPassword.text = UDManager.getUserPass()
        }

        onGoogle.layer.cornerRadius = 10
        onFacebook.layer.cornerRadius = 10
        onLogIn.layer.cornerRadius = 10
        
        
    }
    

    @IBAction func goToSignUp(_ sender: UIButton) {
        let storyBaord = UIStoryboard(name: "Authentication", bundle: nil)
        
        
        let signUpPage = storyBaord.instantiateViewController(withIdentifier: "SignUpView")
        self.navigationController?.pushViewController(signUpPage, animated: true)
    }
    
    @IBAction func onUserLogin(_ sender: UIButton) {
        print(#function)
        guard let email = userEmail.text, !email.isEmpty, let password = userPassword.text, !password.isEmpty else{
            showAlert(title: "sheavse", message: "@", currSelf: self)
            return
        }
        
        FirebaseAuth.Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            guard error == nil else{
                // show account creation
                showAlert(title: "ver shevida", message: "email an paroli arasworia", currSelf: self)
                return
            }
   
            if self.savePass.isOn {
                UDManager.setUserPass(userPass: password)
                UDManager.setUserEmail(userEmail: email)
            }
            
            print("shevida")
//            let storyboard = UIStoryboard(name: "Authentication", bundle: nil)
//            let loginView: SignInVC = storyboard.instantiateViewControllerWithIdentifier("SignInVC") as! mainViewController
//            UIApplication.sharedApplication().keyWindow?.rootViewController = loginView
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let mainPage = storyboard.instantiateViewController(withIdentifier: mainTabBarPage)
            
            

            let viewController: UIViewController = storyboard.instantiateViewController(withIdentifier: mainTabBarPage) as! UITabBarController
            UIApplication.shared.keyWindow?.rootViewController = viewController
            

            
            self.navigationController?.pushViewController(mainPage, animated: true)
            
        }
        
        
        
    }
    @IBAction func onGoogleTap(_ sender: Any) {
        
        
    }
    
    @IBAction func savePass(_ sender: UISwitch) {
        UDManager.changeSavePass(state: sender.isOn)
        
    }
}
