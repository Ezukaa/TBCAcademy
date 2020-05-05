//
//  SecondPageViewController.swift
//  HW15
//
//  Created by Macintosh HD on 5/5/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

class SecondPageViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    let dushashArray = [#imageLiteral(resourceName: "dice6"),#imageLiteral(resourceName: "dice3"),#imageLiteral(resourceName: "dice5"),#imageLiteral(resourceName: "dice6"),#imageLiteral(resourceName: "dice4"),#imageLiteral(resourceName: "dice2"),#imageLiteral(resourceName: "dice1"),#imageLiteral(resourceName: "dice5"),#imageLiteral(resourceName: "dice6"),#imageLiteral(resourceName: "dice3")]
    let carArray = [#imageLiteral(resourceName: "car"),#imageLiteral(resourceName: "car3"),#imageLiteral(resourceName: "car5"),#imageLiteral(resourceName: "car1"),#imageLiteral(resourceName: "car2"),#imageLiteral(resourceName: "car"),#imageLiteral(resourceName: "car3"),#imageLiteral(resourceName: "car5")]
    let bookArray = [#imageLiteral(resourceName: "book1"),#imageLiteral(resourceName: "books3"),#imageLiteral(resourceName: "book7"),#imageLiteral(resourceName: "book"),#imageLiteral(resourceName: "book4"),#imageLiteral(resourceName: "book2"),#imageLiteral(resourceName: "book5"),#imageLiteral(resourceName: "book6"),#imageLiteral(resourceName: "book8")]
    
    var realArray = [UIImage]()
    
    var selectedInex:Int!
    
    func whichArray(){
        switch selectedInex {
        case 0:
            realArray = carArray
        case 1:
            realArray = dushashArray
        case 2:
            realArray = bookArray
        default:
            print("OMG")
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 120, height: 120)
        layout.scrollDirection = .horizontal
        collectionView.collectionViewLayout = layout
        
        collectionView.register(SecondPageCollectionCell.nib(), forCellWithReuseIdentifier: "SecondPageCollectionCell")
        collectionView.dataSource = self
        collectionView.delegate = self
        // Do any additional setup after loading the view.
        
        print(selectedInex)
        whichArray()
    }
    



}

extension SecondPageViewController: UICollectionViewDelegate{
    
}
extension SecondPageViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return realArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SecondPageCollectionCell", for: indexPath) as! SecondPageCollectionCell
        cell.configure(with: realArray[indexPath.row])
        return cell
    }
    
    
}
extension SecondPageViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout:
        UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenSize = UIScreen.main.bounds
        return CGSize(width: screenSize.width/2, height: screenSize.width/2)
    }
}
