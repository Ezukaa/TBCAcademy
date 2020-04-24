//
//  ViewController.swift
//  HW8-1
//
//  Created by Macintosh HD on 4/24/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var passWord: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBAction func signIn(_ sender: UIButton) {
        let alert = UIAlertController(title: "TBC", message: "წარმატებით დარეგისტრირდით", preferredStyle: .alert)
        let passed = UIAlertAction(title: "გაგრძელება", style: .cancel, handler: nil)
        alert.addAction(passed)
        
        let alertBad = UIAlertController(title: "TBC", message: "ვერ დარეგისტრირდით",preferredStyle: .alert)
        alertBad.addAction(passed)


        guard let userNameString = userName.text else{
            self.present(alertBad, animated: true, completion: nil)
            return
        }
        guard let passWordString = passWord.text else{
            self.present(alertBad, animated: true, completion: nil)
            return
        }


        if userNameString.contains("@") && passWordString.count > 8 {
            self.present(alert, animated: true, completion: nil)
        }
        else{
            self.present(alertBad, animated: true, completion: nil)

        }
        
        
        
        
        
        }
    
        
    }
    



