//
//  CallsTableViewCell.swift
//  HW17
//
//  Created by Macintosh HD on 5/7/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

class CallsTableViewCell: UITableViewCell {
    @IBOutlet weak var cellNumber: UILabel!
    @IBOutlet weak var cellCountry: UILabel!
    @IBOutlet weak var cellDate: UILabel!
    
    
    
    static let identifier = "CallsTableViewCell"
    
    static func nib()->UINib{
        return UINib(nibName: "CallsTableViewCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(number:String,country:String,date:String){
        cellNumber.text = number
        cellDate.text = date
        cellCountry.text = country
    }
    
}
