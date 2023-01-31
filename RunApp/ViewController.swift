//
//  ViewController.swift
//  RunApp
//
//  Created by Ruslan on 31.01.23.
//

import UIKit
import MapKit
import CoreLocation



class ViewController: UIViewController {
    
    var locationManager: CLLocationManager!
    var mapView: MKMapView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        mapView = MKMapView()
        self.view.addSubview(mapView)
        
        let button = UIButton(frame: CGRect.init(x: self.view.frame.size.width*0.10,
                                                 y: self.view.frame.size.height*0.10,
                                                 width: self.view.frame.size.width*0.80,
                                                 height: self.view.frame.size.height*0.05))
//        button.topAnchor.constraint
        button.backgroundColor = .red
        button.setTitle("Submit", for: .normal)
        button.setTitle("Update", for: .selected)
        self.view.addSubview(button)
        mapView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
        mapView.topAnchor.constraint(equalTo: self.view.topAnchor),
        mapView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
        mapView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
        mapView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        ])
        
        mapView.showsUserLocation = true
        locationManager = CLLocationManager()
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestAlwaysAuthorization()
        monitorGeofences()
    
        
    }
    func monitorGeofences() {
        if CLLocationManager.isMonitoringAvailable(for: CLCircularRegion.self) {
            let coord = CLLocationCoordinate2D(latitude: 35.58, longitude: 107.00)
            let region = CLCircularRegion(center: coord, radius: 100, identifier: "Geofence1")
            region.notifyOnEntry = true
            region.notifyOnExit = true
            
            locationManager.startMonitoring(for: region)
        }
        
    }
    
    @IBAction func btnSubmitClick(sender:UIButton){
        sender.isSelected = !sender.isSelected
        print("button state", sender.isSelected)

        }
}



