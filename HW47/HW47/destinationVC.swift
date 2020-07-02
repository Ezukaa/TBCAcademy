//
//  destinationVC.swift
//  HW47
//
//  Created by Macintosh HD on 7/2/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

class destinationVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       
//        transitioningDelegate = self
        // Do any additional setup after loading the view.
        configurePanGesture()
    }
    

    
    private func configurePanGesture() {
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(didPan(_:)))
        view.addGestureRecognizer(panGesture)
    }
    @objc func didPan(_ gesture: UIPanGestureRecognizer) {
        

        dismiss(animated: true, completion: nil)
    
    }
}

//extension destinationVC: UIViewControllerTransitioningDelegate{
//
//    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
//
//        return AnimationController(animationDuration: 2, animationType: .present)
//    }
//
//
//}
