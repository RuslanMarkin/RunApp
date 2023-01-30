//
//  ViewController.swift
//  RunApp
//
//  Created by Ruslan on 31.01.23.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
        let mapView = MKMapView()
        
        let leftMargin:CGFloat = 6
        let topMargin:CGFloat = 60
        let mapWidth:CGFloat = view.frame.size.width-20
        let mapHeight:CGFloat = 300
        
        mapView.frame = CGRect(x: leftMargin, y: topMargin, width: mapWidth, height: mapHeight)
        
        
        mapView.mapType = MKMapType.standard
        mapView.isZoomEnabled = true
        mapView.isScrollEnabled = true
             
             // Or, if needed, we can position map in the center of the view
        mapView.center = view.center
             
        
        view.addSubview(mapView)

    }
    


}

