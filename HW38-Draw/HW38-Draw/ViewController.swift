//
//  ViewController.swift
//  HW38-Draw
//
//  Created by Macintosh HD on 6/10/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit
class Canvas: UIView{
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        guard let context = UIGraphicsGetCurrentContext()else {return}
        
        context.setStrokeColor(UIColor.blue.cgColor)
        context.setLineWidth(10)
        context.setLineCap(.round)
        
        
        line.forEach{(line) in
        for (i,p) in line.enumerated(){
            if i == 0{
                context.move(to: p)
            }
            else{
                context.addLine(to: p)
            }
        }
        }
        
        context.strokePath()
        
    }
    var line = [[CGPoint]]()
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        line.append([CGPoint]())
    }
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let point = touches.first?.location(in: nil) else{return}
        guard var lastLine = line.popLast() else {return}
        
        lastLine.append(point)
        
        line.append(lastLine)
                
        setNeedsDisplay()
    }
    
}

class ViewController: UIViewController {
    let canvas = Canvas()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(canvas)
        canvas.backgroundColor = .white
        canvas.frame = view.frame
        }


}

