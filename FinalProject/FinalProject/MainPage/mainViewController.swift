//
//  mainViewController.swift
//  FinalProject
//
//  Created by Macintosh HD on 7/7/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

class mainViewController: UIViewController {
    @IBOutlet weak var filterCollectionView: UICollectionView!
    @IBOutlet weak var employeeCollectionView: UICollectionView!
    
    let filterArray = ["Female","Male","Favorites","Else"]
    
    @IBOutlet weak var buttonHireNow: UIButton!
    @IBOutlet weak var buttonToLeft: UIButton!
    @IBOutlet weak var buttonToRight: UIButton!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        employeeCollectionView.delegate = self
        employeeCollectionView.dataSource = self

        
        filterCollectionView.delegate = self
        filterCollectionView.dataSource = self

        
        configureNavigationBar()

    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        buttonToLeft.layer.cornerRadius = 20
        buttonToRight.layer.cornerRadius = 20
        buttonHireNow.layer.cornerRadius = 40
    }
    
    private func configureNavigationBar(){
//        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
//        self.navigationController?.navigationBar.shadowImage = UIImage()
//        self.navigationController?.navigationBar.isTranslucent = true
//        self.navigationController?.view.backgroundColor = UIColor.clear
//        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.black]
        navigationController?.setNavigationBarHidden(true, animated: false)

    }
    
    
    

}
extension mainViewController:UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == employeeCollectionView{
            return
        }
        
        let cell = collectionView.cellForItem(at: indexPath) as! FilterCollectionCell

        
        if cell.backgroundColor == .black{
            cell.backgroundColor = .white
            cell.currFilter.textColor = .black
            
        }else{
            cell.backgroundColor = .black
            cell.currFilter.textColor = .white

        }
        
    }

}
extension mainViewController:UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == employeeCollectionView{
            return 10

        }
        return filterArray.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //firstCell
        if collectionView == employeeCollectionView{
            let employeeCell = employeeCollectionView.dequeueReusableCell(withReuseIdentifier: EmployeeCollectionCell.identifier, for: indexPath) as! EmployeeCollectionCell
            
            employeeCell.employeeImage.layer.cornerRadius = 12
            
            return employeeCell
        }
        
        let cell = filterCollectionView.dequeueReusableCell(withReuseIdentifier: "myCell", for: indexPath) as! FilterCollectionCell
        cell.currFilter.text = filterArray[indexPath.row]
        cell.layer.borderColor = UIColor.black.cgColor
        cell.layer.borderWidth = 1
        cell.layer.cornerRadius = 10
        

        return cell


    }


}
extension mainViewController:UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == employeeCollectionView{
            return CGSize(width: collectionView.bounds.width/2 - 9, height: collectionView.bounds.height/2 - 9)
        }
        
            return CGSize(width: 100, height: 33)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView == employeeCollectionView{
            return 18
        }
        
        return 15
    }
    
    
}

class customTabBar:UITabBarController{
    
}
