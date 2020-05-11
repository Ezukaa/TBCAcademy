//
//  secondPageTWCell.swift
//  HW19
//
//  Created by Macintosh HD on 5/11/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

class  secondPageTWCell: UITableViewCell {
    @IBOutlet weak var textDisplayed: UITextView!
    
    static let identifier = "secondPageTWCell"
    
    static func nib()->UINib{
        return UINib(nibName: "secondPageTWCell", bundle: nil)
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
