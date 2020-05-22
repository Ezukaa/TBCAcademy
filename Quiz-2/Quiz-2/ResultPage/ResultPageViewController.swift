//
//  ResultPageViewController.swift
//  Quiz-2
//
//  Created by Macintosh HD on 5/22/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit
import CoreData

class ResultPageViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var numArray = [Guess]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(myCell.nib(), forCellReuseIdentifier: myCell.identifier)
        tableView.dataSource = self
        print(numArray)
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        fetchData()
    }
    func fetchData(){
        let context = AppDelegate.coreDataContainer.viewContext
        let request:NSFetchRequest<Guess> = Guess.fetchRequest()
        do{
            print("SHEMOVIDA")
            let result = try context.fetch(request)
            numArray = result
            tableView.reloadData()
        }catch{print(error.localizedDescription)}
    }
    
}
extension ResultPageViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: myCell.identifier, for: indexPath) as! myCell
        
        cell.resultText.text = numArray[indexPath.row].text
        cell.resultPoint.text = "\(numArray[indexPath.row].gussedNumber)/\(numArray[indexPath.row].realNumber)"
        
        return cell
    }
    
    
    
}
