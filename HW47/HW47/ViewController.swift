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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(myCell.nib(), forCellWithReuseIdentifier: myCell.identifier)
        collectionView.dataSource = self
        collectionView.delegate = self
    }


}

extension ViewController:UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: myCell.identifier, for: indexPath) as! myCell
        
        
        return cell
    }
    
    
}
extension ViewController:UICollectionViewDelegate{
    
}

extension ViewController:UICollectionViewDelegateFlowLayout{
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: view.frame.width/3, height: collectionView.frame.height)
//    }
}

