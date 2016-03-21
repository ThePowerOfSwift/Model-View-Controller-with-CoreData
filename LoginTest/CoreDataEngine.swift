//
//  CoreDataEngine.swift
//  LoginTest
//
//  Created by Mihail Șalari on 21.03.2016.
//  Copyright © 2016 Mihail Șalari. All rights reserved.
//

import Foundation
import CoreData

class CoreDataEngine {
    
    var managedObjectContext = NSManagedObjectContext(concurrencyType: NSManagedObjectContextConcurrencyType.MainQueueConcurrencyType)
    
    //MARK: -Singleton
    class var sharedInstance: CoreDataEngine {
        struct Static {
            static var onceToken: dispatch_once_t = 0
            static var instance: CoreDataEngine? = nil
        }
        dispatch_once(&Static.onceToken) {
            Static.instance = CoreDataEngine()
        }
        return Static.instance!
    }
    
    
    init() {
        managedObjectContext = CoreDataManager.sharedInstance.managedObjectContext
    }
    
    
    func createuser(userM: UserModel) -> Bool {
        let entityDescription = NSEntityDescription.entityForName("User", inManagedObjectContext: managedObjectContext)
        let user = User(entity:entityDescription!, insertIntoManagedObjectContext: managedObjectContext)
        
        user.setValue(userM.username, forKey: "name")
        user.setValue(userM.password, forKey: "password")
        
        do {
            try managedObjectContext.save()
            print("-- User Got saved! --");
            return true
        } catch {
            // Replace this implementation with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            let nserror = error as NSError
            NSLog("Unresolved error \(nserror), \(nserror.userInfo)")
            abort()
        }
        
        return false
    }
    
    func checkUserAvailability() -> Bool {
        let entityDescription = NSEntityDescription.entityForName("User", inManagedObjectContext: managedObjectContext)
        let fetchRequest = NSFetchRequest()
        fetchRequest.entity = entityDescription
        
        do {
            let result = try managedObjectContext.executeFetchRequest(fetchRequest)
            if result.count == 0 {
                print("Data got empty values")
                return false
            } else {
                return true
            }
            
        } catch let error as NSError {
            print("Could not fetch \(error.userInfo)")
            abort()
        }
        
        return false
    }
    
    
    func loginUser(userM: UserModel) -> Bool {
        let entityDescription = NSEntityDescription.entityForName("User", inManagedObjectContext: managedObjectContext)
        let fetchRequest = NSFetchRequest()
        fetchRequest.predicate = NSPredicate(format: "%K==%@", "name", userM.username)
        fetchRequest.entity = entityDescription
        
        do {
            let result = try managedObjectContext.executeFetchRequest(fetchRequest)
            if result.count == 0 {
                print("Data got empty values")
                return false
            } else {
                return true
            }
            
        } catch let error as NSError {
            print("Could not fetch \(error.userInfo)")
        }
        
        return false
        
    }
    
    
    func deleteUser() {
        let entityDescription = NSEntityDescription.entityForName("User", inManagedObjectContext: managedObjectContext)
        let fetchRequest = NSFetchRequest()
        fetchRequest.entity = entityDescription
        do {
            let result = try managedObjectContext.executeFetchRequest(fetchRequest)
            if result.count == 0 {
                print("Ther's no users")
                return
            }
            
            let managedObject = result.first
            managedObjectContext.deleteObject(managedObject as! User)
            try managedObjectContext.save()
            print("User Deleted!")
            
        } catch let error as NSError {
            print("Could not fetch \(error.userInfo)")
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
