//
//  ViewController.swift
//  davaleba12
//
//  Created by Macintosh HD on 4/30/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

class ViewController: UIViewController,AddStoryDelegate {
    func editText() {
        <#code#>
    }
    
    

    
    
    var statiebi:[String] = ["Pirveli Statia ari es"]


    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    @IBAction func goToAddStory(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let addStoryPage = storyboard.instantiateViewController(withIdentifier: "AddStory")
       
        if let realAddStoryPage = addStoryPage as? AddStoryViewController{
            realAddStoryPage.delegate = self
        }
        self.navigationController?.pushViewController(addStoryPage, animated: true)
    }
    
    //amit mogvaq info
    func getSomeDataFromThere(story: String) {
        addStatia(statia: story)
        
    }
    
    func addStatia(statia:String){
        statiebi.append(statia)
        tableView.reloadData()
    }
    
    
    @IBAction func scrollUp(_ sender: UIBarButtonItem) {
        tableView.setContentOffset(.zero, animated: true)
    }
}



extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return statiebi.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ChemiCell
        cell.label.text = statiebi[indexPath.row]
        return cell
    }
}


extension ViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let delete = UIContextualAction(style: .destructive, title: "Delete") {(action,view,handler) in
            self.statiebi.remove(at: indexPath.row)
            tableView.reloadData()
        }
        
        let edit = UIContextualAction(style: .normal, title: "Edit") {(action,view,handler) in
//            self.editText(index: self.statiebi.)
            self.goToAddStory((Any).self)

            
//            self.statiebi[indexPath.row] =
            print("amas gavasworeb")
        }
        let config = UISwipeActionsConfiguration(actions: [delete,edit])
        return config
    }
    
}





