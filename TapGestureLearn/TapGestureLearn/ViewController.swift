//
//  ViewController.swift
//  TapGestureLearn
//
//  Created by Macintosh HD on 4/28/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var touchLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(kvirili))
        touchLabel.isUserInteractionEnabled = true
        touchLabel.addGestureRecognizer(tapGesture)
    }
    @objc func kvirili(){
        print("zdarova brat!")
    }
    


}

