//
//  testPage.swift
//  FinalProject
//
//  Created by Macintosh HD on 6/21/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

class testPage: UIViewController {
    @IBOutlet weak var testImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

    }
    

    @IBAction func onSignOut(_ sender: UIButton) {
        JSONParse.Shared.parseJson { (aee:JobsDetailedResponse) in
            print(aee.image)
            aee.image.downloadImage(completion: { (image) in
                DispatchQueue.main.async {
                    self.testImage.image = image
                }
            })
        }
    }
    

}
