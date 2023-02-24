//
//  LocationManager.swift
//  RunApp
//
//  Created by Ruslan on 21.02.23.
//

import UIKit
import CoreLocation

//class LocationManager: NSObject, ObservableObject {
//
//
//    static let locationManager = LocationManager()
//    private let locationManager = CLLocationManager()
//
//    @Published var lastLocation: CLLocation?
//    @Published var runLocations: [CLLocation?] = []
//    @Published var runDistances : [CLLocationDistance?] = []
//    @Published var totalDistance: CLLocationDistance = 0.0
//    @Published var currSpeed : CLLocationSpeed = 0.0
//
//    override init() {
//        super.init()
//        locationManager.delegate = self
//        locationManager.desiredAccuracy = kCLLocationAccuracyBest
//        locationManager.requestWhenInUseAuthorization()
//        locationManager.activityType = .fitness
//        locationManager.startUpdatingLocation()
//
//    }
//
//
//    func startRun() {
//
//        let locationsCount = runLocations.count
//
//        if (locationsCount > 1){
//            let locToKeep = runLocations[locationsCount - 1]
//            runLocations.removeAll()
//            runLocations.append(locToKeep)
//        }
//
//        runDistances.removeAll()
//        totalDistance = 0.0
//    }
//
//}
//
//extension LocationManager : CLLocationManagerDelegate {
//    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        guard let location = locations.last else {return}
//
//        lastLocation = location
//        runLocations.append(lastLocation)
//
//        let locationsCount = runLocations.count
//        if (locationsCount > 1){
//
//            self.currSpeed = location.speed
            //print(currSpeed)
//            if let lastLocation = runLocations.last {
//                let delta = location.distance(from: lastLocation!)
//                totalDistance = totalDistance + delta
//            }
//            let newDist = lastLocation?.distance(from:( runLocations[locationsCount - 2] ?? lastLocation)!)
//            runDistances.append(newDist)
//            totalDistance += newDist ?? 0.0
//
//        }
//    }
//
//}
//
