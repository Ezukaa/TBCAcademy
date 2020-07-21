//
//  CreditCardController.swift
//  FinalProject
//
//  Created by Macintosh HD on 7/11/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit
import CoreData
import UserNotifications


class CreditCardController: UIViewController {
    @IBOutlet weak var cardBackground: UIView!
    @IBOutlet weak var cardNumber: UITextField!
    @IBOutlet weak var cardHolder: UITextField!
    @IBOutlet weak var cardCVV: UITextField!
    @IBOutlet weak var cardIcon: UIImageView!
    @IBOutlet weak var cardExpiration: UITextField!
    

    @IBOutlet weak var cardColectionView: UICollectionView!
    var savedCreditCards:[CreditCards] = []
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UNUserNotificationCenter.current().delegate = self
        navigationController?.setNavigationBarHidden(false, animated: false)
        
        cardColectionView.delegate = self
        cardColectionView.dataSource = self
        cardColectionView.register(CreditCardCollectionCell.nib(), forCellWithReuseIdentifier: CreditCardCollectionCell.identifier)
        
        fetchCardInfo()
        
      askNotificationPermission()
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        cardNumber.addTarget(self, action: #selector(CreditCardController.textFieldDidChange(_:)), for: .editingChanged)
        cardExpiration.addTarget(self, action: #selector(CreditCardController.exouratuibDidChange(_:)), for: .editingChanged)
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        guard let text = textField.text else{return}
        let count = text.count
        
        if count == 4 || count == 11 || count == 18 {
            textField.text = "\(text) - "
        }
        
        let firstFour:Int = Int(text.prefix(4)) ?? 0
        switch firstFour {
        case 4444,3333:
            cardIcon.image = UIImage(named: "mastercard")
            cardBackground.backgroundColor = .orange
        case 0 :
            return
        default:
            cardIcon.image = UIImage(named: "visa")
            cardBackground.backgroundColor = .blue
        }
        
    }
    
    @objc func exouratuibDidChange(_ textField: UITextField) {
        guard let text = textField.text else{return}
        let count = text.count
        
        if count == 2 {
            textField.text = "\(text) / "
        }
    }
    
    @IBAction func AddCard(_ sender: UIButton) {
        guard let cvv = cardCVV.text, let cardNum = cardNumber.text, let cardExp = cardExpiration.text, let cardHolder = cardHolder.text else{
            return
        }
        if cvv.count != 3 || cardNum.count != 25 || cardExp.count != 7 || cardHolder.count < 3{
            showAlert(title: "sheavse bolomde", message: "informacia arasrulia", currSelf: self)
            return
        }
        
        notification()
//        saveCardInfo()
//        fetchCardInfo()
        
        
//        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
//
//        }
        
//        DispatchQueue.main.async {
//            self.cardColectionView.reloadData()
//        }
    }
    
    func askNotificationPermission(){
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.alert,.sound,.badge]) { (granted, err) in
            print(granted)
        }
    }
    
    func notification(){
        let center = UNUserNotificationCenter.current()
        
        let randomNum = Int.random(in: 1000 ... 9999)

        let content = UNMutableNotificationContent()
        content.title = "titlle"
        content.body = String(randomNum)
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 3, repeats: false)
        
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        
        center.add(request) { (err) in
            print(err ?? "No err")
        }
        self.alertWithTextField(verification: randomNum)
        
    }
    
    func saveCardInfo(){
        guard let cvv = cardCVV.text, let cardNum = cardNumber.text, let cardExp = cardExpiration.text, let cardHolder = cardHolder.text else{
            return
        }
//        if cvv.count != 3 || cardNum.count != 25 || cardExp.count != 7 || cardHolder.count < 3{
//            showAlert(title: "sheavse bolomde", message: "informacia arasrulia", currSelf: self)
//            return
//        }
        
        
        let context = AppDelegate.CoreDataContainer.viewContext
        let creditCard = CreditCards(context: context)
        // aq sul Int iqneba
        creditCard.cardCVV = Int16(cvv)!
        creditCard.cardExpiration = cardExp
        creditCard.cardHolder = cardHolder
        creditCard.cardNum = cardNum
        
        print(cardIcon)
        if cardIcon == UIImage(named: "visa"){
            creditCard.isMaster = false
        }else{
            creditCard.isMaster = true
        }
        
//        clearCardView()

        do{
            try context.save()
            print("saved")
        }catch {print("ver daimaxsovra")}
        print("cleared")
        clearCardView()
    }
    
    func clearCardView(){
        print("clearCardView()")
        self.cardNumber.text = nil
        self.cardCVV.text = nil
        self.cardHolder.text = nil
        self.cardIcon.image = nil
        self.cardExpiration.text = nil
    }
    
    func fetchCardInfo(){
        let context = AppDelegate.CoreDataContainer.viewContext
        let request:NSFetchRequest<CreditCards> = CreditCards.fetchRequest()
        do{
            let result = try context.fetch(request)
            self.savedCreditCards = result
        }catch{print("ver wamoigo info")}
    }
    
    func deleteCard(card:CreditCards){
        let context = AppDelegate.CoreDataContainer.viewContext
        context.delete(card)
        do{
            try context.save()
        }catch{print("ver washala")}
    }
    

    func alertWithTextField(verification:Int){
        let alert = UIAlertController(title: "Add your Card", message: "sheikvane kodi", preferredStyle: .alert)
        
        alert.addTextField()
        
        
        alert.addAction(UIAlertAction(title: "Add", style: .default, handler: { [weak self](action) in
            guard let alertText = alert.textFields?[0].text else{return}
            
            if Int(alertText) ?? 0 == verification{
                self!.saveCardInfo()
                print("card Saved")
                self!.fetchCardInfo()
                DispatchQueue.main.async {
                    self!.cardColectionView.reloadData()
                }
            }else{
                showAlert(title: "Error", message: "araswori kodi", currSelf: self!)
            }
            
            
        }))
        alert.addAction(UIAlertAction(title: "Cancle", style: .cancel, handler: nil))
        
        self.present(alert,animated: true)
    }
    
    
}



extension CreditCardController:UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return savedCreditCards.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CreditCardCollectionCell.identifier, for: indexPath) as! CreditCardCollectionCell
        
        cell.configure(currCard: savedCreditCards[indexPath.row])

        return cell
    }
    
    
}

//mere shecvale 
extension CreditCardController:UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.deleteCard(card: savedCreditCards[indexPath.row])
        savedCreditCards.remove(at: indexPath.row)
        DispatchQueue.main.async {
            collectionView.reloadData()
        }
        print("waishala")
    }
}

extension CreditCardController:UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.cardColectionView.frame.width, height: self.cardColectionView.frame.height)
    }
}


extension CreditCardController: UNUserNotificationCenterDelegate {
    
    //for displaying notification when app is in foreground
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        
        //If you don't want to show notification when app is open, do something here else and make a return here.
        //Even you you don't implement this delegate method, you will not see the notification on the specified controller. So, you have to implement this delegate and make sure the below line execute. i.e. completionHandler.
        
        completionHandler([.alert, .badge, .sound])
    }
    
    // For handling tap and user actions
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        
        switch response.actionIdentifier {
        case "action1":
            print("Action First Tapped")
        case "action2":
            print("Action Second Tapped")
        default:
            break
        }
        completionHandler()
    }
    
}


