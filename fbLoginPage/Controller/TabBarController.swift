//
//  TabBarController.swift
//  fbLoginPage
//
//  Created by Dawa Pakhrin on 25/12/2023.
//

import Foundation
import UIKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpControllers()
    }
    
    private func setUpControllers() {
        let home = HomeController()
        
        
        let video = VideoController()
            
        let nav1 = UINavigationController(rootViewController: home)
        let nav2 = UINavigationController(rootViewController: video)
        home.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), tag: 1)
        video.tabBarItem = UITabBarItem(title: "Video", image: UIImage(systemName: "video.circle"), tag: 2)
    
        
        setViewControllers([nav1, nav2], animated: true)
        
    }
}

//#Preview {
//    TabBarController()
//}

