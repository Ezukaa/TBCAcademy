//
//  SettingsTableViewCell.swift
//  HW17
//
//  Created by Macintosh HD on 5/7/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

class SettingsTableViewCell: UITableViewCell {
    @IBOutlet weak var displayedOnSettings: UILabel!
    public func configure(value:String){
        displayedOnSettings.text = value
    }
    
    static let identifier = "SettingsTableViewCell"
    
    static func nib()->UINib{
        return UINib(nibName: "SettingsTableViewCell", bundle: nil)
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
