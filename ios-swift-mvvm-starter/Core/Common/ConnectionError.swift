//
//  ConnectionError.swift
//  ios-swift-mvvm-starter
//
//  Created by Hulk on 07/08/2021.
//

import Foundation

public protocol ConnectionError: Error {
    var isInternetConnectionError: Bool { get }
}

public extension Error {
    var isInternetConnectionError: Bool {
        guard let error = self as? ConnectionError, error.isInternetConnectionError else {
            return false
        }
        return true
    }
}
