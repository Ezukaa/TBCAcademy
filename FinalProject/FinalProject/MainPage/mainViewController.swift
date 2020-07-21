//
//  mainViewController.swift
//  FinalProject
//
//  Created by Macintosh HD on 7/7/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit
import CoreData

class mainViewController: UIViewController {
    @IBOutlet weak var filterCollectionView: UICollectionView!
    @IBOutlet weak var employeeCollectionView: UICollectionView!
    
    let filterArray = ["Female","Male","Favorites","Else"]
    
    @IBOutlet weak var buttonHireNow: UIButton!
    @IBOutlet weak var buttonToLeft: UIButton!
    @IBOutlet weak var buttonToRight: UIButton!
    
    var employeeArray: [JobsDetailedResponse] = []
    
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var userName: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(didGetNotification(_:)),
            name: NSNotification.Name("ertaderti"),
            object: nil)
        fetchUserInfo()
        
        employeeCollectionView.delegate = self
        employeeCollectionView.dataSource = self

        
        filterCollectionView.delegate = self
        filterCollectionView.dataSource = self
        
        JSONParse.Shared.parseJson { [weak self](jsonResponse:[JobsDetailedResponse]) in
            self?.employeeArray = jsonResponse
            print(jsonResponse[0].name)
            
            DispatchQueue.main.async {
                self?.employeeCollectionView.reloadData()
            }
        }

    }
    
    @objc func didGetNotification(_ notification:Notification){
        //let text = notification.object as! String?
        print("movida notif")
        fetchUserInfo()
    }
    func fetchUserInfo(){
        let context = AppDelegate.CoreDataContainer.viewContext
        let request:NSFetchRequest<AppUser> = AppUser.fetchRequest()
        do{
            let result = try context.fetch(request)
            
            if result.count != 0 {
                self.userName.text = result.last?.fullName
                if let imageBinart = result.last?.userPic{
                    self.userImage.image = UIImage(data: imageBinart)
                    self.userImage.clipsToBounds = true
                }
            }
            
            
        }catch{print("ver wamoigo info")}
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
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
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let mapPage = storyboard.instantiateViewController(withIdentifier: mapPageID) as! employeePageController
            
            mapPage.tempPhone = "Phone: \(employeeArray[indexPath.row].phone)"
            mapPage.tempDesc  = "Desc: \(employeeArray[indexPath.row].intro)"
            mapPage.tempName  = "\(employeeArray[indexPath.row].name) \(employeeArray[indexPath.row].lastName)"
            mapPage.tempScore = "Stars: \(employeeArray[indexPath.row].rating)/5"
            mapPage.longitude = employeeArray[indexPath.row].longitude
            mapPage.latitude  = employeeArray[indexPath.row].latitude
            
//            mapPage.configure(thisEmployee: employeeArray[indexPath.row])
            
            
            self.navigationController?.pushViewController(mapPage, animated: true)
            
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
            return employeeArray.count

        }
        return filterArray.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //firstCell
        if collectionView == employeeCollectionView{
            let employeeCell = employeeCollectionView.dequeueReusableCell(withReuseIdentifier: EmployeeCollectionCell.identifier, for: indexPath) as! EmployeeCollectionCell
            
            employeeCell.employeeImage.layer.cornerRadius = 12
            employeeCell.configure(currEmployee: employeeArray[indexPath.row])
            
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
