//
//  SettingsViewController.swift
//  FinalProject
//
//  Created by Macintosh HD on 7/8/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    let settingModel = SettingsModel(images: [#imageLiteral(resourceName: "ic_user"),#imageLiteral(resourceName: "ic_not"),#imageLiteral(resourceName: "ic_location"),#imageLiteral(resourceName: "ic_support"),#imageLiteral(resourceName: "ic_share"),#imageLiteral(resourceName: "ic_logout")],
                                     texts: ["Account","Notifications","Location","Support","Share","Log out"])
    @IBOutlet weak var editBackground: UIView!
    
    @IBOutlet weak var test: UIView!
    
    
    @IBOutlet weak var pageHeader: UILabel!
    
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var userFullName: UILabel!
    @IBOutlet weak var userEmail: UILabel!
    
    @IBOutlet weak var settingsTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        settingsTableView.delegate = self
        settingsTableView.dataSource = self
        
        self.settingsTableView.separatorColor = UIColor.clear
        
        
    }
    override func viewDidLayoutSubviews() {
        super .viewDidLayoutSubviews()
        


        
        
        
        pageHeader.setCharacterSpacing(7)
        userImage.layer.cornerRadius = 30
        editBackground.roundCorners(corners: [.bottomLeft, .bottomRight], radius: 24)
        editBackground.setBackgroundGradient(color1: settingGradientStart, color2: settingGradientEnd)

    }
    
    
    
    
    @IBAction func editName(_ sender: UIButton) {
    }
    


}

extension SettingsViewController:UITableViewDelegate{
    
}
extension SettingsViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settingModel.imageArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = settingsTableView.dequeueReusableCell(withIdentifier: "settingsCell", for: indexPath) as! settingsTableCell
        
        let model = SettingsMVVM(image: settingModel.imageArray[indexPath.row], text: settingModel.textArray[indexPath.row])
        cell.configure(model: model)
        
        return cell
    }
}


