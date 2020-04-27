//
//  ViewController.swift
//  SegueSwavla
//
//  Created by Macintosh HD on 4/27/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var saxeliField: UITextField!
    @IBOutlet weak var gvariField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var mobileField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func registerButton(_ sender: UIButton) {
        performSegue(withIdentifier: "segue_register", sender: sender)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier{
            if identifier == "segue_register" {
                if let destination = segue.destination as? RegisteredUser{
                    destination.saxeli = [saxeliField.text!,gvariField.text!,emailField.text!,mobileField.text!]
                }
            }
        }
    }
    
}

