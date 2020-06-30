//
//  ViewController.swift
//  HW52
//
//  Created by Macintosh HD on 7/1/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var midViewX = CGFloat()
    var midViewY = CGFloat()
    
    var circlePath2 = UIBezierPath()
    var shapeLayer2 = CAShapeLayer()
    
    var textValue:Double = 0
    var label = UILabel()
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        view.backgroundColor = .black
        midViewX = view.frame.midX
        midViewY = view.frame.midY
        // Do any additional setup after loading the view, typically from a nib.
        let circlePath = UIBezierPath(arcCenter: CGPoint(x: midViewX,y: midViewY), radius: CGFloat(100), startAngle: CGFloat(0), endAngle:CGFloat(Double.pi * 2), clockwise: true)
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = circlePath.cgPath
        shapeLayer.strokeColor = UIColor.green.cgColor
        shapeLayer.lineWidth = 30
        shapeLayer.shadowColor = UIColor.green.cgColor
        shapeLayer.shadowRadius = 100
        shapeLayer.shadowOpacity = 1
        view.layer.addSublayer(shapeLayer)
        
        let angleEarth: Double = 180
        let angleEarthAfterCalculate: CGFloat = CGFloat(angleEarth*Double.pi/180) - CGFloat(Double.pi/2)
        let earthX = midViewX + cos(angleEarthAfterCalculate)*100
        let earthY = midViewY + sin(angleEarthAfterCalculate)*100
        circlePath2 = UIBezierPath(arcCenter: CGPoint(x: earthX,y: earthY), radius: CGFloat(15), startAngle: CGFloat(0), endAngle:CGFloat(Double.pi * 2), clockwise: true)
        shapeLayer2.path = circlePath2.cgPath
        shapeLayer2.fillColor = UIColor.blue.cgColor
        shapeLayer2.strokeColor = UIColor.clear.cgColor
        shapeLayer2.lineWidth = 7
        view.layer.addSublayer(shapeLayer2)
        
        let dragBall = UIPanGestureRecognizer(target: self, action:#selector(dragBall(recognizer:)))
        view.addGestureRecognizer(dragBall)
        
    }
    
    @objc func dragBall(recognizer: UIPanGestureRecognizer) {
        label.removeFromSuperview()
        let point = recognizer.location(in: self.view);
        let earthX = Double(point.x)
        let earthY = Double(point.y)
        let midViewXDouble = Double(midViewX)
        let midViewYDouble = Double(midViewY)
        let angleX = (earthX - midViewXDouble)
        let angleY = (earthY - midViewYDouble)
        //let angle = tan(angleY/angleX)
        let angle = atan2(angleY, angleX)
        let earthX2 = midViewXDouble + cos(angle)*100
        let earthY2 = midViewYDouble + sin(angle)*100
        circlePath2 = UIBezierPath(arcCenter: CGPoint(x: earthX2,y: earthY2), radius: CGFloat(15), startAngle: CGFloat(0), endAngle:CGFloat(Double.pi * 2), clockwise: true)
        shapeLayer2.path = circlePath2.cgPath
        
        
        textValue = earthX2
        
        let labelFrame = CGRect(x: self.view.center.x - 40, y: self.view.center.y - 10, width: 80, height: 20)
        label = UILabel(frame: labelFrame)
        
        label.textAlignment = .center
        var gradusi = angle + Double.pi
        gradusi *= 100
        gradusi = gradusi.rounded()
        gradusi /= 100
        gradusi = gradusi*180/Double.pi
        label.text = "\(gradusi.rounded())º"
        
        self.view.addSubview(label)
        label.bringSubviewToFront(self.view)
        
    }


}


