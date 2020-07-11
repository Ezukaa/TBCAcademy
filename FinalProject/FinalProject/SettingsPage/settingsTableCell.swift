//
//  settingsTableCell.swift
//  FinalProject
//
//  Created by Macintosh HD on 7/8/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

class settingsTableCell: UITableViewCell {
    @IBOutlet weak var settingsIcon: UIImageView!
    @IBOutlet weak var settingsText: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
     func configure(model:SettingsMVVM){
        self.settingsIcon.image = model.image
        self.settingsText.text = model.text
    }

}
