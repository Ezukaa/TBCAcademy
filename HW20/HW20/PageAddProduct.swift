//
//  PageAddProduct.swift
//  HW20
//
//  Created by Macintosh HD on 5/13/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit
import CoreData
protocol SecondPageProtocol {
    func updateTableView()
}

class PageAddProduct: UIViewController {
    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var plotField: UITextView!
    @IBOutlet weak var pickerView: UIPickerView!
    let pickerViewContent = ["0:30","1:00","1:30","2:00","2:30"]
    var pickerToTime:Int = 0
    var pSecondProtocol:SecondPageProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerView.delegate = self
        pickerView.dataSource = self
        
    }
    
    @IBAction func onAddProduct(_ sender: UIButton) {
        save()
        pSecondProtocol?.updateTableView()
    }
    func save(){
        let context = AppDelegate.CoreDataContainer.viewContext
        let entityDescription = NSEntityDescription.entity(forEntityName: "Podcast", in: context)
        let podcast = Podcast(entity:entityDescription!, insertInto:context)
        
        podcast.title = titleField.text ?? ""
        podcast.duration = Int16(pickerToTime)
        podcast.plot = plotField.text ?? ""
        
        do{
            try context.save()
            print("SAVED!")
        }catch{print("AUUU")}
        
        titleField.text = ""
        plotField.text = ""
        
    }
    
    
    
    
    
}





extension PageAddProduct:UIPickerViewDelegate{
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch row {
        case 0:
            pickerToTime = 30
        case 1:
            pickerToTime = 60
        case 2:
            pickerToTime = 90
        case 3:
            pickerToTime = 120
        case 4:
            pickerToTime = 150
        default:
            print("Switch has problem")
        }

        return pickerViewContent[row]
        
    }
}
extension PageAddProduct:UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 5
    }
}
