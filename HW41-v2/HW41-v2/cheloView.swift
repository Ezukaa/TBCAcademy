//
//  cheloView.swift
//  HW41-v2
//
//  Created by Macintosh HD on 6/16/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

class cheloView: UIViewController {
    
    @IBOutlet weak var customTabBar: UIView!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet var buttons:[UIButton]!
    var homeViewController: UIViewController!
    var searchViewController: UIViewController!
    var accountViewController: UIViewController!
    
    var viewControllers:[UIViewController]!
    var selectedIndex = 0
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        homeViewController = storyboard.instantiateViewController(withIdentifier: "firstPage")
        searchViewController = storyboard.instantiateViewController(withIdentifier: "SecondMainPage")
        accountViewController = storyboard.instantiateViewController(withIdentifier: "iveri")
        
        viewControllers = [homeViewController,searchViewController,accountViewController]


        buttons[selectedIndex].isSelected = true
        pressButton(buttons[selectedIndex])
        
        customTabBar.layer.maskedCorners=[.layerMinXMinYCorner,.layerMaxXMinYCorner]
        customTabBar.layer.cornerRadius = 40
        
    }
    

    @IBAction func pressButton(_ sender: UIButton) {
        let previousIndex = selectedIndex
        selectedIndex = sender.tag
        buttons[previousIndex].isSelected = false
        sender.isSelected = true
        let previousVC = viewControllers[previousIndex]
        previousVC.willMove(toParent: nil)
        previousVC.view.removeFromSuperview()
        previousVC.removeFromParent()
        
        let vc = viewControllers[selectedIndex]
        addChild(vc)
        vc.view.frame = contentView.bounds
        contentView.addSubview(vc.view)
        vc.didMove(toParent: self)


    }
    

}
