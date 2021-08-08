//
//  UsersRemoteDataManager.swift
//  ios-swift-mvvm-starter
//
//  Created by Hulk on 06/08/2021.
//


import Foundation

final class UserRemoteDataManager {

    private let dataTransferService: DataTransferService
    private let cache: UserLocalDataManager

    init(dataTransferService: DataTransferService, cache: UserLocalDataManager) {
        self.dataTransferService = dataTransferService
        self.cache = cache
    }
}

extension UserRemoteDataManager {

    @discardableResult
    public func fetchUsersList(cached: @escaping ([User]) -> Void,
                                completion: @escaping (Result<[User], Error>) -> Void) -> Cancellable? {
        let endpoint = UsersAPIEndpoints.getUsers()
        let task = NetworkTask()
        cache.get(query: endpoint.path) { result in
            if case let .success(data) = result {
                if let jsonString = data,
                   let jsonData = jsonString.data(using: .utf8) {
                    do {
                        let users = try JSONDecoder().decode([User].self, from: jsonData)
                        cached(users)
                    } catch {
                       
                    }
                }
            }
            guard !task.isCancelled else { return }
            task.networkTask = self.dataTransferService.request(with: endpoint, completion: { result in
                switch result {
                case .success(let response):
                    if  let data = response
                        {
                        if let string =  String(data: data, encoding: .utf8) {
                            self.cache.save(response: string, for: endpoint.path)
                        }
                        do {
                            let users = try JSONDecoder().decode([User].self, from: data)
                            completion(.success(users))
                        } catch {
                            print(error)
                            completion(.failure(error))
                        }
                    }
                    
                case .failure(let error):
                    completion(.failure(error))
                }
            }
        )
            
        }
        
        return task
    }
    
    
    @discardableResult
    public func getUser(id: Int, cached: @escaping (User) -> Void,
                                completion: @escaping (Result<User, Error>) -> Void) -> Cancellable? {
        let endpoint = UsersAPIEndpoints.getUserDetail(userId: id)
        let task = NetworkTask()
        cache.get(query: endpoint.path) { result in
            if case let .success(data) = result {
                if let jsonString = data,
                   let jsonData = jsonString.data(using: .utf8) {
                    do {
                        let user = try JSONDecoder().decode(User.self, from: jsonData)
                        cached(user)
                    } catch {
                       
                    }
                }
            }
            guard !task.isCancelled else { return }
            task.networkTask = self.dataTransferService.request(with: endpoint, completion: { result in
                switch result {
                case .success(let response):
                    if  let data = response
                        {
                        if let string =  String(data: data, encoding: .utf8) {
                            self.cache.save(response: string, for: endpoint.path)
                        }
                        do {
                            let user = try JSONDecoder().decode(User.self, from: data)
                            completion(.success(user))
                        } catch {
                            print(error)
                            completion(.failure(error))
                        }
                    }
                    
                case .failure(let error):
                    completion(.failure(error))
                }
            }
        )
            
        }
        
        return task
    }
}
