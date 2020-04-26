//
//  NSManagedObjectContext+Extensions.swift
//  Mooskine
//
//  Created by Timi Tejumola on 25/04/2020.
//  Copyright © 2020 Udacity. All rights reserved.
//

import CoreData

extension NSManagedObjectContext {
    public func saveWithCheck() throws {
        if hasChanges {
            try save()
            print("Saved changes recorded")
        }else {
            print("No changes recorded")
        }
    }
}
