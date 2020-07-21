//
//  employeePageController.swift
//  FinalProject
//
//  Created by Macintosh HD on 7/13/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class employeePageController: UIViewController {
    @IBOutlet weak var mapView: MKMapView!
    let locationManager = CLLocationManager()
    
    @IBOutlet weak var fullName: UILabel!
    @IBOutlet weak var phone: UILabel!
    @IBOutlet weak var desc: UILabel!
    @IBOutlet weak var score: UILabel!
    
    var tempName:String = ""
    var tempPhone:String = ""
    var tempDesc:String = ""
    var tempScore:String = ""
    var latitude:Double = 0
    var longitude:Double = 0
    

    
   
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    override func viewDidLoad() {
            super.viewDidLoad()
        
        phone.text = tempPhone
        desc.text  = tempDesc
        score.text = tempScore
        fullName.text = tempName
//            mapView.delegate = self
        checkLocationServices()
    
        }
    func setupLocationManager(){
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }
    
    func checkLocationServices(){
        if CLLocationManager.locationServicesEnabled(){
            setupLocationManager()
            checkLocationAuthorization()
        }else{
            showAlert(title: "charte", message: "charte settingebidan", currSelf: self)
        }
    }
    func checkLocationAuthorization(){
        switch CLLocationManager.authorizationStatus() {
        case .authorizedWhenInUse:
            mapView.showsUserLocation = true
            centerMapView()
            locationManager.startUpdatingLocation()
            addAnotation()
            break
        case .denied:
            showAlert(title: "charte", message: "charte settingebidan", currSelf: self)
            break
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            break
        case .authorizedAlways:
            break
        }
    }
    
    func centerMapView(){
        if let location = locationManager.location?.coordinate{
            let region = MKCoordinateRegion.init(center: location, latitudinalMeters: 5000, longitudinalMeters: 5000)
            mapView.setRegion(region, animated: true)
        }
    }
    
    func addAnotation(){
        let annotation = MKPointAnnotation()
        annotation.coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        annotation.title = tempName
//        annotation.subtitle = "Baki"
        
        self.mapView.addAnnotation(annotation)
    }
    
}
extension employeePageController:CLLocationManagerDelegate{
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else {return}
        
        let center = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        let region = MKCoordinateRegion.init(center: center, latitudinalMeters: 5000, longitudinalMeters: 5000)
        mapView.setRegion(region, animated: true)
    }
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        checkLocationAuthorization()
    }
}





