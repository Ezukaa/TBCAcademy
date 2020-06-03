//
//  ViewController.swift
//  HW33
//
//  Created by Macintosh HD on 6/4/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        drawSquare()
    }
    func drawSquare() {
        let renderer = UIGraphicsImageRenderer(size: CGSize(width: 200, height: 200))
        
        let image = renderer.image { (ctx) in
            let square = CGRect(x: 0, y: 0, width: 200, height: 200)
            
            ctx.cgContext.setFillColor(UIColor.yellow.cgColor)
            ctx.cgContext.setStrokeColor(UIColor.green.cgColor)
            ctx.cgContext.setLineWidth(20)
            
            ctx.cgContext.addRect(square)
            ctx.cgContext.drawPath(using: .fillStroke)
        }
        imageView.image = image

}

}
