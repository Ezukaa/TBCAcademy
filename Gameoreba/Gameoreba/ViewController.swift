//
//  ViewController.swift
//  Gameoreba
//
//  Created by Macintosh HD on 9/15/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

protocol Giorig{
    func magari(string: String)
}


class ViewController: UIViewController, Giorig {
    func magari(string: String) {
        print(string)
    }

    

    override func viewDidLoad() {
        super.viewDidLoad()
//        // Do any additional setup after loading the view, typically from a nib.
//        let vc2:UIViewController = ABARAAAAA() as ViewController
        
        present(ABARAAAAA(), animated: true, completion: nil)
    }


}




