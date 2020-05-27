//
//  ViewController.swift
//  Proj_N1_v2
//
//  Created by Macintosh HD on 5/27/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var wholeJobsArray = [JobsResponseElement]()

    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        wholeResponse()
    }
    
    func wholeResponse(){
        var jobsResponse = APIResponse()
        
        
        jobsResponse.getWholeInfo() { (gg) in
            

                self.wholeJobsArray += gg
                print(self.wholeJobsArray.count)
        }
        
        
            
        
            
        }
        
    }




