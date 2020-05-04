//
//  ViewController.swift
//  Davaleba14
//
//  Created by Macintosh HD on 5/4/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let firstView:UIView = {
       let f = UIView()
        f.translatesAutoresizingMaskIntoConstraints = false
        f.backgroundColor = .red
        return f
    }()
    
    let textField1 : UITextField = {
        let TF1 = UITextField()
        TF1.translatesAutoresizingMaskIntoConstraints = false
        TF1.backgroundColor = .green
        return TF1
    }()
    let textField2 : UITextField = {
        let TF1 = UITextField()
        TF1.translatesAutoresizingMaskIntoConstraints = false
        TF1.backgroundColor = .yellow
        return TF1
    }()
    
    //Button
    let dimensionButton:UIButton = {
        let b = UIButton()
        b.translatesAutoresizingMaskIntoConstraints = false
        b.setTitle("Button", for: .normal)
        b.addTarget(self, action: #selector(onButton), for: .touchUpInside)
        b.backgroundColor = .gray
        
        b.layer.cornerRadius = 20
        b.layer.backgroundColor = UIColor.red.cgColor
        b.layer.borderWidth = 5
        
        return b
        
    }()
    let ButtonW:UIButton = {
        let b = UIButton()
        b.translatesAutoresizingMaskIntoConstraints = false
        b.setTitle("W", for: .normal)
        b.addTarget(self, action: #selector(onButtonW), for: .touchUpInside)
        b.backgroundColor = .gray
        
        b.layer.cornerRadius = 5
        b.layer.backgroundColor = UIColor.red.cgColor
        b.layer.borderWidth = 2
        
        return b
        
    }()
    let ButtonA:UIButton = {
        let b = UIButton()
        b.translatesAutoresizingMaskIntoConstraints = false
        b.setTitle("A", for: .normal)
        b.addTarget(self, action: #selector(onButtonA), for: .touchUpInside)
        b.backgroundColor = .gray
        
        b.layer.cornerRadius = 5
        b.layer.backgroundColor = UIColor.red.cgColor
        b.layer.borderWidth = 2
        
        return b
        
    }()
    let ButtonS:UIButton = {
        let b = UIButton()
        b.translatesAutoresizingMaskIntoConstraints = false
        b.setTitle("S", for: .normal)
        b.addTarget(self, action: #selector(onButtonS), for: .touchUpInside)
        b.backgroundColor = .gray
        
        b.layer.cornerRadius = 5
        b.layer.backgroundColor = UIColor.red.cgColor
        b.layer.borderWidth = 2
        
        return b
        
    }()
    let ButtonD:UIButton = {
        let b = UIButton()
        b.translatesAutoresizingMaskIntoConstraints = false
        b.setTitle("D", for: .normal)
        b.addTarget(self, action: #selector(onButtonD), for: .touchUpInside)
        b.backgroundColor = .gray
        
        b.layer.cornerRadius = 5
        b.layer.backgroundColor = UIColor.red.cgColor
        b.layer.borderWidth = 2
        
        return b
        
    }()
    let slider:UISlider = {
        let s = UISlider()
        s.translatesAutoresizingMaskIntoConstraints = false
        s.backgroundColor = .green
        s.maximumValue = 200
        s.minimumValue = 50
        s.addTarget(self, action: #selector(onSlider), for: .touchUpInside)
        return s
    }()
    
    
    
    override func loadView() {
        super.loadView()
        
        //FirstView(Last Thing to do)
        view.addSubview(firstView)
        NSLayoutConstraint.activate([
    
            
            ])
        
        //TextField1
        view.addSubview(textField1)
        NSLayoutConstraint.activate([
            textField1.widthAnchor.constraint(equalToConstant: 100),
            textField1.heightAnchor.constraint(equalToConstant: 30),
            textField1.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 400),
            textField1.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 10)
            ])
        
        //TextField2
        view.addSubview(textField2)
        NSLayoutConstraint.activate([
            textField2.widthAnchor.constraint(equalToConstant: 100),
            textField2.heightAnchor.constraint(equalToConstant: 30),
            textField2.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 400),
            textField2.leadingAnchor.constraint(equalTo: textField1.trailingAnchor, constant: 50)
            ])
        //Buttons
        view.addSubview(dimensionButton)
        NSLayoutConstraint.activate([
            dimensionButton.leadingAnchor.constraint(equalTo: textField2.trailingAnchor, constant: 50 ),
            dimensionButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            dimensionButton.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 400)
            ])
        view.addSubview(ButtonW)
        NSLayoutConstraint.activate([
            ButtonW.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100 ),
            ButtonW.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 550)
            ])
        view.addSubview(ButtonA)
        NSLayoutConstraint.activate([
            ButtonA.trailingAnchor.constraint(equalTo: ButtonW.leadingAnchor, constant: -20 ),
            ButtonA.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 600)
            ])
        view.addSubview(ButtonS)
        NSLayoutConstraint.activate([
            ButtonS.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100 ),
            ButtonS.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 650)
            ])
        view.addSubview(ButtonD)
        NSLayoutConstraint.activate([
            ButtonD.leadingAnchor.constraint(equalTo: ButtonW.trailingAnchor, constant: 20 ),
            ButtonD.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 600)
            ])
        //slider
        view.addSubview(slider)
        NSLayoutConstraint.activate([
            slider.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            slider.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            slider.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50)
                ])
    }

    
    
    
    
    var firstViewHeight: NSLayoutConstraint?
    var firstViewWidth: NSLayoutConstraint?
    var changeW: NSLayoutConstraint!
    var changeA:NSLayoutConstraint!
    var changeS:NSLayoutConstraint!
    var changeD:NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Chairto")
        firstViewWidth = firstView.widthAnchor.constraint(equalToConstant: 60)
        firstViewWidth?.isActive = true
        
        firstViewHeight = firstView.heightAnchor.constraint(equalToConstant: 60)
        firstViewHeight?.isActive = true
        
        
        //aq ver vxvdebi rato iwkebs safe areadan atvlas. view maqvs gawerili
        changeS = NSLayoutConstraint(item: firstView, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1, constant: 0)
        self.view.addConstraint(changeS)
        
        changeD = NSLayoutConstraint(item: firstView, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: 0)
        self.view.addConstraint(changeD)
        
    }

    
    
    
    
    
    
    
    
    @objc func onButton(){
        firstViewWidth?.constant = CGFloat(Int(textField1.text!) ?? 0)
        firstViewHeight?.constant = CGFloat(Int(textField2.text!) ?? 0)
        print(textField1.text!)
    }
    
    
    var positionS = 0
    var positionD = 0
    @objc func onButtonW(){
        print("W")
        positionS-=1
        changeS.constant = CGFloat(positionS)
    }
    @objc func onButtonA(){
        print("A")
        positionD-=1
        changeD.constant = CGFloat(positionD)
    }
    
    @objc func onButtonS(){
        print("S")
        positionS+=1
        changeS.constant = CGFloat(positionS)
    }
    
    @objc func onButtonD(){
        print("D")
        positionD+=1
        changeD.constant = CGFloat(positionD)
    }
    @objc func onSlider(){
        firstViewHeight?.constant = CGFloat(Int(slider.value))
    }

}

