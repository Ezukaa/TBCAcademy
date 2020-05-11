//
//  ViewController.swift
//  HW18
//
//  Created by Macintosh HD on 5/8/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

class FirstPageViewController: UIViewController, SecondPageProtocol {
    @IBOutlet weak var tableView: UITableView!
    
    var indexToEdit = -1
    var arrayOFMessages = [
        "აჩვენებს ჩვეულებრივ ვიზუალს სელისას",
        "აჩვენებს მარცხნივ გაწეულ სელს საიდანაც შემიძლია ამოვირჩიო “edit” - რედაქტირება და “delete” წაშლის ღილაკებიდან ერთერთი"
]
    
    let fm = CustomFileManager.shared
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(FirstTableViewCell.nib(), forCellReuseIdentifier: FirstTableViewCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
        
        //fm.createFile(name: "GG", text: "AAAAAAAAA")
        
        
        
    }
    @IBAction func onBarAdd(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let secondPage = storyboard.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        secondPage.secondPGprotocol = self
        
        self.navigationController?.pushViewController(secondPage, animated: true)
    }
    
    func sendData(text: String) {
        if indexToEdit != -1 {
            arrayOFMessages.remove(at: indexToEdit)
            arrayOFMessages.insert(text, at: indexToEdit)
            indexToEdit = -1
        }else{
        arrayOFMessages.append(text)
        }
        tableView.reloadData()
    }
    
}












extension FirstPageViewController:UITableViewDelegate{
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let delete = UIContextualAction(style: .destructive, title: "Delete") {(action,view,handler) in
            self.arrayOFMessages.remove(at: indexPath.row)
            tableView.reloadData()
        }
        
        //winaze aq axali storyboard da obieqti ar shevqmeni da @IBActionshi gavushvi. Romeli xerxi jobia?
        let edit = UIContextualAction(style: .normal, title: "Edit") {(action,view,handler) in
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let secondPage = storyboard.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
            self.indexToEdit = indexPath.row
            secondPage.itemToEdit = self.arrayOFMessages[self.indexToEdit]
            secondPage.secondPGprotocol = self
            
            self.navigationController?.pushViewController(secondPage, animated: true)

        }
        let config = UISwipeActionsConfiguration(actions: [delete,edit])
        return config
    }
    
}
extension FirstPageViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayOFMessages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FirstTableViewCell.identifier, for: indexPath) as! FirstTableViewCell
        
        cell.textDisplayed.text = arrayOFMessages[indexPath.row]
        return cell
        
        
    }
    
    
}



class CustomFileManager{
    let fm = FileManager.default
    
    static let shared = CustomFileManager()
    private init() {}
    
    var mainPath: URL{
        return try! fm.url(for: .applicationSupportDirectory, in: .allDomainsMask, appropriateFor: nil, create: false)
    }
    
    func createDictionary(name:String){
        let path = mainPath.appendingPathComponent(name)
        
        do {
            try fm.createDirectory(at: path, withIntermediateDirectories: false, attributes: nil)
        }catch let err{
            print(err)
        }
    }
    
    func createFile(name:String, text:String){
        let path = mainPath.appendingPathComponent("\(name).txt")
        
        do{
            try text.write(to: path, atomically: true, encoding: .utf8)
        }catch let err{
            print(err)
        }
    }
    func contentsOfURL(url: URL) -> [URL] {
        return try! fm.contentsOfDirectory(at: url, includingPropertiesForKeys: nil, options: .skipsHiddenFiles)
    }
    
    
    
    
    
    
    
    
    
    
    
}
