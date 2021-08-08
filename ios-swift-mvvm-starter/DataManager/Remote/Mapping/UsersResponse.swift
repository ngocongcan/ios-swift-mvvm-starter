//
//  UsersResponse.swift
//  ios-swift-mvvm-starter
//
//  Created by Hulk on 07/08/2021.
//

import Foundation
import CoreData


// MARK: - Private
private let dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd"
    formatter.calendar = Calendar(identifier: .iso8601)
    formatter.timeZone = TimeZone(secondsFromGMT: 0)
    formatter.locale = Locale(identifier: "en_US_POSIX")
    return formatter
}()


extension CDDataResponse {
    convenience init(query: String, response: String , insertInto context: NSManagedObjectContext) {
        self.init(context: context)
        request = query
        data = response
        updatedAt = Date()
    }
}

extension CDDataResponse {
    func toResponse() -> String? {
        return self.data
    }
}

