//
//  CoreDataManager.swift
//  Best_Boy
//
//  Created by Harry E. Pray IV on 7/17/16.
//  Copyright © 2016 harryprayiv.com. All rights reserved.
//
import CoreData
import Foundation

public class CoreDataManager {
    
    private let modelName: String
    
    init(modelName: String) {
        self.modelName = modelName
    }
    
    // MARK: - Core Data Stack
    
    public private(set) lazy var managedObjectContext: NSManagedObjectContext = {
        // Initialize Managed Object Context
        let managedObjectContext = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
        
        // Configure Managed Object Context
        managedObjectContext.persistentStoreCoordinator = self.persistentStoreCoordinator
        
        return managedObjectContext
    }()
    
    private lazy var managedObjectModel: NSManagedObjectModel? = {
        // Fetch Model URL
        guard let modelURL = Bundle.main.urlForResource(self.modelName, withExtension: "momd") else {
            return nil
        }
        
        // Initialize Managed Object Model
        let managedObjectModel = NSManagedObjectModel(contentsOf: modelURL)
        
        return managedObjectModel
    }()
    
    private lazy var persistentStoreCoordinator: NSPersistentStoreCoordinator? = {
        guard let managedObjectModel = self.managedObjectModel else {
            return nil
        }
        
        // Helper
        let persistentStoreURL = self.persistentStoreURL
        
        // Initialize Persistent Store Coordinator
        let persistentStoreCoordinator = NSPersistentStoreCoordinator(managedObjectModel: managedObjectModel)
        
        do {
            let options = [ NSMigratePersistentStoresAutomaticallyOption : true, NSInferMappingModelAutomaticallyOption : true ]
            try persistentStoreCoordinator.addPersistentStore(ofType: NSSQLiteStoreType, configurationName: nil, at: persistentStoreURL as URL, options: options)
            
        } catch {
            let addPersistentStoreError = error as NSError
            
            print("Unable to Add Persistent Store")
            print("\(addPersistentStoreError.localizedDescription)")
        }
        
        return persistentStoreCoordinator
    }()
    
    // MARK: - Helper Methods
    
    private var persistentStoreURL: NSURL {
        // Helpers
        let storeName = "\(modelName).sqlite"
        let fileManager = FileManager.;default
        
        let documentsDirectoryURL = fileManager.urlsForDirectory(.documentDirectory, inDomains: .userDomainMask)[0]
        
        return documentsDirectoryURL.stringByAppendingPathComponent(storeName)
    }
    
}
