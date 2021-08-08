//
//  AppDIContainer.swift
//  ios-swift-mvvm-starter
//
//  Created by Hulk on 07/08/2021.
//

import Foundation


final class AppDIContainer {
    
    lazy var appConfiguration = AppConfiguration()
    
    // MARK: - Network
    lazy var apiDataTransferService: DataTransferService = {
        let config = ApiDataNetworkConfig(baseURL: URL(string: appConfiguration.apiBaseURL)!,
                                          queryParameters: [:])
        
        let apiDataNetwork = DefaultNetworkService(config: config)
        return DefaultDataTransferService(with: apiDataNetwork)
    }()
    
    lazy var imageDataTransferService: DataTransferService = {
        let config = ApiDataNetworkConfig(baseURL: URL(string: appConfiguration.imagesBaseURL)!)
        let imagesDataNetwork = DefaultNetworkService(config: config)
        return DefaultDataTransferService(with: imagesDataNetwork)
    }()
    
    func makeUsersModule() -> UsersModule {
        let dependencies = UsersModule.Dependencies(apiDataTransferService: apiDataTransferService,
                                                               imageDataTransferService: imageDataTransferService)
        return UsersModule(dependencies: dependencies)
    }
    
}
