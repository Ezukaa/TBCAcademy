//
//  myTabBar.swift
//  HW41-v2
//
//  Created by Macintosh HD on 6/16/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

class myTabBar: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

          self.tabBar.tintColor = UIColor(red: 185/255, green: 136/255, blue: 117/255, alpha: 1)

        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc1 = storyboard.instantiateViewController(withIdentifier: "firstPage")
        

        vc1.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "home"), tag: 0)
        
        let vc2 = UIViewController()
        vc2.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "location"), tag: 1)
        vc2.view.backgroundColor = .white
        let vc3 = UIViewController()
        vc3.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "buy"), tag: 2)
        vc3.view.backgroundColor = .red
        let vc4 = UIViewController()
        vc4.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "acc"), tag: 3)
        vc4.view.backgroundColor = .green
        
        
        let tabBarList = [vc1,vc2,vc3,vc4]
        
        viewControllers = tabBarList
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
