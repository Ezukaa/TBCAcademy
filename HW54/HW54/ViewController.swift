//
//  ViewController.swift
//  HW54
//
//  Created by Macintosh HD on 7/2/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    var selectedIndexPath:IndexPath?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        
        let flowLayout = UPCarouselFlowLayout()
        flowLayout.itemSize = CGSize(width: self.view.bounds.width / 2, height: 200)
        flowLayout.scrollDirection = .vertical
        flowLayout.sideItemScale = 0.8
        flowLayout.sideItemAlpha = 0.8
        flowLayout.spacingMode = .fixed(spacing: 30)

        
        collectionView.collectionViewLayout = flowLayout
    }


}

extension ViewController:UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("aaa")
        
    }
}
extension ViewController:UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "myCell", for: indexPath) as! myCell
        cell.layer.cornerRadius = 40
        
        return cell
    }
    

}
extension ViewController: UICollectionViewDelegateFlowLayout{

}

