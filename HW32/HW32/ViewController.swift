//
//  ViewController.swift
//  HW32
//
//  Created by Macintosh HD on 6/3/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit
import CoreData
import UserNotifications

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var arrayOfDate = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetch()
        
        if !UserDefaults.standard.bool(forKey: "isFirstTime"){
            print("pirveladaa")
            grantAccess()
            UserDefaults.standard.set(true, forKey: "isFirstTime")
        }
        print("Shemovida")
        
        tableView.dataSource = self
        
    }
    
    
    
    
    
    
    
    
    
    
    
    private func grantAccess(){
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.alert,.sound]) { (granted, err) in
            if granted{
                print("egaa")
            }else{
                print("ARAAA")
            }
        }
    }
    private func content() -> UNMutableNotificationContent{
        let content = UNMutableNotificationContent()
        content.title = "Notification"
        content.body = "Esaa Notificacia"
        content.sound = UNNotificationSound.default
        return content
    }
    
    private func getTrigger() -> UNTimeIntervalNotificationTrigger{
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 86400, repeats: true)
        return trigger
    }
    
    
    @IBAction func onCellAdd(_ sender: UIBarButtonItem){

        arrayOfDate.append(currentTime())
        save()
        
        let center = UNUserNotificationCenter.current()
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content(), trigger: getTrigger())
        center.add(request)
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func currentTime() -> String{
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "dd - MM - yy"
        let result = formatter.string(from: date)
        return result
    }
    
    func save(){
        let context = AppDelegate.CoreDataContainer.viewContext
        
        let myTime = MyDate(context: context)
        
        myTime.time = currentTime()
        
        
        
        do{
            try context.save()
            print("SAVED!")
        }catch{print(error.localizedDescription)}
    }
    func fetch(){
        let context = AppDelegate.CoreDataContainer.viewContext
        let request:NSFetchRequest<MyDate> = MyDate.fetchRequest()
        do{
            let result = try context.fetch(request)
            for item in result{
                arrayOfDate.append(item.time ?? "ERROR")
            }
        }catch{print(error.localizedDescription)}
    }
        
}



extension ViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayOfDate.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! TableViewCell
        cell.myLabel.text = arrayOfDate[indexPath.row]
        
        
        return cell
    }
    
    
}
