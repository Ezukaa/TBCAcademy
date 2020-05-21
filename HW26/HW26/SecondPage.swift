//
//  SecondPage.swift
//  HW26
//
//  Created by Macintosh HD on 5/21/20.
//  Copyright © 2020 TBC. All rights reserved.
//
//          https://i.pinimg.com/originals/aa/e0/77/aae07716e470a0f48b19c2ccc19d6ff3.jpg - APPLE
//          https://i.insider.com/525ac397ecad044e0bc07620?width=750&format=jpeg&auto=webp - ANDROID

import UIKit

class SecondPage: UIViewController {
    @IBOutlet weak var iosImage: UIImageView!
    @IBOutlet weak var somethingElseImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let iosURL = URL(string: "https://i.pinimg.com/originals/aa/e0/77/aae07716e470a0f48b19c2ccc19d6ff3.jpg")
        let რაღაც = URL(string: "https://i.insider.com/525ac397ecad044e0bc07620?width=750&format=jpeg&auto=webp")
        
        iosImage.kf.setImage(with: iosURL)
        somethingElseImage.kf.setImage(with: რაღაც)
        
        let iosGesture = UITapGestureRecognizer(target: self, action: #selector(iosSelected))
        let androidGesture = UITapGestureRecognizer(target: self, action: #selector(რაღაცSelected))
        iosImage.isUserInteractionEnabled = true
        somethingElseImage.isUserInteractionEnabled = true
        iosImage.addGestureRecognizer(iosGesture)
        somethingElseImage.addGestureRecognizer(androidGesture)
        
    }
    @objc func iosSelected(){
        NotificationCenter.default.post(name: NSNotification.Name("UserPicked"), object: nil, userInfo: ["selected":1])
        self.navigationController?.popViewController(animated: true)
    }
    @objc func რაღაცSelected(){
        NotificationCenter.default.post(name: NSNotification.Name("UserPicked"), object: nil, userInfo: ["selected":2])
        self.navigationController?.popViewController(animated: true)
    }
    
    
    
    

}
