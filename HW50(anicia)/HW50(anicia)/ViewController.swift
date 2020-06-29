//
//  ViewController.swift
//  HW50(anicia)
//
//  Created by Macintosh HD on 6/29/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var toSquare: UIView!
    @IBOutlet weak var toCircle: UIView!
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var rotateAngle: UISlider!
    @IBOutlet weak var rotateIndicator: UILabel!
    @IBOutlet weak var scaleIndicator: UILabel!
    @IBOutlet weak var pointX: UILabel!
    @IBOutlet weak var pointY: UILabel!
    @IBOutlet weak var positionXSlader: UISlider!
    @IBOutlet weak var positionYSlader: UISlider!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        toSquare.layer.cornerRadius = 5
        toCircle.layer.cornerRadius = 10
        mainView.layer.cornerRadius = 37.5
        tapOnFigures()
        positionXSlader.maximumValue = Float(view.frame.width)
        positionYSlader.maximumValue = Float(view.frame.width)
    }
    
    
    func tapOnFigures(){
        let circleTapGesture = UITapGestureRecognizer(target: self, action: #selector(tappedOnCircle))
        let squareTapGesture = UITapGestureRecognizer(target: self, action: #selector(tappedOnSquare))
        toCircle.addGestureRecognizer(circleTapGesture)
        toSquare.addGestureRecognizer(squareTapGesture)
    }
    @objc func tappedOnCircle(){
        print("circle")
        let anim = CABasicAnimation(keyPath: "cornerRadius")
        anim.duration = 1
        anim.toValue = 75
        anim.fillMode = .forwards
        anim.isRemovedOnCompletion = false
        mainView.layer.add(anim, forKey: "aaa")
        
        
    }
    @objc func tappedOnSquare(){
        print("square")
        let anim = CABasicAnimation(keyPath: "cornerRadius")
        anim.duration = 1
        anim.toValue = 37.5
        anim.fillMode = .forwards
        anim.isRemovedOnCompletion = false
        mainView.layer.add(anim, forKey: "bbb")
        
        //ESEC AKETEBS UBRALOD DROSHIA CDOMILEBA :D
        
//        let anim = CABasicAnimation(keyPath: "cornerRadius")
//        anim.isRemovedOnCompletion = true
//        mainView.layer.add(anim, forKey: "aaa")
//
//
//
//        UIView.animate(withDuration: 1, animations: {
//            self.mainView.layer.cornerRadius = 37.5
//        }) { (completion) in
//            print(completion)
//        }
//    }
}
    @IBAction func onOptionsTap(_ sender: UIButton) {
 
 
    }
    
    @IBAction func onRotate(_ sender: UISlider) {
//        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 10, initialSpringVelocity: 100, options: .curveEaseIn, animations: {
//            self.mainView.transform = CGAffineTransform(rotationAngle: CGFloat(sender.value))
//        }, completion: nil)
        let spring = CASpringAnimation(keyPath: "transform.rotation")
        spring.damping = 40
        spring.toValue = sender.value
        spring.duration = 1
        spring.fillMode = .forwards
        spring.isRemovedOnCompletion = false
        mainView.layer.add(spring, forKey: "qiqiq")
        
        
        print(sender.value)
        rotateIndicator.text = "Rotate: \(String(format: "%.2f", sender.value))"
    }
    
    
    @IBAction func onScale(_ sender: UISlider) {
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 10, initialSpringVelocity: 20, options: .curveEaseIn, animations: {
            self.mainView.transform = CGAffineTransform(scaleX: CGFloat(sender.value), y: CGFloat(sender.value))
        }, completion: nil)
        print(sender.value)
        scaleIndicator.text = "Scale: \(String(format: "%.2f", sender.value))"
    }
    @IBAction func onX(_ sender: UISlider) {
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 10, initialSpringVelocity: 20, options: .curveEaseIn, animations: {
            self.mainView.frame.origin.x = CGFloat(sender.value)
        }, completion: nil)
        print(sender.value)
    }
    @IBAction func onY(_ sender: UISlider) {
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 10, initialSpringVelocity: 20, options: .curveEaseIn, animations: {
            self.mainView.frame.origin.y = CGFloat(sender.value)
        }, completion: nil)
        print(sender.value)
        
    }
}
    

