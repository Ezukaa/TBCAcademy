//
//  LogInViewController.swift
//  Davaleba10
//
//  Created by Macintosh HD on 4/28/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

class LogInViewController: UIViewController {
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func signInButton(_ sender: UIButton) {
        navigateToMainInterface()
    }
    
    private func navigateToMainInterface(){
        let mainStoryBoard = UIStoryboard(name: "Main", bundle: Bundle.main)
        guard let mainNavigationVC = mainStoryBoard.instantiateViewController(withIdentifier: "MainNavigationViewController") as? MainNavigationViewController else{
            return
        }
        present(mainNavigationVC,animated: true,completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

