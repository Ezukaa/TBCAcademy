//
//  myCell.swift
//  HW41-v2
//
//  Created by Macintosh HD on 6/16/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

class myCell: UITableViewCell {
    static let identifier = "myCell"
    static func nib()->UINib{
        return UINib(nibName: "myCell", bundle: nil)
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
