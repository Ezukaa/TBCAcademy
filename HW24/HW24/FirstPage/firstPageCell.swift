//
//  firstPageCell.swift
//  HW24
//
//  Created by Macintosh HD on 5/19/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

class firstPageCell: UICollectionViewCell {
    @IBOutlet weak var bandImage: UIImageView!
    @IBOutlet weak var bandTitle: UILabel!
    
    static func nib()->UINib{
        return UINib(nibName: "firstPageCell", bundle: nil)
    }
    static let identifier = "firstPageCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
