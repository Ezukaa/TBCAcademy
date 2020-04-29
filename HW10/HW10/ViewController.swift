//
//  ViewController.swift
//  HW10
//
//  Created by Macintosh HD on 4/28/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var count:Int = 0
    var totalMoneyPaid:Int = 0
    var allProductsBought = Set<String>()
    @IBOutlet weak var productCountField: UILabel!
    @IBOutlet weak var productPriceField: UITextField!
    @IBOutlet weak var choosenProduct: UISegmentedControl!
    @IBOutlet weak var choosenCategory: UISegmentedControl!
    @IBOutlet weak var quantityOfSingleProduct: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBAction func addProduct(_ sender: UIButton) {
        if choosenProduct.selectedSegmentIndex != choosenCategory.selectedSegmentIndex{return}
        guard let productQuantity:Int = Int(quantityOfSingleProduct.text!) else{return}
        if let productPrice = Int(productPriceField.text!){
            count+=1
            productCountField.text = String(count)    
            totalMoneyPaid += productPrice * productQuantity
            addProductName()

        }
    }
    func addProductName(){
        switch choosenProduct.selectedSegmentIndex {
        case 0:
            allProductsBought.insert("კაპუსტა")
        case 1:
            allProductsBought.insert("მარწყვი")
        default:
            allProductsBought.insert("ავტომატი")
        }
    }

    
    @IBAction func toSalaroButton(_ sender: Any) {
        let salaroStoryvoard = UIStoryboard(name: "Main", bundle: nil)
        let  salaroVC = salaroStoryvoard.instantiateViewController(withIdentifier: "SalaroViewController") as! SalaroViewController
//        if let realSalariVC = salaroVC as? SalaroViewController{
//            realSalariVC.raodenoma = count
//            realSalariVC.fasi = totalMoneyPaid
//            realSalariVC.allProducts = allProductsBought
//        }
        salaroVC.raodenoma = count
        salaroVC.fasi = totalMoneyPaid
        salaroVC.allProducts = allProductsBought
        self.navigationController?.pushViewController(salaroVC, animated: true)
    }
    
    
    //      romeli jobia?
    //    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    //        if let identifier = segue.identifier{
    //            if identifier == "segue_to_salaro"{
    //                if let destination = segue.destination as? SalaroViewController{
    //                    destination.raodenoma = count
    //                    destination.fasi = totalMoneyPaid
    //                    destination.allProducts = allProductsBought
    //                }
    //            }
    //        }
    //    }
    
    
    
    

}

