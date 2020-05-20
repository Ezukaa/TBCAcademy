//
//  myTableCell.swift
//  HW25
//
//  Created by Macintosh HD on 5/20/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

class myTableCell: UITableViewCell {
    @IBOutlet weak var countryNameText: UILabel!
    @IBOutlet weak var countryCapital: UILabel!
    @IBOutlet weak var valutisSimbolo: UILabel!
    @IBOutlet weak var borders: UILabel!
    
    static func nib()->UINib{
    return UINib(nibName: "myTableCell", bundle: nil)
    }
    static let identifier = "myTableCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
