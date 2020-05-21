//
//  ViewController.swift
//  HW26
//
//  Created by Macintosh HD on 5/21/20.
//  Copyright © 2020 TBC. All rights reserved.
//
//          https://i.pinimg.com/originals/22/9d/0a/229d0aff6610b106580e0c95e6386e64.jpg  - FIGHT
//          https://i.pinimg.com/originals/aa/e0/77/aae07716e470a0f48b19c2ccc19d6ff3.jpg - APPLE
//          https://i.insider.com/525ac397ecad044e0bc07620?width=750&format=jpeg&auto=webp - ANDROID

import UIKit
import Kingfisher

class ViewController: UIViewController {
    @IBOutlet weak var firsPageImage: UIImageView!
    @IBOutlet weak var firsPageLabel: UILabel!
    @IBOutlet weak var firsPageButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        firsPageLabel.font = UIFont(name:"HelveticaNeue-Bold", size: 18.0)
        firsPageButton.layer.cornerRadius = 20

     

        
        let url = URL(string: "https://i.pinimg.com/originals/22/9d/0a/229d0aff6610b106580e0c95e6386e64.jpg")
        firsPageImage.kf.setImage(with: url)
        NotificationCenter.default.addObserver(self, selector: #selector(onUserPicked), name: NSNotification.Name("UserPicked"), object: nil)
    }
    
    @objc func onUserPicked(with notification:Notification){
        let selected = notification.userInfo?["selected"] as! Int

        var url:URL
        if selected == 1{
            url = URL(string: "https://i.pinimg.com/originals/aa/e0/77/aae07716e470a0f48b19c2ccc19d6ff3.jpg")!
            firsPageLabel.text = "better choice :)"
        }else{
            url = URL(string: "https://i.insider.com/525ac397ecad044e0bc07620?width=750&format=jpeg&auto=webp")!
            firsPageLabel.text = "nobody is perfect"
        }
        firsPageImage.kf.setImage(with: url )
    }
    
    
    
    
    @IBAction func onButtonTap(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let secondPage = storyboard.instantiateViewController(withIdentifier: "SecondPage")
        self.navigationController?.pushViewController(secondPage, animated: true)
    }
    

}

