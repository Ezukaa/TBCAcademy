//
//  FirstCollectionViewCell.swift
//  HW19
//
//  Created by Macintosh HD on 5/11/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

class FirstCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var folderNameDisp: UILabel!
    
    static let identifier = "FirstCollectionViewCell"
    
    static func nib()-> UINib{
        return UINib(nibName: "FirstCollectionViewCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
