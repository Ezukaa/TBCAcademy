//
//  ViewController.swift
//  Quiz-2
//
//  Created by Macintosh HD on 5/22/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    @IBOutlet weak var guessNumber: UILabel!
    @IBOutlet weak var mySlider: UISlider!
    @IBOutlet weak var resultLabel: UILabel!
    var randNumber = Int.random(in: 1 ... 100)
    
    
    var allChoices = [Guess]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guessNumber.text = "Guess Number \t \(randNumber)"
        
    }
    
    @IBAction func onGuessTap(_ sender: UIButton) {
        let myGuess = Int(mySlider.value)
        var textDisplayed = ""
        let diff = abs(randNumber-myGuess)
        
        
        
        if diff<10{
            textDisplayed = "იდიალური შედეგია"
        }else if diff<20{
            textDisplayed = "საკმაოდ კარგია"
        }else{
            textDisplayed = "ახლოსაც კი არაა"
        }
        resultLabel.text = textDisplayed
        
        
        
        saveData(diffNum: diff, myNumber: myGuess, text: textDisplayed)
        
        randNumber = Int.random(in: 1 ... 100)
        guessNumber.text = "Guess Number \t \(randNumber)"
    }
    
    func saveData(diffNum:Int, myNumber:Int, text:String){
        let context = AppDelegate.coreDataContainer.viewContext
        let guess = Guess(context: context)
        
        guess.gussedNumber = Int16(diffNum)
        guess.realNumber = Int16(myNumber)
        guess.text = text
        do{
            print("Saved")
            try context.save()
        }catch{print(error.localizedDescription)}
    }
    

    
    @IBAction func onNextPageTap(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let resultPage = storyboard.instantiateViewController(withIdentifier: "ResultPageViewController") as! ResultPageViewController
        resultPage.numArray = allChoices
        self.navigationController?.pushViewController(resultPage, animated: true)
    }
    
}




