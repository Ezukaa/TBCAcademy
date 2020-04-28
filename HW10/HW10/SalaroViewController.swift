//
//  SalaroViewController.swift
//  HW10
//
//  Created by Macintosh HD on 4/28/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

class SalaroViewController: UIViewController {
    var raodenoma: Int?
    var fasi: Int?
    var allProducts: Set<String>?
    @IBOutlet weak var productsLabel: UILabel!
    @IBOutlet weak var quantityLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        quantityLabel.text = String(raodenoma!)
        priceLabel.text = String(fasi!)
        
        var allItemsFromArray:String = ""
        for item in Array(allProducts!){
            allItemsFromArray+="\(item)  "
        }
        productsLabel.text = allItemsFromArray
    }
    

    
}
