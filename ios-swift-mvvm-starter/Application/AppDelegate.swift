//
//  AppDelegate.swift
//  ios-swift-mvvm-starter
//
//  Created by Hulk on 06/08/2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    let appDIContainer = AppDIContainer()
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        if #available(iOS 13.0, *) {
           
        } else {
            window = UIWindow(frame: UIScreen.main.bounds)
            let appFlow = AppFlowCoordinator(appDIContainer: appDIContainer)
            appFlow.launch(on: window!)
            window?.makeKeyAndVisible()
            window?.backgroundColor = UIColor.white
            
        }
        // Override point for customization after application launch.
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
    }
    

}

