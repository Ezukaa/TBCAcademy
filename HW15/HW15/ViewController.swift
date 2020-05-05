//
//  ViewController.swift
//  HW15
//
//  Created by Macintosh HD on 5/5/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var mainImage: UIImageView!
    
    var pictureArray = [#imageLiteral(resourceName: "car"),#imageLiteral(resourceName: "dice6"),#imageLiteral(resourceName: "book") ]
    var selectedPicture = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(MyCollectionViewCell.nib(), forCellWithReuseIdentifier: MyCollectionViewCell.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
        
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(onImageTap))
        mainImage.isUserInteractionEnabled = true
        mainImage.addGestureRecognizer(tapGesture)
        
    }
    
    
    
    
    @objc func onImageTap(){
    print("Daewira")
        
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let secondPage = storyBoard.instantiateViewController(withIdentifier: "SecondPageID") as! SecondPageViewController
        
        switch selectedPicture {
        case -1:
            showAlert(title: "Ras aketeb??", message: "Surati Monishne")
        default:
           secondPage.selectedInex = selectedPicture
        }
        
        self.navigationController?.pushViewController(secondPage, animated: true)
    }
    
    func showAlert(title:String, message:String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Gavige", style: .cancel, handler: nil))
        self.present(alert,animated: true)
    }
}

extension ViewController: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        print("You tapped me")
        selectedPicture = indexPath.row
        mainImage.image = pictureArray[indexPath.row]
    }
}
extension ViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pictureArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyCollectionViewCell.identifier, for: indexPath) as! MyCollectionViewCell
        
        cell.configure(with: pictureArray[indexPath.row])
        
        return cell
    }
    
    
}
//extension ViewController: UICollectionViewDelegateFlowLayout{
//    
//}

