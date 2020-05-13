//
//  filterDataPage.swift
//  HW20
//
//  Created by Macintosh HD on 5/13/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit
protocol filterPageProtocol {
    func passTimeOfFilter(totalTime: Int)
}

class filterDataPage: UIViewController {
    @IBOutlet weak var minuteField: UITextField!
    @IBOutlet weak var secondsField: UITextField!
    
    var pFilterProtocol: filterPageProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onFilder(_ sender: UIButton) {
        var totalTime = 0
        totalTime = (Int(minuteField.text ?? "") ?? 0) * 60 + (Int(secondsField.text ?? "") ?? 0)
        
        pFilterProtocol?.passTimeOfFilter(totalTime: totalTime)
        self.navigationController?.popViewController(animated: true)
    }
    
    

}
