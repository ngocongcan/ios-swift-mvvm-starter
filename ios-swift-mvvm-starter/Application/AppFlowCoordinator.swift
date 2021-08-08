//
//  AppFlowCoordinator.swift
//  ios-swift-mvvm-starter
//
//  Created by Hulk on 06/08/2021.
//

import UIKit

final class AppFlowCoordinator {

    private let appDIContainer: AppDIContainer
    
    init(appDIContainer: AppDIContainer) {
        self.appDIContainer = appDIContainer
    }

    func launch(on window: UIWindow) {
        let userModule = self.appDIContainer.makeUsersModule()
        let navCtr = UINavigationController.init(rootViewController: userModule.create())
        window.rootViewController = navCtr
    }
}
