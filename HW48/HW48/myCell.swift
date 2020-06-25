//
//  myCell.swift
//  HW48
//
//  Created by Macintosh HD on 6/25/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

class myCell: UITableViewCell {

    @IBOutlet weak var myLabel: UILabel!
    var shecvla = true
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func onButton(_ sender: UIButton) {
        print("aaaaa")
        if shecvla {
            myLabel.text = "HARRYYYYYYY HARRYYYYYYY HARRYYYYYYY HARRYYYYYYY HARRYYYYYYY"
        }else{
            myLabel.text = ""
        }
        shecvla = shecvla ? false : true
        
        let notification = Notification(name: Notification.Name(rawValue: "MainThread"))
        NotificationCenter.default.post(notification)
        
        
}
}
