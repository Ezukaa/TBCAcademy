//
//  ViewController.swift
//  HW40 - Alert
//
//  Created by Macintosh HD on 6/11/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


    @IBAction func onAlertTap(_ sender: UIButton) {
        let alert = UIAlertController(title: "\n\n", message: "Tony", preferredStyle: .alert)
        
        let ok = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        
        
        
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        imageView.image = #imageLiteral(resourceName: "iron")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        alert.view.addSubview(imageView)
        alert.view.addConstraint(NSLayoutConstraint(item: imageView, attribute: .centerX, relatedBy: .equal, toItem: alert.view, attribute: .centerX, multiplier: 1, constant: 0))
        alert.addAction(ok)
        
    
        
        self.present(alert,animated: true)
        
        
        
    }
}

