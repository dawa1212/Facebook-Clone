//
//  AppDelegate.swift
//  fbLoginPage
//
//  Created by Dawa Pakhrin on 22/11/2023.
//

import UIKit
import Firebase
@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        FirebaseApp.configure()
        // Override point for customization after application launch.
//         navAppearance()
        return true
    }


    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }

    
//    private func navAppearance() {
//        
//        let appearance = UINavigationBarAppearance()
//        
//        let navigationBarAppearace = UINavigationBar.appearance()
//        appearance.titleTextAttributes =  [NSAttributedString.Key.foregroundColor: UIColor.blue]
//        appearance.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.systemBlue]
//        navigationBarAppearace.tintColor = .blue
//        navigationBarAppearace.barTintColor = .systemBlue
//        navigationBarAppearace.standardAppearance = appearance
//        
//        navigationBarAppearace.scrollEdgeAppearance = appearance
//        navigationBarAppearace.prefersLargeTitles = true
//    }

}

