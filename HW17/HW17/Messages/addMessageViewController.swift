//
//  addMessageViewController.swift
//  HW17
//
//  Created by Macintosh HD on 5/7/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit
protocol getMessage {
    func returnMessage(messageReturned:Message)
}

class addMessageViewController: UIViewController {
    @IBOutlet weak var nameAndLast: UITextField!
    @IBOutlet weak var newMessage: UITextView!
    
    var delegate : getMessage?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        newMessage.layer.cornerRadius = 5
        newMessage.layer.borderWidth = 1
        newMessage.layer.borderColor = UIColor.black.cgColor
        
    }
    
    @IBAction func onAddMessage(_ sender: UIButton) {
        
        let name = nameAndLast.text ?? ""
        let message = newMessage.text ?? ""
        
        let messageReturned:Message = Message(name:name, message:message)
        delegate?.returnMessage(messageReturned: messageReturned)
    }
    
    

}
