//
//  DataController.swift
//  Mooskine
//
//  Created by Timi Tejumola on 25/04/2020.
//  Copyright © 2020 Udacity. All rights reserved.
//

import Foundation
import CoreData

class DataController {
    let persistentContainer: NSPersistentContainer
    
    var viewContext:NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    init(modelName: String) {
        persistentContainer = NSPersistentContainer(name: modelName)
    }
    
    func load(completion: (()->Void)? = nil){
        persistentContainer.loadPersistentStores { (storeDescription, error) in
            guard error == nil else {
                fatalError(error!.localizedDescription)
            }
            self.autosaveViewContext()
            completion?()
        }
    }
}

extension DataController {
    func autosaveViewContext(interval:TimeInterval = 30){
        guard interval > 0 else {
            print("cannot set negative autosave interval")
            return
        }
        try? viewContext.saveWithCheck()
        DispatchQueue.main.asyncAfter(deadline: .now() + interval) {
            self.autosaveViewContext(interval: interval)
        }
    }
}
