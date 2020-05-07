//
//  SettingsViewController.swift
//  HW17
//
//  Created by Macintosh HD on 5/7/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    let arrayDisplayed = ["Change Name","Change Password", "Log Out"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(SettingsTableViewCell.nib(), forCellReuseIdentifier: SettingsTableViewCell.identifier)
        tableView.dataSource = self
        tableView.delegate = self
    }
    
 

}

extension SettingsViewController:UITableViewDelegate{
    
}
extension SettingsViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayDisplayed.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SettingsTableViewCell.identifier, for: indexPath) as! SettingsTableViewCell
        
        cell.configure(value: arrayDisplayed[indexPath.row])
        return cell
    }
    
    
}
