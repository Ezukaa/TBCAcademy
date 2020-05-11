//
//  ViewController.swift
//  HW19
//
//  Created by Macintosh HD on 5/11/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

class FirstPageViewController: UIViewController, passDataToFirst {
    let cfm = CustomFileManager.shared
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(cfm.mainPath)
        collectionView.register(FirstCollectionViewCell.nib(), forCellWithReuseIdentifier: FirstCollectionViewCell.identifier)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = .red
  
        

    }
    @IBAction func onAddFolder(_ sender: UIBarButtonItem) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let addFolderPage = storyboard.instantiateViewController(withIdentifier: "AddFolder") as! AddFolder
            addFolderPage.directoryProtocol = self
        
        self.navigationController?.pushViewController(addFolderPage, animated: true)
    }
    
    
    func passDirectory(folder: String) {


        if !cfm.dirExists(dir: folder){
        cfm.createDirectory(name: folder)
        }
        collectionView.reloadData()
    }

}

extension FirstPageViewController: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let fullViewPage = storyboard.instantiateViewController(withIdentifier: "FolderFullView") as! FolderFullView
        let arrayOfFolders = cfm.contentsOfURL(url: cfm.mainPath)
        
        fullViewPage.folderName = arrayOfFolders[indexPath.row].lastPathComponent
     
        self.navigationController?.pushViewController(fullViewPage, animated: true)
    }
    
}
extension FirstPageViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let arrayOfFolders = cfm.contentsOfURL(url: cfm.mainPath)
        return arrayOfFolders.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let arrayOfFolders = cfm.contentsOfURL(url: cfm.mainPath)
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FirstCollectionViewCell.identifier, for: indexPath) as! FirstCollectionViewCell
        cell.folderNameDisp.text = arrayOfFolders[indexPath.row].lastPathComponent
        
        return cell
    }
}
extension FirstPageViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width/2 - 20, height: collectionView.frame.width/2 - 20)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
}

