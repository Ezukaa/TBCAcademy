//
//  ChemiTableViewCell.swift
//  HW11
//
//  Created by Macintosh HD on 4/29/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

class ChemiTableViewCell: UITableViewCell {
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
