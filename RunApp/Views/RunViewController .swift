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
   

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(titleLabel)
        titleLabel.frame = CGRect(x: 160,
                                  y: 100,
                                  width: 200,
                                  height: 200)
//        titleLabel.center = view.center
        titleLabel.textColor = .black
        view.backgroundColor = .white
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

    }
    
    @objc func updateTimer() {
        let timeInterval =  Date().timeIntervalSince(startTime)
        titleLabel.text = timeInterval.stringFromTimeInterval()
    }
    
    @objc private func dismissSelf() {
        dismiss(animated: true)
        
    }
    
    
}
extension TimeInterval{
    
    func stringFromTimeInterval() -> String {
        
        let time = NSInteger(self)
        
        let ms = Int((self.truncatingRemainder(dividingBy: 1)) * 1000)
        let seconds = time % 60
        let minutes = (time / 60) % 60
        let hours = (time / 3600)
        
        return String(format: "%0.2d:%0.2d:%0.2d",hours,minutes,seconds,ms)
        
    }
}

//
//extension runViewController {
//
//}
