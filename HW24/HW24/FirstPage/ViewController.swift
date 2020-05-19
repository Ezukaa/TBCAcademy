//
//  ViewController.swift
//  HW24
//
//  Created by Macintosh HD on 5/19/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    var bands = [Band]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(firstPageCell.nib(), forCellWithReuseIdentifier: firstPageCell.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
        
        getBandsData()
        print("BUILD")
    }
    
    
    
    
    func getBandsData(){
        let url = URL(string: "http://www.mocky.io/v2/5ec3e47a300000e4b039c515")!
        
        URLSession.shared.dataTask(with: url){ (data,res,err) in
            guard let data = data else{return}
            do{
                let decoder = JSONDecoder()
                let bandsResponse = try decoder.decode(BandsResponse.self, from: data)
                self.bands.append(contentsOf: bandsResponse.bands)
                
            }catch{print(error)}
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }.resume()
    }


}

extension ViewController: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let infoPage = storyboard.instantiateViewController(withIdentifier: PageId.infoPage) as! infoPage
        infoPage.index = indexPath.row
        infoPage.info = bands[indexPath.row].info
        infoPage.artist = bands[indexPath.row].name
        self.navigationController?.pushViewController(infoPage, animated: true)
    }
    
}
extension ViewController:UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return bands.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: firstPageCell.identifier, for: indexPath) as! firstPageCell
        cell.bandTitle.text = bands[indexPath.row].name
        bands[indexPath.row].imgURL.downloadImage{(image) in
            DispatchQueue.main.async {
                cell.bandImage.image = image
            }
        }
        return cell
    }
    
    
}
extension ViewController:UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width/2, height: collectionView.frame.width/2)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}

extension String{
    func downloadImage(completion: @escaping (UIImage?)->()){
        guard let url = URL(string: self) else{return}
        URLSession.shared.dataTask(with: url){ (data,res,err) in
            guard let data = data else{return}
            completion(UIImage(data: data))
        }.resume()
    }
}
