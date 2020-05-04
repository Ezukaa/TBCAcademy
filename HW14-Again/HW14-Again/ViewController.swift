//
//  ViewController.swift
//  HW14-Again
//
//  Created by Macintosh HD on 5/4/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let firstView: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .green
        return v
    }()
    
    let secondView: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .orange
        return v
    }()
    
    let txtForWidth : UITextField = {
        let t = UITextField()
        t.translatesAutoresizingMaskIntoConstraints = false
        t.backgroundColor = .green
        t.layer.borderColor = UIColor.black.cgColor
        t.layer.borderWidth = 1
        t.layer.cornerRadius = 5
        return t
    }()
    let txtForHeight : UITextField = {
        let t = UITextField()
        t.translatesAutoresizingMaskIntoConstraints = false
        t.backgroundColor = .green
        t.layer.borderColor = UIColor.black.cgColor
        t.layer.borderWidth = 1
        t.layer.cornerRadius = 5
        return t
    }()
    let sizeButton : UIButton = {
        let b = UIButton()
        b.translatesAutoresizingMaskIntoConstraints = false
        b.backgroundColor = .red
        b.setTitle("Change", for: .normal)
        b.layer.cornerRadius = 20
        b.addTarget(self, action: #selector(onSizeChange), for: .touchUpInside)
        return b
    }()
    let downButton : UIButton = {
       let b = UIButton()
        b.translatesAutoresizingMaskIntoConstraints = false
        b.backgroundColor = .orange
        b.setTitle("S", for: .normal)
        b.addTarget(self, action: #selector(buttonOnS), for: .touchUpInside)
        return b
    }()
    let upButton : UIButton = {
        let b = UIButton()
        b.translatesAutoresizingMaskIntoConstraints = false
        b.backgroundColor = .orange
        b.setTitle("W", for: .normal)
        b.addTarget(self, action: #selector(buttonOnW), for: .touchUpInside)
        return b
    }()
    let leftButton : UIButton = {
        let b = UIButton()
        b.translatesAutoresizingMaskIntoConstraints = false
        b.backgroundColor = .orange
        b.setTitle("A", for: .normal)
        b.addTarget(self, action: #selector(buttonOnA), for: .touchUpInside)
        return b
    }()
    let rightButton : UIButton = {
        let b = UIButton()
        b.translatesAutoresizingMaskIntoConstraints = false
        b.backgroundColor = .orange
        b.setTitle("D", for: .normal)
        b.addTarget(self, action: #selector(buttonOnD), for: .touchUpInside)
        return b
    }()
    let slider : UISlider = {
        let s = UISlider()
        s.translatesAutoresizingMaskIntoConstraints = false
        s.backgroundColor = .blue
        s.maximumValue = 200
        s.minimumValue = 50
        s.value = 100
        s.addTarget(self, action: #selector(onSlider), for: .touchUpInside)
        return s
    }()
    
    
    
    
    
    var firstHight: NSLayoutConstraint!
    var firstWidth: NSLayoutConstraint!
    
    var firstPositionX: NSLayoutConstraint!
    var firstPositionY: NSLayoutConstraint!
    
    var secondHight: NSLayoutConstraint!
    var secondWidth: NSLayoutConstraint!
    
    var secondPositionX: NSLayoutConstraint!
    var secondPositionY: NSLayoutConstraint!
    
    
    override func loadView() {
        super.loadView()
        view.addSubview(firstView)
        view.addSubview(secondView)
        
        view.addSubview(txtForWidth)
        view.addSubview(txtForHeight)
        view.addSubview(sizeButton)
        
        view.addSubview(downButton)
        view.addSubview(upButton)
        view.addSubview(leftButton)
        view.addSubview(rightButton)
        
        view.addSubview(slider)
        
        firstHight = NSLayoutConstraint(item: firstView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 100)
        firstWidth = NSLayoutConstraint(item: firstView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 100)
        
            //AQ RAGAC ICHALICHA !!!! RA KLEOBA QNAAA???? DAAKVIRDI ATTRIBUTES!!!!
        firstPositionX = NSLayoutConstraint(item: firstView, attribute: .leading, relatedBy: .equal, toItem: self.view, attribute: .leading, multiplier: 1, constant: 0)
        firstPositionY = NSLayoutConstraint(item: firstView, attribute: .top, relatedBy: .equal, toItem: self.view.safeAreaLayoutGuide, attribute: .top, multiplier: 1, constant: 0)
        
        self.view.addConstraint(firstHight)
        self.view.addConstraint(firstWidth)
        self.view.addConstraint(firstPositionY)
        self.view.addConstraint(firstPositionX)
        
        secondHight = NSLayoutConstraint(item: secondView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 100)
        
        secondWidth = NSLayoutConstraint(item: secondView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 100)
        
        secondPositionX = NSLayoutConstraint(item: secondView, attribute: .trailing, relatedBy: .equal, toItem: self.view, attribute: .trailing, multiplier: 1, constant: 0)
        
        secondPositionY = NSLayoutConstraint(item: secondView, attribute: .top, relatedBy: .equal, toItem: self.view.safeAreaLayoutGuide, attribute: .top, multiplier: 1, constant: 0)
        
        self.view.addConstraint(secondPositionY)
        self.view.addConstraint(secondPositionX)
        self.view.addConstraint(secondHight)
        self.view.addConstraint(secondWidth)
        
        
        
        //FirstLine
        NSLayoutConstraint.activate([
            txtForHeight.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 200),
            txtForHeight.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            txtForHeight.widthAnchor.constraint(equalToConstant: 100),
            txtForHeight.heightAnchor.constraint(equalToConstant: 40)
            ])
        NSLayoutConstraint.activate([
            txtForWidth.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 200),
            txtForWidth.leadingAnchor.constraint(equalTo: txtForHeight.trailingAnchor, constant: 40),
            txtForWidth.widthAnchor.constraint(equalToConstant: 100),
            txtForWidth.heightAnchor.constraint(equalToConstant: 40)
            ])
        NSLayoutConstraint.activate([
            sizeButton.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 200),
            sizeButton.leadingAnchor.constraint(equalTo: txtForWidth.trailingAnchor, constant: 40),
            sizeButton.widthAnchor.constraint(equalToConstant: 100),
            sizeButton.heightAnchor.constraint(equalToConstant: 40)
            ])
        NSLayoutConstraint.activate([
            downButton.topAnchor.constraint(equalTo: txtForHeight.bottomAnchor, constant: 200),
            downButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 150),
            ])
        NSLayoutConstraint.activate([
            upButton.bottomAnchor.constraint(equalTo: downButton.topAnchor, constant: -90),
            upButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 150),
            ])
        NSLayoutConstraint.activate([
            leftButton.bottomAnchor.constraint(equalTo: downButton.topAnchor, constant: -30),
            leftButton.trailingAnchor.constraint(equalTo: downButton.leadingAnchor, constant: -30),
            ])
        NSLayoutConstraint.activate([
            rightButton.bottomAnchor.constraint(equalTo: downButton.topAnchor, constant: -30),
            rightButton.leadingAnchor.constraint(equalTo: downButton.trailingAnchor, constant: 30),
            ])
        NSLayoutConstraint.activate([
            slider.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant:40),
            slider.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant:-40),
            slider.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -100),
            slider.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    
    
    
    
    var selectedView = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        firstView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(firstSelected)))
        secondView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(secondSelected)))
        
    }

    
    
    
    @objc func onSizeChange(){
    print("size change button")
        switch selectedView {
        case 0:
            showAlert(title: "Error", message: "Please Select View")
        case 1:
            if txtForHeight.text == "" || txtForWidth.text == ""{
                showAlert(title: "Error" , message: "Please fill all fields")
            }else if Int(txtForHeight.text!) == nil || Int(txtForWidth.text!) == nil{
                showAlert(title: "Erro", message: "Please enter numbers")
            }else{
                firstHight.constant = CGFloat(Int(txtForHeight.text!) ?? 0)
                firstWidth.constant = CGFloat(Int(txtForWidth.text!) ?? 0)
            }
        case 2:
            if txtForHeight.text == "" || txtForWidth.text == ""{
                showAlert(title: "Error" , message: "Please fill all fields")
            }else if Int(txtForHeight.text!) == nil || Int(txtForWidth.text!) == nil{
                showAlert(title: "Erro", message: "Please enter numbers")
            }else{
                secondHight.constant = CGFloat(Int(txtForHeight.text!) ?? 0)
                secondWidth.constant = CGFloat(Int(txtForWidth.text!) ?? 0)
            }
        default:
            print("Kai ra")
        }
        
    }
    @objc func buttonOnS(){
        switch selectedView {
        case 0:
            showAlert(title: "Error", message: "Select View")
        case 1:
            firstPositionY.constant += 10
        case 2:
            secondPositionY.constant += 10
        default:
            print("S")
        }
    }
    @objc func buttonOnW(){
        switch selectedView {
        case 0:
            showAlert(title: "Error", message: "Select View")
        case 1:
            firstPositionY.constant -= 10
        case 2:
            secondPositionY.constant -= 10
        default:
            print("W")
        }
    }
    @objc func buttonOnA(){
        switch selectedView {
        case 0:
            showAlert(title: "Error", message: "Select View")
        case 1:
            firstPositionX.constant -= 10
        case 2:
            secondPositionX.constant -= 10
        default:
            print("S")
        }
    }
    @objc func buttonOnD(){
        switch selectedView {
        case 0:
            showAlert(title: "Error", message: "Select View")
        case 1:
            firstPositionX.constant += 10
        case 2:
            secondPositionX.constant += 10
        default:
            print("D")
        }
    }
    
    //Gesture
    @objc func firstSelected(){
        selectedView = 1
    }
    
    @objc func secondSelected(){
        selectedView = 2
    }
    //slider
    @objc func onSlider(){
        switch selectedView {
        case 0:
            showAlert(title: "Error", message: "Select View")
        case 1:
            firstHight.constant = CGFloat(slider.value)
        case 2:
            secondHight.constant = CGFloat(slider.value)
        default:
            print("THE END")
        }
    }
    
    
    
    func showAlert(title:String, message:String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "GG", style: .cancel, handler: nil))
        self.present(alert,animated: true)
    }

}

