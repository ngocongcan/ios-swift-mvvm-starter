//
//  UsersWireframe.swift
//  ios-swift-mvvm-starter
//
//  Created by Hulk on 07/08/2021.
//


import Foundation
import UIKit

final class UsersModule {
    
    struct Dependencies {
        let apiDataTransferService: DataTransferService
        let imageDataTransferService: DataTransferService
    }
    
    private let dependencies: Dependencies

    // MARK: - Persistent Storage
    lazy var localDataManager: UserLocalDataManager = UserLocalDataManager()

    init(dependencies: Dependencies) {
        self.dependencies = dependencies
    }
    
    // MARK: - Use Cases
    func makeRemoteDataManager() -> UserRemoteDataManager {
        return UserRemoteDataManager(dataTransferService: dependencies.apiDataTransferService, cache: self.localDataManager)
    }
    
    func create() -> UIViewController {
        if let usersVC = UsersModule.UsersStoryboard.instantiateViewController(withIdentifier: "UsersViewController") as? UsersViewController {
            usersVC.viewModel = UsersViewModel(dataManager: self.makeRemoteDataManager())
            return usersVC
        }
        
        return UIViewController()
    }
    
    static func createUserDetailVC() -> UIViewController {

        guard let viewController = UsersStoryboard.instantiateViewController(withIdentifier: "UserDetailViewController") as? UserDetailViewController else {
            return UIViewController()
        }
        
        return viewController
    }
    

    static var UsersStoryboard: UIStoryboard {
        return UIStoryboard(name: "Users", bundle: Bundle.main)
    }

}
