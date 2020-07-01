//
//  myCell.swift
//  HW47
//
//  Created by Macintosh HD on 7/1/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

class myCell: UICollectionViewCell {
    static let identifier = "myCell"
    static func nib()->UINib{
        return UINib(nibName: "myCell", bundle: nil)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
