//
//  ViewController.swift
//  HW37
//
//  Created by Macintosh HD on 6/9/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var circle: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        drawIt()
        print("shemovida")
    }
    
    func drawIt(){
        let firstCircle = CALayer()
        firstCircle.backgroundColor = UIColor.white.cgColor
        firstCircle.frame = CGRect(x: view.center.x - 50 , y: view.center.y - 50, width: 100, height: 100)
        firstCircle.cornerRadius = 50
        
        let secondCircle = CALayer()
        secondCircle.backgroundColor = UIColor.gray.cgColor
        secondCircle.frame = CGRect(x: view.center.x - 55, y: view.center.y - 55, width: 110, height: 110)
        secondCircle.cornerRadius = 55
        
        let thirdCircle = CALayer()
        thirdCircle.backgroundColor = UIColor.gray.cgColor
        thirdCircle.opacity = 0.5
        thirdCircle.frame = CGRect(x: view.center.x - 70, y: view.center.y - 70, width: 140, height: 140)
        thirdCircle.cornerRadius = 70
        print(view.center)
        print(circle.center)
        
        circle.layer.addSublayer(thirdCircle)
        circle.layer.addSublayer(secondCircle)
        circle.layer.addSublayer(firstCircle)
    }
}

