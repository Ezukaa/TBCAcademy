//
//  readMessage.swift
//  HW17
//
//  Created by Macintosh HD on 5/7/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

class readMessage: UIViewController {
    @IBOutlet weak var fullMessage: UITextView!
    var message:String = "Default"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fullMessage.text = message
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
