//
//  ViewController.swift
//  HW27
//
//  Created by Macintosh HD on 5/25/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var safeButton: UIButton!
    

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
        let currentColor = self.safeButton.currentTitleColor
        
        self.safeButton.isUserInteractionEnabled = false
        self.safeButton.setTitleColor(.red, for: .normal)
            let queue = DispatchQueue(label: "")
            let group = DispatchGroup()
        queue.async(group:group) {
            
                self.printNumbers()
        }
        group.notify(queue: .main){
            print("morcha")
            self.safeButton.isUserInteractionEnabled = true
            self.safeButton.setTitleColor(currentColor, for: .normal)
        }
        
        
    }
}

