//
//  ViewController.swift
//  HW47
//
//  Created by Macintosh HD on 7/1/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    let transition = PopAnimator()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
            print("AAA")
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.contentInsetAdjustmentBehavior = .never
        
        
        transition.dismissCompletion = { [weak self] in
            guard
                let selectedIndexPathCell = self?.collectionView.indexPathsForSelectedItems,
                let selectedCell = self?.collectionView.cellForItem(at: selectedIndexPathCell[0])
                    as? myCell
                else {
                    return
            }
            
            selectedCell.isHidden = false
        }
        
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let ImageVC = segue.destination as? destinationVC{
//            ImageVC.img1 = arr[selectedItem]!
            ImageVC.transitioningDelegate = self
            ImageVC.modalPresentationStyle = .fullScreen
        }
    }
    


}

extension ViewController:UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "myCell", for: indexPath) as! myCell
        cell.layer.cornerRadius = 20
        cell.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        


        return cell
    }


}
extension ViewController:UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "mySegue", sender: self)
    }

}

extension ViewController:UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width/2 - 20, height: collectionView.frame.height)
    }
    
}

//extension ViewController: UIViewControllerTransitioningDelegate{
//
//    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
//
//        return AnimationController(animationDuration: 2, animationType: .present)
//    }
//
//
//}


extension ViewController: UIViewControllerTransitioningDelegate {
    
    func animationController(
        forPresented presented: UIViewController,
        presenting: UIViewController, source: UIViewController)
        -> UIViewControllerAnimatedTransitioning? {
            
            guard
                let selectedIndexPathCell = collectionView.indexPathsForSelectedItems,
                let selectedCell = collectionView.cellForItem(at: selectedIndexPathCell[0])
                    as? myCell,
                let selectedCellSuperview = selectedCell.superview
                else {
                    return nil
            }
            
            transition.originFrame = selectedCellSuperview.convert(selectedCell.frame, to: nil)
            transition.originFrame = CGRect(
                x: transition.originFrame.origin.x + 20,
                y: transition.originFrame.origin.y + 20,
                width: transition.originFrame.size.width - 40,
                height: transition.originFrame.size.height - 40
            )
            
            transition.presenting = true
            selectedCell.isHidden = true
            
            return transition
    }
    
    func animationController(forDismissed dismissed: UIViewController)
        -> UIViewControllerAnimatedTransitioning? {
            transition.presenting = false
            return transition
            
            
    }
    
}

