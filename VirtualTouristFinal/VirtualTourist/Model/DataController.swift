//
//  DataController.swift
//  VirtualTourist
//
//  Created by Ahmad on 25/07/2019.
//  Copyright © 2019 ahmad. All rights reserved.
//
import CoreData

class DataController{
    static let instance = DataController()
    
    let persistentContainer = NSPersistentContainer(name: "VirtualTourist")
    
    var viewContext : NSManagedObjectContext{
        return persistentContainer.viewContext
    }
    
    func loadData() {
        persistentContainer.loadPersistentStores { (storeDesc, error) in
            if error != nil {
                fatalError(error!.localizedDescription)
            }
        }
    }
}
