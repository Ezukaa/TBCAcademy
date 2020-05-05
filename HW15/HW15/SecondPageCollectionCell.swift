//
//  SecondPageCollectionCell.swift
//  HW15
//
//  Created by Macintosh HD on 5/5/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

class SecondPageCollectionCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    public func configure(with image: UIImage){
        imageView.image = image
    }
    static func nib() -> UINib{
        return UINib(nibName: "SecondPageCollectionCell", bundle: nil)
    }

}
