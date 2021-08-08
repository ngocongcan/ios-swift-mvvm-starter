//
//  SceneDelegate.swift
//  ios-swift-mvvm-starter
//
//  Created by Hulk on 06/08/2021.
//

import UIKit

@available(iOS 13.0, *)
class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    let appDIContainer = AppDIContainer()
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        let appFlow = AppFlowCoordinator(appDIContainer: appDIContainer)
        appFlow.launch(on: window!)
        window?.makeKeyAndVisible()
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        
    }

    func sceneWillResignActive(_ scene: UIScene) {
       
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
       
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        
    }


}

