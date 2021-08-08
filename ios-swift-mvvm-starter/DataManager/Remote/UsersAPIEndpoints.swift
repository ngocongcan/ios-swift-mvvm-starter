//
//  APIEndpoints.swift
//  ios-swift-mvvm-starter
//
//  Created by Hulk on 06/08/2021.
//

import Foundation

struct UsersAPIEndpoints {
    
    static func getUsers() -> APIEndpoint<Void> {
        return APIEndpoint(path: "users", method: .get)
    }
    
    static func getUserDetail(userId: Int) -> APIEndpoint<Void> {
        return APIEndpoint(path: "users/\(userId)" , method: .get)
    }
}
