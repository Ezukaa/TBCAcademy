//
//  CreditCardCollectionCell.swift
//  FinalProject
//
//  Created by Macintosh HD on 7/12/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

class CreditCardCollectionCell: UICollectionViewCell {
    
    static let identifier = "CreditCardCollectionCell"
    
    static func nib()-> UINib {
        return UINib(nibName: "CreditCardCollectionCell", bundle: nil)
    }
    @IBOutlet weak var cardNumber: UILabel!
    @IBOutlet weak var cardHolder: UILabel!
    @IBOutlet weak var cvv: UILabel!
    @IBOutlet weak var cardImage: UIImageView!
    @IBOutlet weak var expiration: UILabel!
    
    
    func configure(currCard:CreditCards){
        cardNumber.text = currCard.cardNum ?? ""
        cardHolder.text = currCard.cardHolder ?? ""
        cvv.text =        String(currCard.cardCVV )
        expiration.text = currCard.cardExpiration ?? ""

        
        
        if currCard.isMaster{
            self.backgroundColor = .orange
            cardImage.image = UIImage(named: "mastercard")
        }else {
            self.backgroundColor = .blue
            cardImage.image = UIImage(named: "visa")
        }
    
        
    }
    

    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
