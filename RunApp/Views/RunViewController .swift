//
//  RunViewController .swift
//  RunApp
//
//  Created by Ruslan on 02.02.23.
//

//import Foundation
//import UIKit
//import CoreLocation
//import MapKit
//
//class runViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate{
//
//    var locationManager: CLLocationManager!
//    var mapView: MKMapView!
//
//
//    override func viewDidLoad() {
//
//        super.viewDidLoad()
//        mapView = MKMapView()
//        self.view.addSubview(mapView)
//
//        let button = UIButton()
//        button.setTitle("Старт", for: .normal)
//        button.backgroundColor = .black
//        button.frame = CGRect(x: 70, y: 600, width: 100, height: 100)
//        button.layer.cornerRadius = 25
//        self.view.addSubview(button)
////
//
//        mapView.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            mapView.topAnchor.constraint(equalTo: self.view.topAnchor),
//            mapView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
//            mapView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
//            mapView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
//        ])
//        mapView.showsUserLocation = true
//        mapView.userTrackingMode = .follow
//
//
//        locationManager = CLLocationManager()
//        locationManager.startUpdatingLocation()
//        locationManager.desiredAccuracy = kCLLocationAccuracyBest
//        locationManager.distanceFilter = kCLDistanceFilterNone
//        locationManager.requestWhenInUseAuthorization()
//        locationManager.requestAlwaysAuthorization()
//
//    }
//    
//}
