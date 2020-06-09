//
//  ViewController.swift
//  HW35
//
//  Created by Macintosh HD on 6/7/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit
import ShimmerSwift

class ViewController: UIViewController {
    @IBOutlet weak var but: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("shemovida")
        
        let shimmerView = ShimmeringView(frame: CGRect(x: but.frame.origin.x, y: but.frame.origin.y, width: but.frame.width, height: but.frame.height))
        
        
        view.addSubview(shimmerView)
        shimmerView.contentView = but
        
        shimmerView.isShimmering = true
        
    }


}

