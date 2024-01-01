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
        
        navigationItem.hidesBackButton = true
    }
    
    private func setUpControllers() {
        let home = HomeController()
        
        let video = VideoController()
        let add = AddFriendController()
        let notification = NotificationController()
        let profile = ProfileController()
            
        let nav1 = UINavigationController(rootViewController: home)
        let nav2 = UINavigationController(rootViewController: video)
        let nav3 = UINavigationController(rootViewController: add)
        let nav4 = UINavigationController(rootViewController: notification)
        let nav5 = UINavigationController(rootViewController: profile)
        home.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), tag: 1)
        video.tabBarItem = UITabBarItem(title: "Video", image: UIImage(systemName: "video.circle"), tag: 2)
        add.tabBarItem = UITabBarItem(title: "Friends", image: UIImage(systemName: "person.badge.plus"), tag: 2)
        notification.tabBarItem = UITabBarItem(title: "Notification", image: UIImage(systemName: "bell.badge"), tag: 2)
        profile.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(systemName: "person.and.background.dotted"), tag: 2)
    
        
        setViewControllers([nav1, nav2, nav3, nav4, nav5], animated: true)
        
    }
}

//#Preview {
//    TabBarController()
//}

