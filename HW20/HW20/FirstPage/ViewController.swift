//
//  ViewController.swift
//  HW20
//
//  Created by Macintosh HD on 5/13/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, SecondPageProtocol, filterPageProtocol {
    
    
    
    @IBOutlet weak var tableView: UITableView!
    var podcastArray = [Podcast]()
    //meore variantia totalTime maxInt gaxdes da mere if agar iqneba sachiro.
    var totalTime = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(myCell.nib(), forCellReuseIdentifier: myCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
        
        
        fetch()
    }
    
    func fetch(){
        let context = AppDelegate.CoreDataContainer.viewContext
        let request:NSFetchRequest<Podcast> = Podcast.fetchRequest()
        
        print("AEEE \(totalTime)")
        if(totalTime != 0){
            request.predicate = NSPredicate(format: "duration < \(totalTime)")
        }
        
        
        do{
            let podcasts = try context.fetch(request)
            podcastArray = podcasts
            
        }catch{}
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier, identifier == "page_2_segue"{
            if let destination = segue.destination as? PageAddProduct{
                destination.pSecondProtocol = self
            }
        }else if let identifier = segue.identifier, identifier == "page_filter_segue"{
            if let destination = segue.destination as? filterDataPage{
                destination.pFilterProtocol = self
            }
    }
    }

    func updateTableView() {
        fetch()
        tableView.reloadData()
    }
    
    func passTimeOfFilter(totalTime: Int) {
        self.totalTime = totalTime
        fetch()
        tableView.reloadData()
    }
    
}
extension ViewController:UITableViewDelegate{
    
}
extension ViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return podcastArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: myCell.identifier, for: indexPath) as! myCell
        var timeToStrig = "0:00"
        switch podcastArray[indexPath.row].duration {
        case 30:
            timeToStrig = "0:30"
        case 60:
            timeToStrig = "1:00"
        case 90:
            timeToStrig = "1:30"
        case 120:
            timeToStrig = "2:00"
        case 150:
            timeToStrig = "2:30"
        default:
            print("FirstPageSwitch")
        }
        
        cell.titleField.text = podcastArray[indexPath.row].title
        cell.plotField.text = podcastArray[indexPath.row].plot
        cell.timeField.text = timeToStrig
        return cell
    }
    
    
}

