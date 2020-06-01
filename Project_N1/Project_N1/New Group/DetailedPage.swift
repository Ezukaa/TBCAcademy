//
//  DetailedPage.swift
//  Project_N1
//
//  Created by Macintosh HD on 5/28/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

class DetailedPage: UIViewController {
    @IBOutlet weak var detailedText: UILabel!
    
    
    var currentJob:JobsResponseElement?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let newText = "\(currentJob!.createdAt) \n \n \(currentJob!.jobsResponseDescription.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil))"
        

        detailedText.text = newText
        
    }
    @IBAction func toURLTap(_ sender: UIButton) {
        if let companyURL = self.currentJob?.companyURL{
        let unwrappedURL = companyURL.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
        UIApplication.shared.open(URL(string: unwrappedURL)! as URL, options: [:], completionHandler: nil )
        }
    }
    



}
