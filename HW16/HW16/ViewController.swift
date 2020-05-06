//
//  ViewController.swift
//  HW16
//
//  Created by Macintosh HD on 5/6/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var main_letter: UITextView!
    @IBOutlet weak var main_pick_backColor: UIPickerView!
    
    var arrayOfColors = ["TBCColor","Red","Yellow","Green"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        main_pick_backColor.delegate = self
        main_pick_backColor.dataSource = self
        self.navigationItem.hidesBackButton = true
        UDManager.isOnMainPageTrue()
        
        changeBackgroundColor()
        sameMessage()
    }
    
    //ALERT ALERT ALERT
    @IBAction func saveLetter(_ sender: UIButton) {
        if main_letter.text == ""{
            LoginViewController.showAlert(title: "Error", message: "შეავსე", newSelf: self)
        }else{
        UDManager.saveMessage(value: main_letter.text ?? "")
        }
    }
    
    @IBAction func onLogOut(_ sender: UIBarButtonItem) {
        UDManager.isOnMainPageFalse()
        self.navigationController?.popToRootViewController(animated: true)
    }
    
}

extension ViewController:UIPickerViewDelegate{
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return arrayOfColors[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch row {
        case 0:
            UDManager.saveBackColor(value: arrayOfColors[0])
        case 1:
            UDManager.saveBackColor(value: arrayOfColors[1])
        case 2:
            UDManager.saveBackColor(value: arrayOfColors[2])
        case 3:
            UDManager.saveBackColor(value: arrayOfColors[3])
        default:
            print("")
        }
        changeBackgroundColor()
    }
    func changeBackgroundColor(){
        let color = UDManager.getBackColor()
        switch color {
        case "TBCColor":
            self.view.backgroundColor = UIColor(red: 76/255, green: 180/255, blue: 255/255, alpha: 1.0)
        case "Red":
            self.view.backgroundColor = UIColor.red
        case "Yellow":
            self.view.backgroundColor = UIColor.yellow
        case "Green":
            self.view.backgroundColor = UIColor.green
        default:
            print("")
        }
    }
    func sameMessage(){
      main_letter.text = UDManager.getSavedMessage()
    }
}
extension ViewController:UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return arrayOfColors.count
    }
    
    
}

