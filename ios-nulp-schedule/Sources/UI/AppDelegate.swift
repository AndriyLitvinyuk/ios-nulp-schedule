//
//  AppDelegate.swift
//  ios-nulp-schedule
//
//  Created by Andrii Lytvyniuk on 14.10.2022.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    lazy var window: UIWindow? = {
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.makeKeyAndVisible()
        return window
    }()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let serviceProvider = ServiceProvider()
        let coordinator = OriginCoordinator(
            window: self.window,
            navigationController: NavigationController(),
            serviceProvider: serviceProvider
        )
        coordinator.start()
        return true
    }
}

