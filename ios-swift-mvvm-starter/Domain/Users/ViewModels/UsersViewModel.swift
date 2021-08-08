//
//  UsersViewModel.swift
//  ios-swift-mvvm-starter
//
//  Created by Hulk on 06/08/2021.
//

import Foundation

protocol UsersViewModelInput {
    func viewDidLoad()
    func getData(refresh: Bool)
    func getUserDetail(refresh: Bool)
}

protocol UsersViewModelOutput {
    var items: Observable<[User]> { get }
    var selectedUser: Observable<User?> { get }
    var loading: Observable<Bool> { get }
    var refreshing: Observable<Bool> { get }
}

class UsersViewModel {

    fileprivate var dataManager : UserRemoteDataManager!
    let loading: Observable<Bool> = Observable(false)
    let refreshing: Observable<Bool> = Observable(false)
    let items: Observable<[User]> = Observable([])
    let selectedUser: Observable<User?> = Observable(nil)
    
    
    init(dataManager: UserRemoteDataManager) {
        self.dataManager = dataManager
    }
    var count: Int {
        return self.items.value.count
    }

    func item(at index: Int) -> User {
        return self.items.value[index]
    }
    
}

extension UsersViewModel: UsersViewModelInput {
    func viewDidLoad() {
        
    }
    
    func getData(refresh: Bool) {
        if (!refresh) {
            self.loading.value = true
        }
        self.dataManager.fetchUsersList { _ in
        } completion: { result in
            if (refresh) {
                self.refreshing.value = false
            } else {
                self.loading.value = false
            }
            switch result {
            case .success(let users):
                self.items.value = users
            case .failure( _): break
               // Handle error
            }
        }
    }
    
    func getUserDetail(refresh: Bool) {
        if let user = self.selectedUser.value {
            if (!refresh) {
                self.loading.value = true
            }
            self.dataManager.getUser(id: user.id) { cachedUser in
                self.selectedUser.value = cachedUser
            } completion: { result in
                if (refresh) {
                    self.refreshing.value = false
                } else {
                    self.loading.value = false
                }
                switch result {
                case .success(let user):
                    self.selectedUser.value = user
                    
                case .failure( _): break
                   // Handle error
                }
            }
        }
    }
}
