//
//  ViewController.swift
//  HW14
//
//  Created by Macintosh HD on 5/4/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var blueView: UIView!{
        didSet{
        blueView.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    let greenView = UIView()
    
    let redView: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .red
        return v
    }()
    let button:UIButton = {
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
    

    
    override func loadView() {
        super.loadView()
        view.addSubview(greenView)
        view.addSubview(redView)
        view.addSubview(button)
        greenView.translatesAutoresizingMaskIntoConstraints = false
        greenView.backgroundColor = .green
        NSLayoutConstraint.activate([
            greenView.topAnchor.constraint(equalTo: blueView.bottomAnchor),
            greenView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            greenView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            greenView.heightAnchor.constraint(equalToConstant: 150)
            ])
        NSLayoutConstraint.activate([
            //redView.topAnchor.constraint(equalTo: greenView.bottomAnchor),
            redView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            redView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            redView.heightAnchor.constraint(equalToConstant: 200)
            ])
        NSLayoutConstraint.activate([
            button.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            button.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            button.bottomAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.bottomAnchor, multiplier: -40)
            
            ])
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Shemovida")
        blueView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        blueView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        blueView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        blueView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        redViewTopConstraint = NSLayoutConstraint(item: redView, attribute: .top, relatedBy: .equal, toItem: greenView, attribute: .bottom, multiplier: 1, constant: 0)
        self.view.addConstraint(redViewTopConstraint)
        print(self)
        
        
    }
    var redViewTopConstraint: NSLayoutConstraint!
    
    @objc func onButton(){
        redViewTopConstraint.constant = CGFloat(50)
        print("BUTTON")
        
    }
    
}


