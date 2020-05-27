//
//  FirstPageTableCell.swift
//  Project_N1
//
//  Created by Macintosh HD on 5/26/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

class FirstPageTableCell: UITableViewCell {
    static let identigier = "FirstPageTableCell"
    static func nib()->UINib{
        return UINib(nibName: "FirstPageTableCell", bundle: nil)
    }
    
    @IBOutlet weak var companyImage: UIImageView!
    @IBOutlet weak var type: UILabel!
    @IBOutlet weak var location: UILabel!
    @IBOutlet weak var companyName: UILabel!
    @IBOutlet weak var title: UILabel!
    
    var currentCompany:JobsResponseElement? {
        didSet{
            companyName.text = currentCompany?.company
            type.text = (currentCompany?.type).map { $0.rawValue }
            location.text = currentCompany?.location
            title.text = currentCompany?.title
            currentCompany?.companyLogo?.downloadImage(completion: { (image) in
                DispatchQueue.main.async {
                    self.companyImage.image = image
                }
            })
            }
        }
        

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
extension String{
    func downloadImage(completion: @escaping (UIImage?)->()){
        guard let url = URL(string: self) else {return}
        URLSession.shared.dataTask(with: url){(data,res,err) in
            guard let data = data else{return}
            completion(UIImage(data: data))
            
        }.resume()
    }
}
