//
//  postViewCell.swift
//  HW22
//
//  Created by Macintosh HD on 5/15/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

class postViewCell: UITableViewCell {
    static let identifier = "postViewCell"
    static func nib()->UINib{
        return UINib(nibName: "postViewCell", bundle: nil)
    }
    
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var userFullName: UILabel!
    @IBOutlet weak var userNote: UILabel!
    @IBOutlet weak var noteDate: UILabel!
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
