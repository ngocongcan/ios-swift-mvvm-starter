//
//  NetworkTask.swift
//  ios-swift-mvvm-starter
//
//  Created by Hulk on 07/08/2021.
//

import Foundation

class NetworkTask: Cancellable {
    var networkTask: NetworkCancellable?
    var isCancelled: Bool = false
    
    func cancel() {
        networkTask?.cancel()
        isCancelled = true
    }
}
