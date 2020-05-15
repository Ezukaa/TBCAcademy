//
//  CreatePostController.swift
//  HW22
//
//  Created by Macintosh HD on 5/15/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit
import CoreData

protocol postPageProtocol {
    func updatePosts()
}

class CreatePostController: UIViewController {
    @IBOutlet weak var userPostField: UITextView!
    var currentUser:Reg_User?
    var postProcotol: postPageProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(currentUser?.userName)
        // Do any additional setup after loading the view.
    }
    


    @IBAction func onAddPostTap(_ sender: UIButton) {
        addPost()
    }
    
    func addPost(){
        let context = AppDelegate.coreDataContainer.viewContext
        let entityDescription = NSEntityDescription.entity(forEntityName: "User_Post", in: context)
        let post = User_Post(entity: entityDescription!, insertInto: context)
        post.user = currentUser
        
        post.dateOfCreation = Date()
        post.postContent = userPostField.text ?? ""
        
        
        
        
        do{
            try context.save()
            print("Post Saved")
            postProcotol?.updatePosts()
        }catch{}
    }
    
    
    
}
