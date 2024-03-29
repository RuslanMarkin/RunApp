//
//  RunViewController .swift
//  RunApp
//
//  Created by Ruslan on 02.02.23.
//

import UIKit
import CoreLocation
import MapKit

class runViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate{
    
    var timer:Timer?
    var startTime = Date()
    let titleLabel = UILabel()
    var distance: Double = 0
    var previousLocation: CLLocation?
    let locationManager = CLLocationManager()
    let mapView = MKMapView()
    let distanceLabel = UILabel()
    let timerLabel = UILabel()
    var runs: [Run] = []
    var mapTrack: MKMapView!
    var polyline: MKPolyline?
    var coordinates = [CLLocationCoordinate2D]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Add the map view to the view hierarchy and set its constraints
        mapView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(mapView)
        NSLayoutConstraint.activate([
            mapView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            mapView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mapView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mapView.bottomAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        // Configure the map view to show the user's current location and track their movements
        mapView.showsUserLocation = true
        mapView.userTrackingMode = .follow
        
        // Add a label to display the distance traveled
        distanceLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(distanceLabel)
        distanceLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        distanceLabel.topAnchor.constraint(equalTo: mapView.bottomAnchor, constant: 20).isActive = true
        
        // Add a label to display the timer
        timerLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(timerLabel)
        timerLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        timerLabel.topAnchor.constraint(equalTo: distanceLabel.bottomAnchor, constant: 20).isActive = true
        
        timer = Timer.scheduledTimer(timeInterval: 0.1,
                                     target: self,
                                     selector: (#selector(updateTimer)),
                                     userInfo: nil,
                                     repeats: true)
        view.backgroundColor = .white
        title = "Start Your Run"
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Dismiss",
                                                            style: .done,
                                                            target: self,
                                                            action: #selector(dismissSelf))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Finish",
                                                            style: .done,
                                                            target: self,
                                                            action: #selector(finishRun))
        
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        mapTrack = MKMapView(frame: view.bounds)
        mapTrack.delegate = self
        view.addSubview(mapView)
    }
    
    @objc func updateTimer() {
        let timeInterval = Date().timeIntervalSince(startTime)
        timerLabel.text = timeInterval.stringFromTimeInterval()
        distanceLabel.text = String(format: "%.2f km", distance)
    }
    
    @objc private func dismissSelf() {
        dismiss(animated: true)
    }
    
    @objc private func finishRun() {
        timer?.invalidate()
        locationManager.stopUpdatingLocation()
//        guard let run = self.run else { return }
        let vc = profileViewController()
//        vc.run = run
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let currentLocation = locations.last else { return }
        
        // Update the distance traveled based on the user's current location and previous location
        if let previousLocation = self.previousLocation {
            let distanceInMeters = currentLocation.distance(from: previousLocation)
            distance += distanceInMeters / 1000.0
        }
        self.previousLocation = currentLocation
        coordinates.append(currentLocation.coordinate)
        updatePolyline()
    }
    
    func mapView(_ mapTrack: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        if let polyline = overlay as? MKPolyline {
            let renderer = MKPolylineRenderer(polyline: polyline)
            renderer.strokeColor = .blue
            renderer.lineWidth = 5
            return renderer
        }
        return MKOverlayRenderer()
    }

    func updatePolyline() {
        if coordinates.count > 1 {
            polyline = MKPolyline(coordinates: &coordinates, count: coordinates.count)
            mapView.addOverlay(polyline!)
        }
    }

}
extension TimeInterval{
    
    func stringFromTimeInterval() -> String {
            let time = NSInteger(self)
            let minutes = (time / 60) % 60
            let seconds = time % 60
            let milliseconds = Int((self.truncatingRemainder(dividingBy: 1)) * 100)
            return String(format: "%0.2d:%0.2d.%0.2d",minutes,seconds,milliseconds)
        }
    
    
}

//
//extension runViewController {
//
//}
