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
        
        let mainNavigationController = MainNavigationController()
        let assemblyBuilder = AssemblyModelBuilder()
        let router = Router(navigationController: mainNavigationController, assemblyBuilder: assemblyBuilder)
        router.initialViewController()
        window = UIWindow(frame: UIScreen.main.bounds)
        window!.rootViewController = mainNavigationController
        window!.makeKeyAndVisible()
        return true
    }
    
}
