//
//  RegUserViewController.swift
//  HW11
//
//  Created by Macintosh HD on 4/29/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

class RegUserViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var users = [User]()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }

    

}

extension RegUserViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
//        cell?.textLabel?.text = "ემაილ: \(users[indexPath.row].email) "
//        return cell!
//    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ChemiTableViewCell
        cell.label.text =  "სახელი: \(users[indexPath.row].name) "
        cell.label1.text = "გვარი: \(users[indexPath.row].lName) "
        cell.label2.text = "ემაილ: \(users[indexPath.row].email) "
        cell.label3.text = "სქესი: \(users[indexPath.row].gender) "
        
        return cell
    }

}
