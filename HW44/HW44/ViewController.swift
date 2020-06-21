//
//  ViewController.swift
//  HW44
//
//  Created by Macintosh HD on 6/18/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {
    @IBOutlet weak var cloudImage: UIImageView!
    @IBOutlet weak var countryName: UILabel!
    @IBOutlet weak var currTemp: UILabel!
    @IBOutlet weak var skyCondition: UILabel!
    @IBOutlet weak var humidity: UILabel!
    @IBOutlet weak var pressure: UILabel!
    @IBOutlet weak var maxTemp: UILabel!
    @IBOutlet weak var minTemp: UILabel!
    @IBOutlet weak var customButtom: UIButton!
    
    
    
    let locationManager = CLLocationManager()
    
    override func loadView() {
        super.loadView()
        customButtom.layer.cornerRadius = 15
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        print("Shemovida?")
        checkGPSAccess()
        let nav = self.navigationController?.navigationBar
        nav?.barStyle = UIBarStyle.black
        nav?.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    }

    private func checkGPSAccess(){
        if CLLocationManager.locationServicesEnabled(){
            print("Chartulia")
            localLocationAccess()
            checkLocationAccessStatus()
        }else{
            print("araa chartuli")
        }
    }
    
    
    private func localLocationAccess(){
        locationManager.delegate = self
        //Best uketesi iqneba magram met elements waigebs es jobia am shemtxvevashi
        locationManager.desiredAccuracy = kCLLocationAccuracyThreeKilometers
        
    }
    
    private func checkLocationAccessStatus(){
        switch CLLocationManager.authorizationStatus() {
        case .notDetermined:
            //locationManager.requestWhenInUseAuthorization()
            locationManager.requestAlwaysAuthorization()
        case .authorizedWhenInUse:
            locationManager.startUpdatingLocation()
        case .restricted:
            break
        case .denied:
            break
        case .authorizedAlways:
            break
        }
    }
    
    
}

extension ViewController:CLLocationManagerDelegate{
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let lat:Double = locations.last!.coordinate.latitude
        let lon:Double = locations.last!.coordinate.longitude
        let a = getAPI()
        let returnedInfo:WeatherResponse = a.parseWeater(lat: lat, lon: lon)
        let displayInfo = სწორად_ვაკეთებ_კითხვაა(displayInfo: returnedInfo)
                    DispatchQueue.main.async {
                        self.countryName.text = displayInfo.countryName
                        self.currTemp.text = displayInfo.currTemp
                        self.skyCondition.text = displayInfo.skyCondition
                        self.humidity.text = displayInfo.humidity
                        self.pressure.text = displayInfo.pressure
                        self.minTemp.text = displayInfo.minTemp
                        self.maxTemp.text = displayInfo.maxTemp
                    }
        
        
        
//        a.parseWeater(lat: lat, lon: lon) { (WeatherResponse) in
//            let displayInfo = სწორად_ვაკეთებ_კითხვაა(displayInfo: WeatherResponse)
//
//            DispatchQueue.main.async {
//                self.countryName.text = displayInfo.countryName
//                self.currTemp.text = displayInfo.currTemp
//                self.skyCondition.text = displayInfo.skyCondition
//                self.humidity.text = displayInfo.humidity
//                self.pressure.text = displayInfo.pressure
//                self.minTemp.text = displayInfo.minTemp
//                self.maxTemp.text = displayInfo.maxTemp
//            }
//
//        }
    }
    
}

