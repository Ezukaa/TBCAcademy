//
//  myCell.swift
//  HW29(Animation_2)
//
//  Created by Macintosh HD on 5/28/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

class myCell: UITableViewCell {
    static let ID = "myCell"
    static func nib()->UINib{
        return UINib(nibName: "myCell", bundle: nil)
    }
    
    @IBOutlet weak var icon: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
