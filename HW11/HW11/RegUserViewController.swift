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
extension RegUserViewController: UITableViewDelegate{
    
}
extension RegUserViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        cell?.textLabel?.text = "ემაილ: \(users[indexPath.row].email) "
        return cell!
    }

}
