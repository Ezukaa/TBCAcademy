//
//  MessagesTableViewCell.swift
//  HW17
//
//  Created by Macintosh HD on 5/7/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

class MessagesTableViewCell: UITableViewCell {

    
    @IBOutlet weak var nameField: UILabel!
    @IBOutlet weak var messageField: UILabel!
    @IBOutlet weak var pictureField: UIImageView!
    
    
    static let identifier = "MessagesTableViewCell"
    static func nib()->UINib{
        return UINib(nibName: "MessagesTableViewCell", bundle: nil)
    }
    
    func configure(name:String,message:String){
        nameField.text = name
        messageField.text = message
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
