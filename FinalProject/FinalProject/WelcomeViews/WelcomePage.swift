//
//  ViewController.swift
//  FinalProject
//
//  Created by Macintosh HD on 6/21/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

class WelcomePage: UIViewController {
    private let storyBaord = UIStoryboard(name: "Authentication", bundle: nil)
    @IBOutlet weak var onGoogle: UIButton!
    @IBOutlet weak var onFacebook: UIButton!
    @IBOutlet weak var onLogIn: UIButton!
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        onGoogle.layer.cornerRadius = 10
        onFacebook.layer.cornerRadius = 10
        onLogIn.layer.cornerRadius = 10
    }

    @IBAction private func onLoginTap(_ sender: UIButton) {
        
        
        let logInPage = storyBaord.instantiateViewController(withIdentifier: "LogInPage")
        
        self.navigationController?.pushViewController(logInPage, animated: true)
    }
    
    @IBAction private func onSignUoTao(_ sender: UIButton) {
        let signUpPage = storyBaord.instantiateViewController(withIdentifier: "SignUpView")
        
        self.navigationController?.pushViewController(signUpPage, animated: true)
    }
    
}

