//
//  FolderFullView.swift
//  HW19
//
//  Created by Macintosh HD on 5/11/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

class FolderFullView: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    let cfm = CustomFileManager.shared
    var folderName:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(secondPageTWCell.nib(), forCellReuseIdentifier: secondPageTWCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
        
         
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        tableView.reloadData()
    }
    
    @IBAction func onAddFile(_ sender: UIBarButtonItem) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let addFilePage = storyboard.instantiateViewController(withIdentifier: "AddFile") as! AddFile
        addFilePage.folder = folderName ?? ""
        
        self.navigationController?.pushViewController(addFilePage, animated: true)
    }
}

extension FolderFullView: UITableViewDelegate{
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        var arrayOfFiles = cfm.contentsOfURL(url: cfm.filePath(name: folderName ?? ""))
        let delete = UIContextualAction(style: .destructive, title: "Delete") {(action,view,handler) in
            self.cfm.removeFile(url: arrayOfFiles[indexPath.row])
            tableView.reloadData()
            print(arrayOfFiles[indexPath.row].lastPathComponent)
        }
        
        let edit = UIContextualAction(style: .normal, title: "Edit") {(action,view,handler) in
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let addFilePage = storyboard.instantiateViewController(withIdentifier: "AddFile") as! AddFile
            let arrayOfFiles = self.cfm.contentsOfURL(url: self.cfm.filePath(name: self.folderName ?? ""))
            addFilePage.folder = self.folderName ?? ""
            addFilePage.fileToEdit = arrayOfFiles[indexPath.row].lastPathComponent

            
            self.navigationController?.pushViewController(addFilePage, animated: true)
            
            
            
            
        }
        let config = UISwipeActionsConfiguration(actions: [delete,edit])
        return config
    }
    
}
extension FolderFullView:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let folderPath = folderName ?? ""
    
        let arrayOfFiles = cfm.contentsOfURL(url: cfm.filePath(name: folderPath))
        return arrayOfFiles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: secondPageTWCell.identifier, for: indexPath) as! secondPageTWCell
        let folderPath = folderName ?? ""
        let arrayOfFiles = cfm.contentsOfURL(url: cfm.filePath(name: folderPath))
        
        cell.textDisplayed.text = try! String(contentsOf: arrayOfFiles[indexPath.row], encoding: .utf8)
            
        return cell
    }
    
    
}
