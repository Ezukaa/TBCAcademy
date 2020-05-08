//
//  SecondViewController.swift
//  HW18
//
//  Created by Macintosh HD on 5/8/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit
protocol SecondPageProtocol {
    func sendData(text:String)
}
class SecondViewController: UIViewController {
    @IBOutlet weak var textField: UITextField!
    var secondPGprotocol:SecondPageProtocol? = nil
    var itemToEdit:String?
    
    @IBOutlet weak var buttonName: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if itemToEdit != nil {
            buttonName.setTitle("შეცვლა", for: .normal)
            textField.text = itemToEdit ?? ""
        }else{
            buttonName.setTitle("დამატება", for: .normal)
        }
    }
    
    @IBAction func onTextAdd(_ sender: UIButton) {
            secondPGprotocol?.sendData(text: textField.text ?? "")
    }
    
    
    

}
