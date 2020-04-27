//
//  RegisteredUser.swift
//  SegueSwavla
//
//  Created by Macintosh HD on 4/27/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

class RegisteredUser: UIViewController {
    @IBOutlet weak var saxeliLabel: UILabel!
    @IBOutlet weak var gvariLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var mobileLabel: UILabel!
    
    var saxeli: [String]?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let array: [String] = saxeli{
            saxeliLabel.text = array[0]
            gvariLabel.text = array[1]
            emailLabel.text = array[2]
            mobileLabel.text = array[3]
        }
        
        // Do any additional setup after loading the view.
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
