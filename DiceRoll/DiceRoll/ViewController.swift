//
//  ViewController.swift
//  DiceRoll
//
//  Created by Macintosh HD on 5/2/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var dice1: UIImageView!
    @IBOutlet weak var dice2: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func gaagore(_ sender: UIButton) {
        var array = [#imageLiteral(resourceName: "dice1"),#imageLiteral(resourceName: "dice2"),#imageLiteral(resourceName: "dice3"),#imageLiteral(resourceName: "dice4"),#imageLiteral(resourceName: "dice5"),#imageLiteral(resourceName: "dice6")]
        //array = array.shuffled()

        dice1.image = array[Int.random(in: 0...5)]
        dice2.image = array.shuffled()[1]

    }
    
}

