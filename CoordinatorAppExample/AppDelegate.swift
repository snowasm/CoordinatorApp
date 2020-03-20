//
//  AppDelegate.swift
//  CoordinatorAppExample
//
//  Created by Александр on 17.03.2020.
//  Copyright © 2020 Александр. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    var rootController: UINavigationController {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = UINavigationController()
        window?.rootViewController?.view.backgroundColor = .blue
        window?.makeKeyAndVisible()
        return window?.rootViewController as! UINavigationController
    }
    
    lazy var appCoordinator: Coordinatable = self.makeCoordinator()
    var date: Date?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        appCoordinator.start()
        
        return true
    }


    func makeCoordinator() -> Coordinatable {
        let coordinator = AppCoordinator(router: rootController)
        return coordinator
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        date = Date()
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        guard let date = self.date else { return }
        let timeInBackground = Date().timeIntervalSince(date)
        if timeInBackground > 5 {
            (appCoordinator as! AppCoordinator).awake()
        }
    }

}

