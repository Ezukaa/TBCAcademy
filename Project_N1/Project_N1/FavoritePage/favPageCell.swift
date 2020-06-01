//
//  favPageCell.swift
//  Project_N1
//
//  Created by Macintosh HD on 5/27/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

class favPageCell: UITableViewCell {
    static let identifier = "favPageCell"
    static func nib()->UINib{
        return UINib(nibName: "favPageCell", bundle: nil)
    }

    @IBOutlet weak var companyName: UILabel!
    @IBOutlet weak var companyLocation: UILabel!
    @IBOutlet weak var jobType: UILabel!
    @IBOutlet weak var mainTitle: UILabel!
    @IBOutlet weak var comapyLogo: UIImageView!
    
    var currentCompany:FavJobs! {
        didSet{
            companyName.text = currentCompany.compName
            companyLocation.text = currentCompany.jobLocation
            jobType.text = currentCompany.jobType
            mainTitle.text = currentCompany.jobTitle
            if let binartImage = currentCompany.compLogo{
                self.comapyLogo.image = UIImage(data: binartImage)
            }
            
        }
    }
    
    // modi machvene scenari sadac bug aris 
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
