//
//  MyTabBarController.swift
//  HW17
//
//  Created by Macintosh HD on 5/7/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

class MyTabBarController: UITabBarController {
    var newSelectedIndex:Int?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        if !UDManager.getFirstJoin(){
            self.selectedIndex = 1
            UDManager.setFirstJoinTrue()
        }else{
            self.selectedIndex = UDManager.getSelectedIndex()
        }
    }
}

extension MyTabBarController:UITabBarControllerDelegate{
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        UDManager.setSelectedIndex(value: self.selectedIndex)
        
    }
}

