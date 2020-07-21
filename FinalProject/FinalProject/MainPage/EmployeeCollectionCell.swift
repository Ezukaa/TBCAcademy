//
//  EmployeeCollectionCell.swift
//  FinalProject
//
//  Created by Macintosh HD on 7/11/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

class EmployeeCollectionCell: UICollectionViewCell {
    static let identifier = "EmployeeCell"
    
    @IBOutlet weak var employeeImage: UIImageView!
    @IBOutlet weak var employeeName: UILabel!
    
    
    func configure(currEmployee:JobsDetailedResponse){
        
        
        
        currEmployee.image.downloadImage(completion: { (image) in
            guard let image = image else{ return}
            DispatchQueue.main.async {
                self.employeeImage.image = image
                self.employeeImage.layer.masksToBounds = true

            }

        })
        
        employeeName.text = "\(currEmployee.name) \(currEmployee.lastName)"
        
        
    }
    
    
}
