//
//  ViewController.swift
//  HW27
//
//  Created by Macintosh HD on 5/25/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var safeButton = DispatchQueue(label: "")

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

    func isPrime(_ number: Int) -> Bool {
        return number > 1 && !(2..<number).contains { number % $0 == 0 }
    }
    func printNumbers(){
        for i in 0...100000{
            if isPrime(i){
                print(i)
            }
        }
    }
    
    
    @IBAction func onButton(_ sender: UIButton) {
        
            let queue = DispatchQueue(label: "")
            queue.async {
                self.safeButton.sync {
                self.printNumbers()
                }
        }
        
        
    }
}

