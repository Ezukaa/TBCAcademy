//
//  ViewController.swift
//  HW48
//
//  Created by Macintosh HD on 6/25/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(doSomething),
                                               name: NSNotification.Name("MainThread"),
                                               object: nil)
    }
    
    

@objc func doSomething(){
    print("movida")
    DispatchQueue.main.async {
        self.tableView.reloadData()
    }
}
    


}
extension ViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! myCell

        
        return cell
    }

    
    
}

