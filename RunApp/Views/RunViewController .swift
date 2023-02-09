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

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Start Your Run"
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Dismiss",
                                                            style: .done,
                                                            target: self,
                                                            action: #selector(dismissSelf))

    }
    
    @objc private func dismissSelf() {
        dismiss(animated: true)
        
    }
    
}
