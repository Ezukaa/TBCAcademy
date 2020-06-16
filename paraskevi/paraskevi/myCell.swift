//
//  myCell.swift
//  paraskevi
//
//  Created by Macintosh HD on 6/12/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

class myCell: UITableViewCell {
    
    static let indentifier = "myCell"
    
    static func nib()->UINib{
        return UINib(nibName: "myCell", bundle: nil)
    }

    @IBOutlet weak var currCity: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
