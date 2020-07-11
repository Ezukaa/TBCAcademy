//
//  ViewController.swift
//  Final_Settings
//
//  Created by Macintosh HD on 7/8/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var settingsTopView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        settingsTopView.roundCorners(corners: [.bottomLeft, .bottomRight], radius: 24)

        
    }


}

extension UIView {
    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
}

