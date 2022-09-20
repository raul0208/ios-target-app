//
//  AppDelegate.swift
//  ios-target-app
//
//  Created by Raul Piñeres Carrera on 6/09/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let rootVC = AppNavigator.shared.rootViewController
        window?.rootViewController = rootVC
        
        return true
    }
}

