//
//  ViewController.swift
//  eleqtroobaAraa
//
//  Created by Macintosh HD on 6/17/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var swiftImage: UIButton!
    @IBOutlet weak var iosImage: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
      
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let position = touch.location(in: view)
            print(position)
        }
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let position = touch.location(in: view)
            print(position)
        }
    }
    
    @IBAction func onIosTap(_ sender: UIButton) {
        print("AA")
    }
    
    @IBAction func osSwiftTap(_ sender: UIButton) {
    }
    
}

