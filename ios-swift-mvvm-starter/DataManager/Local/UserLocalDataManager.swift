//
//  UserLocalDataManager.swift
//  ios-swift-mvvm-starter
//
//  Created by Hulk on 06/08/2021.
//

import Foundation
import CoreData

final class UserLocalDataManager {
    private let coreDataStorage: CoreDataStorage

    init(coreDataStorage: CoreDataStorage = CoreDataStorage.shared) {
        self.coreDataStorage = coreDataStorage
    }

}

extension UserLocalDataManager {
    
    func get(query: String, completion: @escaping (Result<String?, Error>) -> Void) {
        
        coreDataStorage.performBackgroundTask { context in
            do {
                let request: NSFetchRequest = CDDataResponse.fetchRequest()
                request.sortDescriptors = [NSSortDescriptor(key: #keyPath(CDDataResponse.updatedAt),
                                                            ascending: false)]
                request.fetchLimit = 1
                let result = try context.fetch(request).first
                completion(.success(result?.toResponse()))
            } catch {
                completion(.failure(CoreDataStorageError.readError(error)))
            }
        }
    }
    
    func save(response data: String, for query: String) {
        coreDataStorage.performBackgroundTask { context in
            do {
                self.deleteQuery(for: query, in: context)
                let _ = CDDataResponse(query: query, response: data, insertInto: context)
                try context.save()
            } catch {
                // TODO: - Log to Crashlytics
                debugPrint("CoreDataMoviesResponseStorage Unresolved error \(error), \((error as NSError).userInfo)")
            }
        }
    }
}

// MARK: - Private
extension UserLocalDataManager {

    private func deleteQuery(for query: String, in context: NSManagedObjectContext) {
        let request: NSFetchRequest = CDDataResponse.fetchRequest()
        request.predicate = NSPredicate(format: "%K = %@",
                                        #keyPath(CDDataResponse.request), query)

        do {
            if let result = try context.fetch(request).first {
                context.delete(result)
            }
        } catch {
            print(error)
        }
    }
}

