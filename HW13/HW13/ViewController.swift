//
//  ViewController.swift
//  HW13
//
//  Created by Macintosh HD on 5/1/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

class ViewController: UIViewController, getCarObject {
    var carsArray = [Car]()
    @IBOutlet weak var tableView: UITableView!
    var ItemToEdit:Car?
    var indexToEdit:Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }
    override func viewDidAppear(_ animated: Bool) {
        tableView.setContentOffset(.zero, animated: true)
    }

    @IBAction func toMeorePageButton(_ sender: AnyObject?) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let merePage = storyboard.instantiateViewController(withIdentifier: "MeorePageID")
        if let unWrappedMeorePage = merePage as? MeorePage{
            unWrappedMeorePage.carDelegate = self
            if ItemToEdit != nil{
                unWrappedMeorePage.carToEdit = ItemToEdit
                unWrappedMeorePage.indexToEdit = self.indexToEdit
            }
            
        }
        self.navigationController?.pushViewController(merePage, animated: true)
    }
    func editCarTable(carObject: Car) {
        carsArray.remove(at: indexToEdit!)
        tableView.reloadData()
        indexToEdit = nil
    }
    func newCarObject(carObject: Car) {
        carsArray.append(carObject)
        tableView.reloadData()
    }
    @IBAction func scrollUP(_ sender: UIButton) {
        //shemowmeba ar chirdeba :D
        tableView.setContentOffset(.zero, animated: true)

    }
    @IBAction func scrollDown(_ sender: UIButton) {
        if(carsArray.count==0){return}
        let indexPath = IndexPath(row: carsArray.count-1, section: 0)
        tableView.scrollToRow(at: indexPath, at: .bottom, animated: true)
    }
}






extension ViewController:UITableViewDelegate{
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let delete = UIContextualAction(style: .destructive, title: "Delete") {(action,view,handler) in
            self.carsArray.remove(at: indexPath.row)
            tableView.reloadData()
        }
        
        let edit = UIContextualAction(style: .normal, title: "Edit") {(action,view,handler) in
//            self.goToAddStory((Any).self)
                self.ItemToEdit = self.carsArray[indexPath.row]
                self.indexToEdit = indexPath.row
            self.toMeorePageButton(nil)
        }
        let config = UISwipeActionsConfiguration(actions: [delete,edit])
        return config
    }
    
}
extension ViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return carsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewCellID", for: indexPath) as! NewCell
        cell.modelLabel.text = "მოდელი: \(carsArray[indexPath.row].model)"
        cell.priceLabel.text = "ფასი: \(carsArray[indexPath.row].price) $"
        cell.carPictyre.image = UIImage(named: carsArray[indexPath.row].picture)
        return cell
    }
}

