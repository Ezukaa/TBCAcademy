//
//  ViewController.swift
//  Project_N1
//
//  Created by Macintosh HD on 5/26/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    @IBOutlet weak var safeNextPage: UIButton!
    @IBOutlet weak var safePerviousPage: UIButton!
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    var jobsArray = [JobsResponseElement]()
    var coreDataArray = [FavJobs]()
    var currentPage = 1
    
    var jobToSearch = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(FirstPageTableCell.nib(), forCellReuseIdentifier: FirstPageTableCell.identigier)
        tableView.dataSource = self
        tableView.delegate = self
        searchBar.delegate = self
        jobsResponse()
        
        fetch()
        
      
    }
    @IBAction func onPerviousPage(_ sender: UIButton) {
        safeNextPage.isUserInteractionEnabled = true
        if currentPage == 1{
            safePerviousPage.isUserInteractionEnabled = false
            return
        }
        currentPage -= 1
        jobsResponse()
        
    }
    @IBAction func onNextPage(_ sender: UIButton) {
        safePerviousPage.isUserInteractionEnabled = true
        let nextJobsResponse = APIResponse()
        nextJobsResponse.getCountryInfo(page: currentPage+1, desc: jobToSearch) { (jobs) in
            
            if (jobs.count == 0){
                DispatchQueue.main.sync {
                    self.safeNextPage.isUserInteractionEnabled = false
                }
            }else{
                self.currentPage += 1
                self.jobsResponse()
            }
            
            
    }
    }
    
    @IBAction func toFavoritePage(_ sender: UIBarButtonItem) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let favPage = storyboard.instantiateViewController(withIdentifier: "FavoritePageView") as! FavoritePageView
        
        self.navigationController?.pushViewController(favPage, animated: true)
    }
    
    
    func jobsResponse(){
        let jobsResponse = APIResponse()
        jobsResponse.getCountryInfo(page: currentPage, desc: jobToSearch) { (jobs) in
            self.jobsArray = jobs
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    
    func fetch(){
        let context = AppDelegate.CoreDataContainer.viewContext
        let request : NSFetchRequest<FavJobs> = FavJobs.fetchRequest()
        do{
            let result = try context.fetch(request)
            self.coreDataArray = result
        }catch{}
    }
    }

extension ViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.jobsArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FirstPageTableCell.identigier, for: indexPath) as! FirstPageTableCell
        cell.currentCompany = jobsArray[indexPath.row]
        
        return cell
    }
    
}
extension ViewController:UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let detailsPage = storyboard.instantiateViewController(withIdentifier: "DetailedPage") as! DetailedPage
        detailsPage.currentJob = self.jobsArray[indexPath.row]
       
        
        self.navigationController?.pushViewController(detailsPage, animated: true)
    }
    
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let add = UIContextualAction(style: .normal, title: "Add") {(action,view,handler) in
            

            for i in 0..<self.coreDataArray.count{
                if self.coreDataArray[i].id == self.jobsArray[indexPath.row].id{
                    print("udirs")
                    return
                }
            }
            
            let context = AppDelegate.CoreDataContainer.viewContext
            let job = FavJobs(context: context)

            
            job.compName = self.jobsArray[indexPath.row].company
            job.jobLocation = self.jobsArray[indexPath.row].location
            job.jobTitle = self.jobsArray[indexPath.row].title
            job.jobType = self.jobsArray[indexPath.row].type.rawValue
            job.id = self.jobsArray[indexPath.row].id
            job.url = self.jobsArray[indexPath.row].url
            self.jobsArray[indexPath.row].companyLogo?.downloadImage(completion: { (image) in
                job.compLogo = image?.pngData()
            })

            do{
                try context.save()
                print("SAVED!")
                self.fetch()
            }catch{print(error.localizedDescription)}
       }
        let config = UISwipeActionsConfiguration(actions: [add])
        return config
    }
}

extension ViewController:UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard let searchBarText = searchBar.text else {return}
        
        self.jobToSearch = searchBarText
        self.jobsResponse()
        
    }
    
}


