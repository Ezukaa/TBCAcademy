//
//  ViewController.swift
//  HW53
//
//  Created by Macintosh HD on 7/1/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    var height:Double = 20
    
    var array:[Displayed] = [
        Displayed(image: UIImage(named: "1")!, mainText: "aaaaaa", secText: "bbbbbbbbb"),
        Displayed(image: UIImage(named: "2")!, mainText: "aaaaaa", secText: "bbbbbbbbb"),
        Displayed(image: UIImage(named: "3")!, mainText: "aaaaaa", secText: "bbbbbbbbb"),
        Displayed(image: UIImage(named: "4")!, mainText: "aaaaaa", secText: "bbbbbbbbb"),
        Displayed(image: UIImage(named: "5")!, mainText: "aaaaaa", secText: "bbbbbbbbb"),
        Displayed(image: UIImage(named: "6")!, mainText: "aaaaaa", secText: "bbbbbbbbb"),
        Displayed(image: UIImage(named: "7")!, mainText: "aaaaaa", secText: "bbbbbbbbb"),
        Displayed(image: UIImage(named: "1")!, mainText: "aaaaaa", secText: "bbbbbbbbb"),
        Displayed(image: UIImage(named: "2")!, mainText: "aaaaaa", secText: "bbbbbbbbb")
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("shemovida")
        
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        if let layout = collectionView.collectionViewLayout as? PinterestLayout{
            layout.delegate = self
        }
    }


}
extension ViewController:UICollectionViewDelegate{

}

extension ViewController:UICollectionViewDataSource, PinterestLayoutDelegate{
    func collectionView(_ collectionView: UICollectionView, heightForPhotoAtIndexPath indexPath: IndexPath) -> CGFloat {
        let image = array[indexPath.row].image
        let height = image.size.height + 100
        return height
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return array.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "realCell", for: indexPath) as! myGoodCell
        cell.backgroundColor = UIColor.red
        cell.layer.cornerRadius = 20
        cell.clipsToBounds = true

        cell.image.image = array[indexPath.row].image
        cell.mainTxt.text = array[indexPath.row].mainText
        cell.txt.text = array[indexPath.row].secText
        
        
        
        return cell

    }
}
extension ViewController:UICollectionViewDelegateFlowLayout{
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: 180, height: self.array[indexPath.row].height)
//    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
}

struct Displayed {
    let image:UIImage
    let mainText:String
    let secText:String
//    var height:Double
    
    init(image:UIImage,mainText:String,secText:String) {
        self.image = image
        self.mainText = mainText
        self.secText = secText
        
        
//        self.height = Double(image.size.height) + 90
    }
}

