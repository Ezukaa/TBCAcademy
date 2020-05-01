//
//  MeorePage.swift
//  HW13
//
//  Created by Macintosh HD on 5/1/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit
protocol getCarObject {
    func newCarObject(carObject:Car)
    func editCarTable(carObject:Car)
}

class MeorePage: UIViewController {
    @IBOutlet weak var buttonText: UIButton!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var modelTextField: UITextField!
    @IBOutlet weak var priceTextField: UITextField!
    var carDelegate:getCarObject?
    var pictures = ["car1","car2"]
    var picture:String?
    
    //For Editing
    var carToEdit:Car?
    var indexToEdit:Int?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        if indexToEdit != nil{
            buttonText.setTitle("დაედითება", for: .normal)
            editCar()}
    }
    
    @IBAction func addCarButton(_ sender: UIButton) {
        let model = modelTextField.text ?? ""
        let price = Double(priceTextField.text!) ?? 0
        let newCar = Car(model: model,price:price, picture: self.picture ?? "question")
        
        if(indexToEdit != nil) {
            carDelegate?.editCarTable(carObject: newCar)
            indexToEdit = nil
            carToEdit = nil
            self.navigationController?.popViewController(animated: true)
            buttonText.setTitle("დამატება", for: .normal)
        }
        carDelegate?.newCarObject(carObject: newCar)
    }
    func editCar(){
        modelTextField.text = carToEdit?.model
        priceTextField.text = "\(carToEdit?.price ?? 0)"
        
    }
    
    
}







extension MeorePage:UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if(indexPath.row==0){self.picture="car1"}
        else{picture="car2"}
    }
}
extension MeorePage:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PictureCell") as! CellForPicture
        cell.pictureDisplayed.image = UIImage(named: pictures[indexPath.row])
        
        return cell
    }
    
    
}
