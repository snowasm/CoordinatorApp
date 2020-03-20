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

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        appCoordinator.start()
        
        return true
    }


    func makeCoordinator() -> Coordinatable {
        let coordinator = AppCoordinator(router: rootController)
        return coordinator
    }

}

