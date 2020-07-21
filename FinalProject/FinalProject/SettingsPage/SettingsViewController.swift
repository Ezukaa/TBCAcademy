//
//  SettingsViewController.swift
//  FinalProject
//
//  Created by Macintosh HD on 7/8/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit
import CoreData

class SettingsViewController: UIViewController {
    
    let settingModel = SettingsModel(images: [#imageLiteral(resourceName: "ic_user"),#imageLiteral(resourceName: "ic_not"),#imageLiteral(resourceName: "ic_location"),#imageLiteral(resourceName: "ic_support"),#imageLiteral(resourceName: "ic_share"),#imageLiteral(resourceName: "ic_logout")],
                                     texts: ["Account","Notifications","Location","Support","Payment","Log out"])
    var currentUser:[AppUser]?
    
    @IBOutlet weak var editBackground: UIView!
    
    @IBOutlet weak var test: UIView!
    
    
    @IBOutlet weak var pageHeader: UILabel!
    
    @IBOutlet weak var userImage: UIImageView!

    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var userEmail: UITextField!
    
    
    @IBOutlet weak var settingsTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        settingsTableView.delegate = self
        settingsTableView.dataSource = self
        
        self.settingsTableView.separatorColor = UIColor.clear
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector (onUserImageTap))
        
        userImage.isUserInteractionEnabled = true
        userImage.addGestureRecognizer(tapGesture)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        fetchUserInfo()
//        instantiateUser()
        
        
        userName.isUserInteractionEnabled = false
        userEmail.isUserInteractionEnabled = false
        navigationController?.setNavigationBarHidden(true, animated: false)    }
    
    override func viewDidLayoutSubviews() {
        super .viewDidLayoutSubviews()
        

        pageHeader.setCharacterSpacing(7)
        userImage.layer.cornerRadius = 30
        editBackground.roundCorners(corners: [.bottomLeft, .bottomRight], radius: 24)
        editBackground.setBackgroundGradient(color1: settingGradientStart, color2: settingGradientEnd)

    }
    
    
    

    @IBOutlet weak var doneButton: UIButton!
    
    @IBAction func editName(_ sender: UIButton) {
        userEmail.isUserInteractionEnabled = true
        userName.isUserInteractionEnabled  = true
        
        UIView.animate(withDuration: 1) {
            self.doneButton.alpha = self.doneButton.alpha == 1 ? 0 : 1
        }
    }
    
    @IBAction func onDoneTap(_ sender: UIButton) {
        userEmail.isUserInteractionEnabled = false
        userName.isUserInteractionEnabled  = false
        
        saveUserInfo()
        
        NotificationCenter.default.post(name: NSNotification.Name("ertaderti"), object: nil)
        
        UIView.animate(withDuration: 1) {
            self.doneButton.alpha = self.doneButton.alpha == 1 ? 0 : 1
        }
    }
    
    @objc func onUserImageTap(){
        let imagePicker = UIImagePickerController()
        
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        self.present(imagePicker,animated: true)
    }
    
//    func instantiateUser(){
//        guard let email = currentUser?.userEmail, let fullName = currentUser?.fullName, let image = currentUser?.userPic else {return}
//
//        userImage.image = UIImage(data: image)
//        userImage.clipsToBounds = true
//        self.userEmail.text = email
//        self.userName.text = fullName
//    }
//
//    func fetchUserInfo(){
//        let context = AppDelegate.CoreDataContainer.viewContext
//        let request:NSFetchRequest<AppUser> = AppUser.fetchRequest()
//        do{
//            let result = try context.fetch(request)
//            print(result.count)
//            if result.count == 2{
//                self.deleteUserInfo(currUser: result[0])
//            }
//            print(result.count)
//            if result.count != 0 && result.count == 1{
//            self.currentUser = result[0]
//            }
//
//
//        }catch{print("ver wamoigo info")}
//    }
////
//    func saveUserInfo(){
//        let context = AppDelegate.CoreDataContainer.viewContext
//        let appUser = AppUser(context: context)
//
//        appUser.fullName = userName.text
//        appUser.userEmail = userEmail.text
//        if let binartImage = self.userImage.image?.pngData(){
//            appUser.userPic = binartImage
//        }
//
//        do{
//            try context.save()
//            print("saved")
//        }catch {print("ver daimaxsovra")}
//    }
//    func deleteUserInfo(currUser:AppUser){
//        let context = AppDelegate.CoreDataContainer.viewContext
//        context.delete(currUser)
//        do{
//            try context.save()
//        }catch{print("ver washala")}
//    }
    
        func saveUserInfo(){
            let context = AppDelegate.CoreDataContainer.viewContext
            let appUser = AppUser(context: context)
    
            appUser.fullName = userName.text
            appUser.userEmail = userEmail.text
            if let binartImage = self.userImage.image?.pngData(){
                appUser.userPic = binartImage
            }
    
            do{
                try context.save()
                print("saved")
            }catch {print("ver daimaxsovra")}
        }
        func deleteUserInfo(currUser:AppUser){
            let context = AppDelegate.CoreDataContainer.viewContext
            context.delete(currUser)
            do{
                try context.save()
            }catch{print("ver washala")}
        }
        func fetchUserInfo(){
            let context = AppDelegate.CoreDataContainer.viewContext
            let request:NSFetchRequest<AppUser> = AppUser.fetchRequest()
            do{
                let result = try context.fetch(request)
                
                if result.count != 0 {
                self.userEmail.text = result.last?.userEmail
                self.userName.text = result.last?.fullName
                    if let imageBinart = result.last?.userPic{
                        self.userImage.image = UIImage(data: imageBinart)
                        self.userImage.clipsToBounds = true
                    }
                }
    
    
            }catch{print("ver wamoigo info")}
        }
    
    

   
    

}
extension SettingsViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.editedImage] as? UIImage{
            self.userImage.image = image
            self.userImage.clipsToBounds = true
        }
        self.dismiss(animated: true, completion: nil)
    }
}


extension SettingsViewController:UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        
        if indexPath.row == 4 {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let cardPage = storyboard.instantiateViewController(withIdentifier: creditCardPage) as! CreditCardController
            
            self.navigationController?.pushViewController(cardPage, animated: true)
        }
    }
    
}
extension SettingsViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settingModel.imageArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = settingsTableView.dequeueReusableCell(withIdentifier: "settingsCell", for: indexPath) as! settingsTableCell
        
        let model = SettingsMVVM(image: settingModel.imageArray[indexPath.row], text: settingModel.textArray[indexPath.row])
        cell.configure(model: model)
        
        return cell
    }
}


