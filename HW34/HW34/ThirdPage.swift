//
//  ThirdPage.swift
//  HW34
//
//  Created by Macintosh HD on 6/4/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

class ThirdPage: UIViewController {
    @IBOutlet weak var getStarted: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        getStarted.layer.borderWidth = 2
        getStarted.layer.cornerRadius = 6
        getStarted.layer.borderColor = UIColor.init(red: 29/255, green: 36/255, blue: 124/255, alpha: 1).cgColor
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
