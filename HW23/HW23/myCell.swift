//
//  myCell.swift
//  HW23
//
//  Created by Macintosh HD on 5/19/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

class myCell: UICollectionViewCell {
    @IBOutlet weak var hexColorField: UILabel!
    @IBOutlet weak var realColorField: UILabel!
    
    
    static let identifier = "myCell"
    static func nib()->UINib{
        return UINib(nibName: "myCell", bundle: nil)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
