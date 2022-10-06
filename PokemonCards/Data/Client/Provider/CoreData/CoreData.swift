//
//  CoreData.swift
//  PokemonCards
//
//  Created by Adam on 04/06/2022 
//

import CoreData

class CoreData {
  static var shared = CoreData()

  var context: NSManagedObjectContext {
    return persistentContainer.viewContext
  }

  private let containerName = "PokemonCards"
  lazy var persistentContainer: NSPersistentContainer = {
    let container = NSPersistentContainer(name: containerName)
    container.loadPersistentStores(completionHandler: { _, error in
      if let error = error as NSError? {
        debugPrint("Unresolved error \(error), \(error.userInfo)")
      }
    })
    return container
  }()

  public func saveContext() {
    let context = persistentContainer.viewContext
    if context.hasChanges {
      do {
        try context.save()
      } catch {
        let nserror = error as NSError
        debugPrint("Unresolved error \(nserror), \(nserror.userInfo)")
      }
    }
  }
}
