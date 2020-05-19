//
//  infoPageCell.swift
//  HW24
//
//  Created by Macintosh HD on 5/19/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

class infoPageCell: UITableViewCell {
    static let identifier = "infoPageCell"
    static func nib()->UINib{
        return UINib(nibName: "infoPageCell", bundle: nil)
    }
    @IBOutlet weak var myTextLabel: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
