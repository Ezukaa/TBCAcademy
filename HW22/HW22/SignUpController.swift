//
//  SignUpController.swift
//  HW22
//
//  Created by Macintosh HD on 5/15/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit
import CoreData

class SignUpController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    @IBOutlet weak var userPhotoField: UIImageView!
    @IBOutlet weak var userUserNameField: UITextField!
    @IBOutlet weak var userNameField: UITextField!
    @IBOutlet weak var userLastNameField: UITextField!
    @IBOutlet weak var userEmailField: UITextField!
    @IBOutlet weak var userPassword: UITextField!
    
    let imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(onPhotoSelect))
        userPhotoField.isUserInteractionEnabled = true
        userPhotoField.addGestureRecognizer(tapGesture)
    }
    @objc func onPhotoSelect(){
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        self.present(imagePicker,animated: true)
    }
    
    func createUser(){
        let context = AppDelegate.coreDataContainer.viewContext
        
        let registeredUser:Reg_User = Reg_User(context: context)
        
        registeredUser.userEmail = userEmailField.text ?? ""
        registeredUser.userLastName = userLastNameField.text ?? ""
        registeredUser.userName = userNameField.text ?? ""
        registeredUser.userPassword = userPassword.text ?? ""
        if let binaryImage = userPhotoField.image?.pngData(){
            registeredUser.userPhoto = binaryImage
        }
        registeredUser.userRealName = userUserNameField.text ?? ""
        do{
            try context.save()
            print("Amxela ragac Daseivda")
        }catch {}
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.editedImage] as? UIImage{
            self.userPhotoField.image = image
        }
        self.dismiss(animated:true)
    }
    
    @IBAction func onSignUp(_ sender: UIButton) {
        createUser()
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let mainPage = storyboard.instantiateViewController(withIdentifier: "HomePageController")
//
//        self.navigationController?.pushViewController(mainPage, animated: true)
        self.navigationController?.popViewController(animated: true)
    }
    



}
