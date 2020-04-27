//
//  ViewController.swift
//  HW9
//
//  Created by Macintosh HD on 4/27/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var saxeli: UITextField!
    @IBOutlet weak var gvari: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var mobile: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBAction func registerUser(_ sender: UIButton) {
        performSegue(withIdentifier: "segue-for_registration", sender: sender)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier{
            if identifier == "segue-for_registration"{
                if let destination = segue.destination as? ViewControllerRegistered{
                    destination.registratedUser = "\(saxeli!)\n \(gvari!)\n \(email!)\n \(mobile!)"
                }
            }
        }
    }
    

}

