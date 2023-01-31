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
    
        
    }
//
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//
//
//        let mapView = MKMapView()
//
//        let leftMargin:CGFloat = 60
//        let topMargin:CGFloat = 60
//        let mapWidth:CGFloat = view.frame.size.width
//        let mapHeight:CGFloat = 870
//        mapView.frame = CGRect(x: leftMargin, y: topMargin, width: mapWidth, height: mapHeight)
//
//
//        mapView.mapType = MKMapType.standard
//        mapView.isZoomEnabled = true
//        mapView.isScrollEnabled = true
//             // Or, if needed, we can position map in the center of the view
//        mapView.center = view.center
//        view.addSubview(mapView)

    


}

