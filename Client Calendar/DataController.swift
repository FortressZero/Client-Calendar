//
//  DataController.swift
//  Client Calendar
//
//  Created by Joshua Lee on 8/28/22.
//

import CoreData
import Foundation

class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "ClientData")
    
    init() {
        container.loadPersistentStores { descriptoin, error in
            if let error = error {
                print("Core Data failed to load: \(error.localizedDescription)")
            }
            
            self.container.viewContext.mergePolicy = NSMergePolicy.mergeByPropertyObjectTrump
            // above prevents users accidentally adding two or more clients with the exact same first and last name
        }
    }
}
