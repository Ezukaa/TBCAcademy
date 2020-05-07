//
//  CallsViewController.swift
//  HW17
//
//  Created by Macintosh HD on 5/7/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

class CallsViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    let contacts:[Contacts] =
        [Contacts(phoneNumber: "5923123",fromCountry: "Georgia",date: "11/05/2000"),
            Contacts(phoneNumber: "599123123",fromCountry: "Georgia",date: "11/05/2000"),
            Contacts(phoneNumber: "599123",fromCountry: "USA",date: "11/05/2000"),
            Contacts(phoneNumber: "593123",fromCountry: "Russia",date: "11/05/2000"),
            Contacts(phoneNumber: "5123123",fromCountry: "Kazakhstan",date: "11/05/2000"),
            Contacts(phoneNumber: "599123",fromCountry: "France",date: "11/05/2000"),
            Contacts(phoneNumber: "911",fromCountry: "LAPD",date: "13/02/2000"),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self 
        tableView.dataSource = self
        tableView.register(CallsTableViewCell.nib(), forCellReuseIdentifier: CallsTableViewCell.identifier)
    }
    


}

extension CallsViewController:UITableViewDelegate{
    
}
extension CallsViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CallsTableViewCell.identifier, for: indexPath) as! CallsTableViewCell
        let number = contacts[indexPath.row].phoneNumber
        let date = contacts[indexPath.row].date
        let country = contacts[indexPath.row].fromCountry
        
        cell.configure(number: number , country: country, date: date)
        
        
        
        return cell
    }
    

    
}
