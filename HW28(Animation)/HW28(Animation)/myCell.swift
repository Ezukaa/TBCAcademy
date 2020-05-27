//
//  myCell.swift
//  HW28(Animation)
//
//  Created by Macintosh HD on 5/27/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

class myCell: UITableViewCell {
    static func nib()->UINib{
        return UINib(nibName: "myCell", bundle: nil)
    }
    static let ID = "myCell"
    

    
    @IBOutlet weak var myImage: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
