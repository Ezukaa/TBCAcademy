//
//  customSegue.swift
//  HW47
//
//  Created by Macintosh HD on 7/2/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import Foundation
import  UIKit

//class AnimationController: NSObject{
//
//    private let animationDuration:Double
//    private let animationType: AnimationType
//
//    enum AnimationType{
//        case present
//        case dismiss
//    }
//    init(animationDuration:Double, animationType: AnimationType){
//        self.animationType = animationType
//        self.animationDuration = animationDuration
//    }
//
//
//}
//
//extension AnimationController:UIViewControllerAnimatedTransitioning{
//    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
//        return TimeInterval(exactly: self.animationDuration) ?? 0
//    }
//
//    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
//
//        guard
//            let toViewController = transitionContext.viewController(forKey: .to),
//            let fromViewController = transitionContext.viewController(forKey: .from)
//            else{
//            transitionContext.completeTransition(false)
//            return}
//
//        switch  animationType {
//        case .present:
//            transitionContext.containerView.addSubview(toViewController.view)
//            presentAnimation(with: transitionContext, viewToAnimate: toViewController.view)
//
//        case .dismiss:
//            print("Not Done Yet")
//        }
//
//
//    }
//    func presentAnimation(with transitionContext: UIViewControllerContextTransitioning, viewToAnimate: UIView){
//
//        viewToAnimate.clipsToBounds = false
//        viewToAnimate.transform = CGAffineTransform(scaleX: 0, y: 0)
//
//
//        let duration = transitionDuration(using: transitionContext)
//
//        UIView.animate(withDuration: duration, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.1, options: .curveEaseIn, animations: {
//            viewToAnimate.transform = CGAffineTransform(scaleX: 1, y: 1)
//        }) { _ in
//            transitionContext.completeTransition(true)
//        }
//
//
//    }
//}

import Foundation
import  UIKit
class PopAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    
    let duration = 1.5
    var presenting = true
    var originFrame = CGRect.zero
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return TimeInterval(duration)
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let containerView = transitionContext.containerView
        let toView = transitionContext.view(forKey: .to)!
        let recipeView = presenting ? toView : transitionContext.view(forKey: .from)!
        
        let initialFrame = presenting ? originFrame : recipeView.frame
        let finalFrame = presenting ? recipeView.frame : originFrame
        
        let xScaleFactor = presenting ?
            initialFrame.width / finalFrame.width :
            finalFrame.width / initialFrame.width
        
        let yScaleFactor = presenting ?
            initialFrame.height / finalFrame.height :
            finalFrame.height / initialFrame.height
        
        let scaleTransform = CGAffineTransform(scaleX: xScaleFactor, y: yScaleFactor)
        
        if presenting {
            recipeView.transform = scaleTransform
            recipeView.center = CGPoint(
                x: initialFrame.midX,
                y: initialFrame.midY)
            recipeView.clipsToBounds = true
        }
        
        recipeView.layer.cornerRadius = presenting ? 20.0 : 0.0
        recipeView.layer.masksToBounds = true
        
        containerView.addSubview(toView)
        containerView.bringSubviewToFront(recipeView)
        
        UIView.animate(
            withDuration: TimeInterval(duration),
            delay:0.0,
            usingSpringWithDamping: 0.5,
            initialSpringVelocity: 0.2,
            animations: {
                recipeView.transform = self.presenting ? .identity : scaleTransform
                recipeView.center = CGPoint(x: finalFrame.midX, y: finalFrame.midY)
                recipeView.layer.cornerRadius = !self.presenting ? 20.0 : 0.0
        }, completion: { _ in
            if !self.presenting {
                self.dismissCompletion?()
            }
            transitionContext.completeTransition(true)
        })
        
        
    }
    
    
    var dismissCompletion: (() -> Void)?
    
}
