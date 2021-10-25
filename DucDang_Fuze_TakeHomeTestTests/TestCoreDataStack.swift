//
//  TestCoreDataStack.swift
//  DucDang_Fuze_TakeHomeTestTests
//
//  Created by duc on 2021-10-24.
//

import Foundation
import CoreData

class TestCoreDataStack: NSObject {
    lazy var persistentContainer: NSPersistentContainer = {
        let description = NSPersistentStoreDescription()
        description.url = URL(fileURLWithPath: "/dev/null")
        let container = NSPersistentContainer(name: "DucDang_Fuze_TakeHomeTest")
        container.persistentStoreDescriptions = [description]
        container.loadPersistentStores { _, error in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
        return container
    }()
}
