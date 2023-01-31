//
//  UITabBarController .swift
//  RunApp
//
//  Created by Ruslan on 31.01.23.
//

import Foundation
import UIKit

class TabViewController: UITabBarController, UITabBarControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        generateTabBar()
        setTabBarAppearance()
        
    }
    
    private func generateTabBar() {
        viewControllers = [
            generateVC(viewController: ViewController(), title: "Run", image: UIImage(systemName: "map.fill")),
            generateVC(viewController: profileViewController(), title: "Profile", image: UIImage(systemName: "person.fill"))
        ]
                        
        }
    private func generateVC(viewController: UIViewController, title: String, image: UIImage?) ->
    UIViewController {
        viewController.tabBarItem.title = title
        viewController.tabBarItem.image = image
        return viewController
    }
    
    private func setTabBarAppearance() {
        
        let posX: CGFloat = 10
        let posY: CGFloat = 0.1
        
        let width = tabBar.bounds.width - posX * 2
        let height = tabBar.bounds.height - posY * 2
        let roundLayer = CAShapeLayer()
        
        let bezierPath = UIBezierPath(roundedRect: CGRect(x: posX, y: posY, width: width, height: height), cornerRadius: height / 2)
        
        roundLayer.path = bezierPath.cgPath
        tabBar.layer.insertSublayer(roundLayer, at: 0)
        
        tabBar.itemWidth = width / 3
        tabBar.itemPositioning = .centered
        
        roundLayer.fillColor = UIColor.mainWhite.cgColor
        
    }
}
