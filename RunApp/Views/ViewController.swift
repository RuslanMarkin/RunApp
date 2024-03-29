//
//  ViewController.swift
//  RunApp
//
//  Created by Ruslan on 31.01.23.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate{
    
    var locationManager: CLLocationManager!
    var mapView: MKMapView! 
    

    override func viewDidLoad() {
        super.viewDidLoad()
        mapView = MKMapView()
        view.addSubview(mapView)
        
        let button = UIButton()
        button.setTitle("Старт", for: .normal)
        button.animateWhenPressed()
        button.backgroundColor = .black
        button.frame = CGRect(x: 150,
                              y: 600,
                              width: 100,
                              height: 100)
        button.layer.cornerRadius = 25
        button.addTarget(self, action: #selector(RunButtonTapped), for: .touchUpInside)
      
        
        view.addSubview(button)
        
        
        mapView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
        mapView.topAnchor.constraint(equalTo: self.view.topAnchor),
        mapView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
        mapView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
        mapView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        ])
        mapView.showsUserLocation = true
        mapView.userTrackingMode = .follow
        
        
        locationManager = CLLocationManager()
        locationManager.startUpdatingLocation()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.distanceFilter = kCLDistanceFilterNone
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestAlwaysAuthorization()
        monitorGeofences()
    }
    
    func monitorGeofences() {
        if CLLocationManager.isMonitoringAvailable(for: CLCircularRegion.self) {
            let coord = CLLocationCoordinate2D(latitude: 35.58,
                                               longitude: 107.00)
            let region = CLCircularRegion(center: coord,
                                          radius: 100,
                                          identifier: "Geofence1")
            region.notifyOnEntry = true
            region.notifyOnExit = true
            
            locationManager.startMonitoring(for: region)
        }
        
    }
    @objc func RunButtonTapped(){
        mapView.userTrackingMode = .follow
        let runVC = runViewController()
        let navVC = UINavigationController(rootViewController: runVC)
        navVC.modalPresentationStyle = .fullScreen
        present(navVC,animated: true)
        

    }
}



