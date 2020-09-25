//
//  RecentGamesTableCell.swift
//  Wandio
//
//  Created by Macintosh HD on 9/22/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

class RecentGamesTableCell: UITableViewCell {
    static let id = "RecentGamesTableCell"
    
    static func nib()->UINib{
        return UINib(nibName: "RecentGamesTableCell", bundle: nil)
    }
    
    @IBOutlet weak var gameID: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
