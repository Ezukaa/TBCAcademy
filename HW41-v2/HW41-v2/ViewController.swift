//
//  ViewController.swift
//  HW41-v2
//
//  Created by Macintosh HD on 6/16/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit
import Localize

class ViewController: UIViewController {
    
    var coffeeArray = ["Espresso","Cappuccino","Macchiato","Mocha","Latte"]
    var coffeImage = [UIImage(named: "Espresso"),UIImage(named: "cappu"),UIImage(named: "macch"),UIImage(named: "Mocha"),UIImage(named: "latte")]
    
    var everyDisplayedObjec:[CellInfo] = []
    
    
    @IBOutlet weak var coloredLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(myCell.nib(), forCellReuseIdentifier: myCell.identifier)
        tableView.backgroundColor = .clear
        tableView.separatorColor = .clear
        
        
        let myString:NSString = "It's Great Day for Coffee."
        var myMutableString = NSMutableAttributedString()
        
        myMutableString = NSMutableAttributedString(string: myString as String, attributes: [NSAttributedString.Key.font:UIFont(name: "Georgia", size: 33)!])
        myMutableString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor(red: 185/255, green: 136/255, blue: 117/255, alpha: 1), range: NSRange(location:11,length:myString.length-11))
        
        coloredLabel.attributedText = myMutableString
        
        
        
        //MVVM -- axla kovlad usargebloa mainc arafers ar itvlidan view :D
        for i in 0..<coffeeArray.count{
            everyDisplayedObjec.append(CellInfo(a: coffeeArray[i], b: coffeImage[i]!))
        }
        
    }


}

extension ViewController:UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return everyDisplayedObjec.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: myCell.identifier, for: indexPath) as! myCell
        cell.displayedObject = everyDisplayedObjec[indexPath.row]
        
        return cell
    }

    
}



