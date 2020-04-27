//
//  ViewControllerRegistered.swift
//  HW9
//
//  Created by Macintosh HD on 4/27/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

class ViewControllerRegistered: UIViewController {
    var registratedUser: String?
    @IBOutlet weak var registeredUser1: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registeredUser1.text = registratedUser!
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
