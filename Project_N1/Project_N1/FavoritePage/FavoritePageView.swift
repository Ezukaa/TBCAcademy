//
//  DetailsPageView.swift
//  Project_N1
//
//  Created by Macintosh HD on 5/26/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit
import CoreData

class FavoritePageView: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var coreDataArray = [FavJobs]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(favPageCell.nib(), forCellReuseIdentifier: favPageCell.identifier)
        tableView.dataSource = self
        tableView.delegate = self
        
        fetch()
    }
    
    func fetch(){
        let context = AppDelegate.CoreDataContainer.viewContext
        let request : NSFetchRequest<FavJobs> = FavJobs.fetchRequest()
        do{
            let result = try context.fetch(request)
            self.coreDataArray = result
        }catch{}
    }
    
    func deleteCoreData(currJob:FavJobs){
        let context = AppDelegate.CoreDataContainer.viewContext
        context.delete(currJob)
        do{
            try context.save()
        }catch{print(error.localizedDescription)}
    }
    
}
extension FavoritePageView: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return coreDataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: favPageCell.identifier, for: indexPath) as! favPageCell
        cell.currentCompany = coreDataArray[indexPath.row]
        if coreDataArray[indexPath.row].compLogo == nil {
            cell.comapyLogo.image = nil
        }
        
        return cell
    }
}
extension FavoritePageView: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let currentJob = self.coreDataArray[indexPath.row]
        if let jobURL = currentJob.url{
            UIApplication.shared.open(URL(string: jobURL)! as URL, options: [:], completionHandler: nil )
        }
    }
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let delete = UIContextualAction(style: .destructive, title: "Delete") {(action,view,handler) in
            

            self.deleteCoreData(currJob: self.coreDataArray[indexPath.row])

            self.coreDataArray.remove(at: indexPath.row)
            

            self.tableView.reloadData()
            
        }
        let config = UISwipeActionsConfiguration(actions: [delete])
        return config
    }
}
