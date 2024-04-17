//
//  DataService.swift
//  Restaurant
//
//  Created by MAC on 4/8/24.
//

import Foundation
import CoreData

final class Provider {
    
    static let shared = Provider()
    private let container:NSPersistentContainer
    
    var viewContext: NSManagedObjectContext {
        container.viewContext
    }
    
    var newContext:NSManagedObjectContext {
        container.newBackgroundContext()
    }
    
    private init () {
        
        //where we take our local data
        container = NSPersistentContainer(name: "LocalData") // name of coredata file
        container.viewContext.automaticallyMergesChangesFromParent = true //every time a change occurs, we save it to a file
        container.loadPersistentStores { _, error in //load coredata file
            if let error {
                fatalError("error in init() Provider, Unable to load store with error: \(error)")
            }
            self.container.viewContext.mergePolicy = NSMergePolicy.mergeByPropertyObjectTrump
        }
    }
    
    func persist(in context:NSManagedObjectContext) {
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("error in func persist() Provider unresolved error \(nserror), userInfo \(nserror.userInfo)")
            }
        }
    }
}
