//
//  HomePageController.swift
//  HW22
//
//  Created by Macintosh HD on 5/15/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit
import CoreData

class HomePageController: UIViewController, postPageProtocol {
    @IBOutlet weak var tableView: UITableView!
    

    var enteredUser:Reg_User?
    var userPosts = [User_Post]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(postViewCell.nib(), forCellReuseIdentifier: postViewCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
        updatePosts()
        
            }
    
    @IBAction func onAddPostTap(_ sender: UIBarButtonItem) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let postPage = storyboard.instantiateViewController(withIdentifier: "CreatePostController") as! CreatePostController
        postPage.currentUser = enteredUser
        postPage.postProcotol = self
        
        self.navigationController?.pushViewController(postPage, animated: true)
    }
    func updatePosts(){

        //userPosts = (enteredUser?.userPosts as NSArray) as! [User_Post]
        
        if (enteredUser?.userPosts != nil){
        userPosts = enteredUser?.userPosts?.allObjects as! [User_Post]
        }
        tableView.reloadData()
    
}
}
extension HomePageController:UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userPosts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: postViewCell.identifier, for: indexPath) as! postViewCell
        cell.userFullName.text = "\(enteredUser?.userName ?? "") \(enteredUser?.userLastName ?? "")"
        cell.userNote.text = userPosts[indexPath.row].postContent
        cell.noteDate.text = userPosts[indexPath.row].dateOfCreation?.formattedData
        if let imageBinary = enteredUser?.userPhoto{
            cell.userImage.image = UIImage(data: imageBinary)
        }
        
        
        return cell
    }
    
    
}
extension Date{
    var formattedData:String{
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yyyy"
        return formatter.string(from: self)
    }
}
