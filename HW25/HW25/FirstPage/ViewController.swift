//
//  ViewController.swift
//  HW25
//
//  Created by Macintosh HD on 5/20/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    var listOfCountries = [CountriesResponse](){
        didSet{
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
                self.tableView.reloadData()
            })
        }
    }
    
    
    override func viewDidLoad() {
        tableView.register(myTableCell.nib(), forCellReuseIdentifier: myTableCell.identifier)
        tableView.dataSource = self
        searchBar.delegate = self
        
        super.viewDidLoad()
        
    }

}
extension ViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listOfCountries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: myTableCell.identifier, for: indexPath) as! myTableCell
        let bordersString = listOfCountries[indexPath.row].borders.joined(separator: ",")
        let arrayofCurrency = listOfCountries[indexPath.row].currencies
        var currencySymbols = ""
        arrayofCurrency.forEach { (c) in
            currencySymbols += c.symbol ?? ""
        }
        
        
        
        
        cell.countryNameText.text = listOfCountries[indexPath.row].name
        cell.countryCapital.text = listOfCountries[indexPath.row].capital
        cell.borders.text = bordersString
        cell.valutisSimbolo.text = currencySymbols
        return cell
    }
    
    
}

extension ViewController:UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        let responds = APIResponse()
        

        guard let searchBarText = searchBar.text else {return}
        responds.statusCode(countryName: searchBarText, completion: { (contries) in
                print(contries.count)
                self.listOfCountries = contries
                            })
    }
    
}

