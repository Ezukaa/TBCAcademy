//
//  FirstTableViewCell.swift
//  HW18
//
//  Created by Macintosh HD on 5/8/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

class FirstTableViewCell: UITableViewCell {
    @IBOutlet weak var textDisplayed: UILabel!
    
    static let identifier = "FirstTableViewCell"
    static func nib()->UINib{
        return UINib(nibName: "FirstTableViewCell", bundle: nil)
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
