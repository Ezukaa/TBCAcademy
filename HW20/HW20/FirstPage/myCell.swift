//
//  myCell.swift
//  HW20
//
//  Created by Macintosh HD on 5/13/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

class myCell: UITableViewCell {
    @IBOutlet weak var titleField: UILabel!
    @IBOutlet weak var plotField: UILabel!
    @IBOutlet weak var timeField: UILabel!
    
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
