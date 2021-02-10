//
//  AppDelegate.swift
//  Black Star Wear
//
//  Created by Ivan on 09.02.2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        print(NSHomeDirectory())
        window = UIWindow(frame: UIScreen.main.bounds)
        AppCoordinator.shared.window = window
        AppCoordinator.shared.start()
        window?.makeKeyAndVisible()
        return true
    }
    
}

